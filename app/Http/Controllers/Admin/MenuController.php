<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Collection;
use App\Models\{
	categoria_plato
};

class MenuController extends Controller
{
    public function listaDishes(){
		$lista_platos = categoria_plato::with('misplatos')->get();
		return $lista_platos;
    }
}
