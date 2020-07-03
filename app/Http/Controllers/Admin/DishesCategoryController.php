<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\categoria_plato;

class DishesCategoryController extends Controller
{
   	public function listaDishesCategory(){
		$lista_categorias = categoria_plato::where('deleted_at',Null)->get();
		return $lista_categorias;
	}

	public function registerDishesCategory(Request $request) {
		try {
			$creando_categoria_plato = new categoria_plato();
			$creando_categoria_plato->name = $request->name;
			$creando_categoria_plato->description = $request->description;
			$creando_categoria_plato->color = $request->color;
			if($request->show = true){
				$creando_categoria_plato->photo = "lleno";
			}
			$creando_categoria_plato->save();
			return $request;
		} catch (Exception $e) {
			return $e;
		}
	}

	public function deleteDishesCategory($id_categoria_platos){
		try {
			$eliminar_categoria = categoria_plato::find($id_categoria_platos);
			$eliminar_categoria->delete();
			return 'usuario eliminado con exito';
		} catch (Exception $e) {
			return $e;
		}
	}
}
