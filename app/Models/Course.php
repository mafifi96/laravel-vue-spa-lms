<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Student;
use App\Models\Grade;

class Course extends Model
{
    use HasFactory;

    protected $guarded = [];

    protected $table = 'courses';

    public function students()
    {
        return $this->belongsToMany(Student::class , 'students_courses')->withTimestamps();
    }

    public function grades()
    {
        return $this->hasMany(Grade::class);
    }
}
