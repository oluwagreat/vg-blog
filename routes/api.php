<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\BlogController;
use App\Http\Controllers\PostController;
use App\Http\Controllers\InteractionController;



Route::group(['prefix' => 'v1'], function () {

    //Test endpoint
    Route::get('/test', function (Request $request) {
    return response()->json(
        [
            'status' => true,
            'message' => 'API is working',
            'data' => new \stdClass,
            'errors' => new \stdClass
        ]
    );
    
});

//VG-Blog API Routes
    Route::resource('blogs', BlogController::class);
    Route::resource('blogs.posts', PostController::class);
    Route::post('posts/{post}/like', [InteractionController::class, 'likePost']);
    Route::post('posts/{post}/comment', [InteractionController::class, 'commentPost']);
});


