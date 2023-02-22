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
        $grades = ['pracical exam','oral exam','midterm exam' , 'final exam'];

        Course::all()->each(function($course) use ($grades){

            collect($grades)->each(function($grade) use ($course){
                $course->grades()->create([
                    'name'=> $grade,
                    'maxDegree' => fake()->randomElement([50,100])
                ]);
                
            });
        });
    }
}
