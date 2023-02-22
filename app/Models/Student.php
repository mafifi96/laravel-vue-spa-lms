<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Course;
use App\Models\Grade;
use App\Models\Level;

class Student extends Model
{
    use HasFactory;

    protected $guarded = [];

   //protected $table = 'students';

   public function courses()
   {
    return $this->belongsToMany(Course::class , 'students_courses')->withTimestamps();
   }

   public function grades()
   {
    return $this->belongsToMany(Grade::class , 'students_grades')->withTimestamps();
   }

   public function level()
   {
    return $this->belongsTo(Level::class);
   }

}
