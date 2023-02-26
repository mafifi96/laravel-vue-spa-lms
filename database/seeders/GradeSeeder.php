<?php

namespace Database\Seeders;

use App\Models\Course;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class GradeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $grades = ['quize','oral','midterm' , 'final'];

        Course::all()->each(function($course) use ($grades){

            $course->grades()->create([
                'name' => fake()->randomElement($grades),
                'maxDegree' => fake()->randomElement([10,20,30,40,50,100])
            ]);
        });
    }
}
