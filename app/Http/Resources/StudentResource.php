<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\CourseResource;
use App\Http\Resources\LevelResource;

class StudentResource extends JsonResource
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
            'id' => $this->id,
            'code' => $this->code,
            'name' => $this->name,
            'email' => $this->email,
            'birth' => $this->birth,
            'courses' => CourseResource::collection($this->courses()->grades()),
            /* 'grades' => GradeResource::collection($this->grades()), */
            'level' => (new LevelResource($this->level)),
            'created_at' => $this->created_at
        ];
    }
}
