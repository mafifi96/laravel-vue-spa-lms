<?php

namespace Database\Seeders;

use App\Models\Course;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class CourseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // for dummy names

       //Course::factory()->count(5)->create();

       // for real names

        $coursesNames = collect(['learn php', 'learn laravel', 'learn vuejs', 'learn javascript', 'learn mongoDB']);

        $coursesNames->each(function($course){
            Course::create([
                'name' => $course,
                'code' => uid(),
                'description' => fake()->paragraph()
            ]);
        });
    }
}
