<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;

use Illuminate\Database\Seeder;
use Database\Seeders\{
    AdminSeeder,
    CourseSeeder,
    LevelSeeder,
    GradeSeeder,
    StudentSeeder,
    StudentsCoursesSeeder,
    StudentsGradesSeeder
};

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {

        $this->call([
            AdminSeeder::class,
            CourseSeeder::class,
            LevelSeeder::class,
            GradeSeeder::class,
            StudentSeeder::class,
            StudentsCoursesSeeder::class,
            StudentsGradesSeeder::class
        ]);


    }
}
