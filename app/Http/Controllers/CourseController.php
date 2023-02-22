<?php

namespace App\Http\Controllers;

use App\Models\Course;
use App\Http\Requests\CourseRequest;
use App\Http\Resources\CourseResource;
use App\Models\Student;
use Illuminate\Http\Request;

class CourseController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        //return CourseResource::collection(Course::all());

        return response()->json(['courses' => Course::withCount(['students','grades'])->get()]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(CourseRequest $request)
    {
        $validated = $request->validated();

        $course = Course::create(array_merge($validated , ['code' => uid()]));

        return sendData(data : $course , message: "course stored successfully");
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $course = Course::findOrFail($id)->load(['students' , 'grades'])->loadCount(['students','grades']);

        return sendData($course);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(CourseRequest $request,Course $course)
    {

        $validated = $request->validated();

        $course->update($validated);

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

        $course->students()->sync($student);

        return sendData(message:"enrolled successfully");

    }

    public function disenroll(Request $request)
    {
        $course = Course::findOrFail($request->course_id);

        $student = Student::findOrFail($request->student_id);

        $course->students()->detach($student);

        return sendData(message:"the student is no longer in this course");

    }


}
