<?php

namespace App\Http\Controllers;

use App\Models\Like;
use App\Models\Post;
use App\Models\Comment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;

class InteractionController extends Controller
{
    // Like a post
    public function likePost(Request $request, $postId)
    {
        try{
        $post = Post::findOrFail($postId);
        $like = Like::firstOrCreate([
            'post_id' => $post->id,
            'user_id' => 1, // This is just a placeholder, it will be replaced with the authenticated user's ID
        ]);

        return $this->success(['like' => $like], "Like recorded", 201);
    }
    catch(\Exception $e){
        Log::error("Error during post like ". $e->getMessage());
        return $this->error([], "An error occured while liking post", $e->getMessage(),500);
        
    }
    }

    // Comment on a post
    public function commentPost(Request $request, $postId)
    {
        $validator = Validator::make($request->all(),[
            'content' => 'required|string',
        ]);

        if ($validator->fails()) {
            return $this->error([],$validator->errors()->first(), $validator->errors(), 422);
        }

        try{
        $post = Post::findOrFail($postId);

        $comment = $post->comments()->create([
            'user_id' => 1, // This is just a placeholder, it will be replaced with the authenticated user's ID
            'content' => $request->content,
        ]);

        return $this->success(['comment' => $comment], "Comment recorded", 201);
        
    }
    catch(\Exception $e){
        Log::error("Error during post comment ". $e->getMessage());
        return $this->error([], "An error occured while commenting on post", $e->getMessage(),500);
    }

}

}
