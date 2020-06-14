<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class UsuariosController extends Controller
{
    public function crear(Request $request){
    	try {
    		return $request;
    	} catch (Exception $e) {
    		return $e;
    	}
    }
}
