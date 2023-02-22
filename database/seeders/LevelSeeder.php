<?php

namespace Database\Seeders;

use App\Models\Level;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class LevelSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $levels = collect(['level 1' , 'level 2' , 'level 3' , 'level 4']);

        $levels->each(function($level){
            Level::create([
                'name' => $level,
                'code' => uid(),
                'description' => fake()->paragraph()
            ]);
        });
    }
}
