<?php

namespace App\Http\Controllers;

use App\Http\Resources\PostCommentsResource;
use App\Models\Blog;
use App\Models\Post;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use App\Http\Resources\PostResource;
use Illuminate\Support\Facades\Validator;

class PostController extends Controller
{
    // Fetch all posts under a specific blog
    public function index($blog_id)
    {
        try {
            $blog = Blog::find($blog_id);
            if (!$blog) {
                return $this->error([], "Blog not found", [], 404);
            }

            $query = $blog->posts()->latest();

            // Paginate the results
            $posts = $query->paginate(20);

            $posts = PostResource::collection($posts);

            return $this->success([
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

            ], 'Blog posts fetched successfully');

        } catch (\Exception $e) {
            Log::error("Error while fetching blog: " . $e->getMessage());
            return $this->error([],"Error while fetching blog", $e->getMessage(), 500);
        }
       
    }

    // Create a new post under a specific blog
    public function store(Request $request, $blog_id)
    {
        $validator = Validator::make($request->all(),[
            'title' => 'required|string|max:255',
            'content' => 'required|string',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        if ($validator->fails()) {
            return $this->error([],$validator->errors()->first(), $validator->errors(), 422);
        }

        try {
            //fetch blog
        $blog = Blog::find($blog_id);
        if (!$blog) {
            return $this->error([], "Blog not found", [], 404);
        }
        
        //create post
        DB::beginTransaction();      
                
        $post = $blog->posts()->create(
            [
                'title' => $request->title, 
                'content' => $request->content, 
                'slug' => Str::slug($request->title),
            ]);

            if ($request->hasFile('image') && $request->file('image')->isValid()) {
                $image = $request->file('image');
                $newImageName = $post->slug . '-' . uniqid() . '.' . $image->extension();
                $image->move(public_path('post-images'), $newImageName);
                $image_path = 'post-images/' . $newImageName;
                $image_path = url('public/' . $image_path);
                $post->image_url = $image_path;
                $post->save();
            }

        DB::commit();

        return $this->success(["post" => $post], "Post created successfully", 201);

    } catch (\Exception $e) {
        DB::rollBack();
        Log::error("Error creating post: " . $e->getMessage());
        return $this->error([],"Error creating post: ". $e->getMessage(), [], 500);
    }
    }

    // Fetch details of a specific post
    public function show($blog_id, $id)
    {
        try{
            
        $post = Post::with(['comments', 'likes'])->where('blog_id', $blog_id)->findOrFail($id);

        $post = new PostCommentsResource($post);

        return $this->success(["post" => $post], "Post fetched successfully");

        } catch (\Exception $e) {
            Log::error("Error while fetching post: " . $e->getMessage());
            return $this->error([],"Error while fetching post", $e->getMessage(), 500);
        }
        return response()->json(['data' => $post], 200);
    }

    // Update an existing post
    public function update(Request $request, $blog_id, $id)
    {
        $post = Post::where('blog_id', $blog_id)->findOrFail($id);

        $validator = Validator::make($request->all(),[
            'title' => 'sometimes|string|max:255',
            'content' => 'sometimes|string',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        if ($validator->fails()) {
            return $this->error([],$validator->errors()->first(), $validator->errors(), 422);
        }

        $post->update(
            [
                'title' => isset($request->title) ? $request->title : $post->title, 
                'content' => isset($request->content) ? $request->content : $post->content, 
                'slug' => isset($request->title) ? Str::slug($request->title) : $post->slug
            ]
        );

        if ($request->hasFile('image') && $request->file('image')->isValid()) {
            $image = $request->file('image');
            $newImageName = $post->slug . '-' . uniqid() . '.' . $image->extension();
            $image->move(public_path('post-images'), $newImageName);
            $image_path = 'post-images/' . $newImageName;
            $image_path = url('public/' . $image_path);
            $post->image_url = $image_path;
            $post->save();
        }

        return $this->success(["post" => $post], "Post updated successfully", 200);
    }

    // Delete a post
    public function destroy($blog_id, $id)
    {
        $post = Post::where('blog_id', $blog_id)->findOrFail($id);
        $post->delete();

        return $this->success([], "Post deleted successfully", 200);
    }
}
