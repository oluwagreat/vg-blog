<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class PostResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'title' => $this->title,
            'slug' => $this->slug,
            'content' => $this->content,
            'image_url' => $this->image_url,
            'status' => $this->status,
            'blog_id' => $this->blog_id,
            'date_created' => $this->created_at->toDateTimeString(),
            'last_updated' => $this->updated_at->toDateTimeString(),
        ];
    }
}
