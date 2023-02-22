<?php

namespace Database\Seeders;

use App\Models\Level;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class StudentSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Level::all()->each(function($level){
            $level->students()->create([
                'code' => uid(),
                'name' => fake()->name(),
                'email' => fake()->safeEmail(),
                'birth' => fake()->date()
            ]);
        });
    }
}
