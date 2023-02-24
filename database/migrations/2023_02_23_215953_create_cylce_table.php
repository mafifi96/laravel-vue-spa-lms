<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cylce', function (Blueprint $table) {
            $table->id();
            $table->foreignId("student_id")->constrained("students")->cascadeOnUpdate();
            $table->foreignId("course_id")->constrained("courses")->cascadeOnUpdate();
            $table->foreignId("grade_id")->constrained("grades")->cascadeOnUpdate();
            $table->smallInteger("degree")->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('cylce');
    }
};
