<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;

use App\Http\Controllers\TagController;
use App\Http\Controllers\PostController;
use App\Http\Controllers\CategoryController;


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });


Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login'])->name('login');
Route::get('/login-page', [AuthController::class, 'loginPage'])->name('login-page');



// Route::middleware(['auth:sanctum'])->group(function () {
    
//     Route::apiResource('posts', PostController::class);
//     Route::apiResource('tags', TagController::class);

//     Route::get('categories', [CategoryController::class, 'index']);
//     Route::get('categories/{category}', [CategoryController::class, 'show']);

//     Route::middleware(middleware: 'role:admin')->group(function () {
//         Route::post('categories', [CategoryController::class, 'store']);
//         Route::put('categories/{category}', [CategoryController::class, 'update']);
//         Route::delete('categories/{category}', [CategoryController::class, 'destroy']);
//     });

//     Route::post('/logout', [AuthController::class, 'logout']);

//  });


Route::middleware(['auth:sanctum'])->group(function () {

 Route::get('/search-post', [PostController::class, 'postSearch']);


    Route::apiResource('posts', PostController::class);
    Route::apiResource('tags', TagController::class);

    Route::get('categories', [CategoryController::class, 'index']);
    Route::get('categories/{category}', [CategoryController::class, 'show']);

    Route::middleware(['role:admin'])->group(function () {
        Route::post('categories', [CategoryController::class, 'store']);
        Route::put('categories/{category}', [CategoryController::class, 'update']);
        Route::delete('categories/{category}', [CategoryController::class, 'destroy']);
    });
    Route::post('/logout', [AuthController::class, 'logout']);
});



