<?php


use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\{
    StudentController,
    CourseController,
    GradeController,
    LevelController
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


Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::apiResource('courses' , CourseController::class);
Route::apiResource('grades' , GradeController::class);
Route::apiResource('students' , StudentController::class);
Route::apiResource('levels' , LevelController::class);

Route::post('/course/enroll' , [CourseController::class , 'enroll']);
Route::post('/course/disenroll' , [CourseController::class , 'disenroll']);
