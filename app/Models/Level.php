<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Student;

class Level extends Model
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

    public function students()
    {
        return $this->hasMany(Student::class);
    }
}
