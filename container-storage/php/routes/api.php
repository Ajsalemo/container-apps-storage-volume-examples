<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Str;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/write', function () {
    $uuidv4 = Str::uuid();
    
    $dir = realpath('..' . DIRECTORY_SEPARATOR . 'files');
    $file = $uuidv4 . '.txt';
    $filepath = fopen($dir . DIRECTORY_SEPARATOR . $file, "w") or die("Unable to open file!");
    $txt = "This is a file being stored on container storage";

    fwrite($filepath, $txt);
    fclose($filepath);

    $res = ['msg' => 'File name ' . $file . ' created'];

    return response()->json($res, 200);
});