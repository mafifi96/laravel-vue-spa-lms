<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\StudentResource;
use App\Http\Resources\CourseResource;

class GradeResource extends JsonResource
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
            'maxDegree' => $this->maxDegree,
            'course' => (new CourseResource($this->course)),
            'students' => StudentResource::collection($this->students),
            'students_count' => $this->student()->count()
        ];
    }
}
