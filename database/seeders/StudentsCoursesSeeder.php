<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Course;
use App\Models\Student;

class StudentsCoursesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

        $Courses = Course::all('id');
        $students = Student::all('id');

        $Courses->each(function($Course) use ($students){

            $Course->students()->syncWithoutDetaching($students);

        });

    }
}
