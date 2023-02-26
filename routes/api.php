<?php


use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\{
    StudentController,
    CourseController,
    DashboardController,
    GradeController,
    LevelController,
};



/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::get('/dashboard' , DashboardController::class);
Route::apiResource('courses' , CourseController::class);
Route::apiResource('grades' , GradeController::class);
Route::apiResource('students' , StudentController::class);
Route::apiResource('levels' , LevelController::class);
Route::post('/course/enroll' , [CourseController::class , 'enroll']);
Route::post('/course/disenroll' , [CourseController::class , 'disenroll']);
Route::get("/courses/{course}/students/{student}", [CourseController::class , 'StudentCourse']);
Route::post("/students/{student}/grades" , [StudentController::class , 'gradesCreate']);
