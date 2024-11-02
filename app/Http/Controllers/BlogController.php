<?php

namespace App\Http\Controllers;

use App\Models\Blog;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use App\Http\Resources\BlogResource;
use App\Http\Resources\PostResource;
use Illuminate\Support\Facades\Validator;

class BlogController extends Controller
{
    // Fetch all blogs
    public function index()
    {
        try {
            $query = Blog::latest();
            $blogs = $query->paginate(20);

            

            return $this->success([
                'blogs' => $blogs->items(),
                'pagination' => [
                    'current_page' => $blogs->currentPage(),
                    'last_page' => $blogs->lastPage(),
                    'per_page' => $blogs->perPage(),
                    'total' => $blogs->total(),
                    'first' => $blogs->url(1),
                    'last' => $blogs->url($blogs->lastPage()),
                    'prev' => $blogs->previousPageUrl(),
                    'next' => $blogs->nextPageUrl(),
                ]

            ], 'Blogs fetched successfully');
        }catch(\Exception $e) {
            Log::error("Error while fetching blogs: " . $e->getMessage());
            return $this->error([],"Error while fetching blogs", $e->getMessage(), 500);
        }
    }

    // Create a new blog
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(),[
            'name' => 'required|string|max:255|unique:blogs,name',
            'description' => 'required|string',
        ]);

        if ($validator->fails()) {
            return $this->error([], $validator->errors()->first(), $validator->errors(), 422);
        }

        try {
            $blog = Blog::create([
            'name' => $request->name,
            'description' => $request->description,
            'slug' => Str::slug($request->name),
        ]);

            return $this->success(['blog' => $blog], 'Blog created successfully', 201);
        } catch (\Exception $e) {
            Log::error("Error while creating blog: " . $e->getMessage());
            return $this->error([],"Error while creating blog", $e->getMessage(), 500);
        }

        
    }

    // Fetch details of a specific blog
    public function show($id)
    {
        try{
        $blog = Blog::findOrFail($id);
        $query = $blog->posts()->latest();
        
            // Paginate the results

            $posts = $query->paginate(20);

            $posts = PostResource::collection($posts);

            return $this->success([
                'blog' => $blog,
                'posts' => $posts,
                'pagination' => [
                    'current_page' => $posts->currentPage(),
                    'last_page' => $posts->lastPage(),
                    'per_page' => $posts->perPage(),
                    'total' => $posts->total(),
                    'first' => $posts->url(1),
                    'last' => $posts->url($posts->lastPage()),
                    'prev' => $posts->previousPageUrl(),
                    'next' => $posts->nextPageUrl(),
                ]

            ], 'Blog fetched successfully');

        }catch(\Exception $e) {
            Log::error("Error while fetching blog: " . $e->getMessage());
            return $this->error([],"Error while fetching blog", $e->getMessage(), 500);
        }
    }

    // Update an existing blog
    public function update(Request $request, $id)
    {
        try{
        $blog = Blog::findOrFail($id);

        $validator = Validator::make($request->all(),[
            'name' => 'sometimes|string|max:255',
            'description' => 'sometimes|string',
        ]);

        if ($validator->fails()) {
            return $this->error([], $validator->errors()->first(), $validator->errors(), 422);
        }

        $blog->update([
            'name' => isset($request->name) ? $request->name : $blog->name,
            'description' => isset($request->description) ? $request->description : $blog->description,
            'slug' => isset($request->name) ? Str::slug($request->name) : $blog->slug,
        ]);

        return $this->success(['blog' => $blog], 'Blog updated successfully');

        }catch(\Exception $e) {
            Log::error("Error while updating blog: " . $e->getMessage());
            return $this->error([],"Error while updating blog", $e->getMessage(), 500);
        }
    }

    // Delete a blog
    public function destroy($id)
    {
        try{
            $blog = Blog::findOrFail($id);
            $blog->delete();

            return $this->success([], 'Blog deleted successfully');
        }catch(\Exception $e) {
            Log::error("Error while deleting blog: " . $e->getMessage());
            return $this->error([],"Error while deleting blog", $e->getMessage(), 500);
        }
        
    }
}
