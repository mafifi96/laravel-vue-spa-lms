<?php

namespace App\Http\Controllers;

use App\Models\Student;
use Illuminate\Http\Request;
use App\Http\Requests\StudentRequest;
use App\Models\Course;
use Yajra\DataTables\Facades\DataTables;
use App\Http\Requests\UpdateStudentRequest;

class StudentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $students = Student::with(['level'])->get()->loadCount('courses');

        return datatables($students)->make(true);

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StudentRequest $request)
    {

        $validated = $request->validated();

        Student::create(array_merge($validated , ['code' => uid()]));

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Student $student)
    {
        return sendData($student->load(['courses:id,name' , 'level:id,name'])->loadCount('courses'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateStudentRequest $request, Student $student)
    {
        $validated = $request->validated();

        $student->update($validated);

        return sendData();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Student $student)
    {
        $student->delete();
    }

    public function gradesCreate(Request $request , Student $student)
    {

        foreach($request->grades as $grade)
        {
            $student->grades()->syncWithoutDetaching([ $grade['id'] => ['degree' => $grade['maxDegree']]]);
        }

        return $student->grades->sum('pivot.degree');
    }

}
