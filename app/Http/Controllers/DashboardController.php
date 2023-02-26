<?php

namespace App\Http\Controllers;

use App\Models\Course;
use App\Models\Level;
use App\Models\Student;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    /*
    get dashboard statistics
    */

    public function __invoke()
    {
        $courses = Course::count();

        $students = Student::count();

        $levels = Level::count();

        // next updates for the system

        //$teacher = [];

        return sendData(['courses' => $courses , 'students' => $students , 'levels' => $levels]);
    }
}
