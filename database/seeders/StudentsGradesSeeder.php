<?php

namespace Database\Seeders;

use App\Models\Course;
use App\Models\Grade;
use App\Models\Student;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class StudentsGradesSeeder extends Seeder
{


    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $grades = Grade::all('id');
        $students = Student::all('id');

        $grades->each(function($grade) use ($students){

            $grade->students()->syncWithPivotValues($students , ['degree' => fake()->randomElement([40,45,100])]);

        });

    }
}
