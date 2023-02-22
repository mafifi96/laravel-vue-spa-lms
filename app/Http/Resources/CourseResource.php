<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Auth;
use App\Http\Resources\GradeResource;
use App\Http\Resources\StudentResource;

class CourseResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'name' => $this->name,
            'code' => $this->code,
            'description' => $this->description,

            'students' =>  StudentResource::collection($this->students),
            'grades' =>  GradeResource::collection($this->grades),
            'student_count' => $this->students()->count(),
            'grades_count' => $this->grades()->count(),
            'created_at' => $this->created_at
        ];
    }
}
