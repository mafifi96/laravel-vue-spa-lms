<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Student;
use App\Models\Course;

class Grade extends Model
{
    use HasFactory;

                /**
     * The attributes that should be cast.
     *
     * @var array
     */

     protected $casts = [
        'created_at' => 'datetime:M , d / Y',
    ];


    protected $guarded = [];

    public function course()
    {
        return $this->belongsTo(Course::class);
    }

    public function students()
    {
        return $this->belongsToMany(Student::class , 'students_grades')->withPivot('degree')->withTimestamps();
    }
}
