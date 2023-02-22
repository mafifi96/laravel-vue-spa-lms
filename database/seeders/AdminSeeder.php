<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use Illuminate\Support\Str;

class AdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        User::create([
            'name' => 'admin',
            'email'=> 'admin@admin.com',
            'password' => /* admin123*/ Hash::make("admin123"),
            'email_verified_at' => now(),
            'remember_token' => Str::random(10),
        ]);
    }
}
