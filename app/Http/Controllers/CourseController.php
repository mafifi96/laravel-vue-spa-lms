<?php

namespace App\Http\Controllers;

use App\Models\Course;
use App\Http\Requests\CourseRequest;
use App\Http\Resources\CourseResource;
use App\Models\Grade;
use App\Models\Student;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;
use App\Http\Requests\UpdateCoursRequest;

class CourseController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {

        if ($request->hasHeader('x-students')) {
            return sendData(Course::withCount(['students', 'grades'])->get());
        }

        return datatables(Course::withCount(['students', 'grades'])->get())->make(true);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(CourseRequest $request)
    {

        //return $request->validated();

        $validated = $request->validated();

        $course = Course::create([
            'code' => uid(),
            'name' => $validated['name'],
            'description' => $validated['description']
        ]);

        if ($request->has('grades')) {
            $course->grades()->createMany($validated['grades']);
        }

        return sendData($course);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Course $course)
    {

        if (request()->hasHeader('x-edit')) {

            $grades = Grade::WhereBelongsTo($course)->get();

            $grades->load('students:id,code,name');

            return sendData(['course' => $course->loadCount(['students', 'grades']), 'grades' => $grades]);
        }

        return sendData(['course' => $course->load(['grades.students', 'students'])->loadCount(['students', 'grades'])]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateCoursRequest $request, Course $course)
    {


        $validated = $request->validated();

        $course->update([
            'name' => $validated['name'],
            'description' => $validated['description']
        ]);

        if (!empty($validated['grades'])) {


            collect($validated['grades'])->each(function ($grade) use ($course) {

                if ($course->grades->find($grade['id'])) {
                    $course->grades->find($grade['id'])->update($grade);
                } else {
                    $course->grades()->create($grade);
                    $course->students()->each(function($student) use ($grades){

                        $student->grades()->syncWithoutDetaching([ $grades->id => ['degree' => 0]]);

                    });
                }
            });
        }

        return sendData(message: "updated successfully");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Course $course)
    {
        $course->delete();
    }

    public function enroll(Request $request)
    {
        $course = Course::findOrFail($request->course_id);

        $student = Student::findOrFail($request->student_id);

        $course->students()->syncWithoutDetaching($student);

        return sendData(message: "enrolled successfully");
    }

    public function disenroll(Request $request)
    {
        $course = Course::findOrFail($request->course_id);

        $student = Student::findOrFail($request->student_id);

        $course->students()->detach($student);

        return sendData(message: "the student is no longer in this course");
    }

    public function StudentCourse(Course $course, Student $student)
    {
        $grades = $course->grades;

        return sendData(['course' => $course, 'grades' => $grades, 'student' => $student]);
    }
}
