<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PageController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', [PageController::class, 'index'])->name('index');

Route::get('/resume', [PageController::class, 'resume'])->name('resume');

Route::get('/contact', [PageController::class, 'contact'])->name('contact');

Route::get('/blog', [PageController::class, 'blog'])->name('blog');

Route::get('/blog/{category}/{slug}', [PageController::class, 'blog_detail'])->name('blog.detail');

Route::get('/blog/{category}', [PageController::class, 'blog_category'])->name('blog.category');

Route::get('/search', [PageController::class, 'blog_search'])->name('blog.search');

Route::post('/contact/send', [PageController::class, 'contact_store'])->name('contact.store');

Route::get('/portfolio', [PageController::class, 'portfolio'])->name('portfolio');

Route::get('/portfolio/{slug}', [PageController::class, 'project'])->name('project');

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
