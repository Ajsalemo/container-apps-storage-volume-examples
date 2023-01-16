<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ReadController extends Controller
{
    public function readController() {
        $dir = realpath('..' . DIRECTORY_SEPARATOR . 'files');
        $file = 'file.txt';
        $fullFilePath = $dir . DIRECTORY_SEPARATOR . $file;
    
        $fileName = fopen($fullFilePath, 'r') or die('Unable to open file!');
        $readFile = fread($fileName, filesize($fullFilePath));
        fclose($fileName);
        
        $res = ['msg' => $readFile];

        return response()->json($res, 200);

    }
}
