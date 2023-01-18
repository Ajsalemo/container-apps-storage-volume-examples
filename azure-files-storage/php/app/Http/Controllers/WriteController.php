<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Str;

class WriteController extends Controller
{
    public function writeController()
    {
        $uuidv4 = Str::uuid();

        $dir = realpath('..' . DIRECTORY_SEPARATOR . 'files');
        $file = $uuidv4 . '.txt';

        $filePath = fopen($dir . DIRECTORY_SEPARATOR . $file, "w") or die("Unable to open file!");
        $txt = "This is a file being stored on container storage";

        fwrite($filePath, $txt);
        fclose($filePath);

        $res = ['msg' => 'File name ' . $file . ' created'];

        return response()->json($res, 200);
    }
}
