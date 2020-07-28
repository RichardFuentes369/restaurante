<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Collection;
use App\Models\{
	categoria_plato,
    menus
};

class MenuController extends Controller
{
    public function listaDishes(){
		$lista_platos = categoria_plato::with('misplatos')->get();
		return $lista_platos;
    }

    public function registerDishes(Request $request){
    	try { 

            $array = [];

            for ($i=0; $i < sizeof($request->menu); $i++) { 
                $obj = $request->menu[$i];
                for ($j=0; $j < sizeof($obj['disheSeleccionado']); $j++) { 
                    $obj2 = $obj['disheSeleccionado'][$j];
                    array_push($array, $obj2);
                }
            }


            for ($p=0; $p < sizeof($array) ; $p++) { 
                $creando_menu = new menus();
                $creando_menu->id_dishes = $array[$p]['id'];
                $creando_menu->save();
            }



       		return $array;
    	} catch (Exception $e) {
    		return $e;
    	}
    }
}
