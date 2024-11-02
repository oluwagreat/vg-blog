<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class TokenMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        // Check if the request contains the correct token
        $token = $request->header('Authorization');
        $correctToken = config('app.token');

        if ($token !== $correctToken) {
            return response()->json([
                'status' => false,
                'message' => 'Unauthorized access - invalid token',
                'data' => new \stdClass,
                'errors' => new \stdClass
            ], Response::HTTP_UNAUTHORIZED);
        }
        

        return $next($request);
    }
}
