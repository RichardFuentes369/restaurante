<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Collection;
use App\Models\categoria_plato;
use Illuminate\Support\Facades\Storage;

class DishesController extends Controller
{
	public function listaDishes(){
		$lista_platos = categoria_plato::with('misplatos')->get();
		return $lista_platos;
	}	

	public function listaDishesForCategory($id_category){
		$lista_categorias = platos::where('id_disehs_category', $id_category)->get();
		return $lista_categorias;
	}

	public function registerDishes(Request $request) {
		try {
			$creando_categoria_plato = new platos();
			$creando_categoria_plato->name = $request->name;
			$creando_categoria_plato->size = $request->size;
			$creando_categoria_plato->description = $request->description;
			$creando_categoria_plato->price = $request->price;

			/*posiblemente tenga que romper con la relacion id_menu en la tabla platos*/
			$creando_categoria_plato->id_menu = $request->id_menu;
			if($request->show = true){
				$creando_categoria_plato->photo = "lleno";
			}
			$creando_categoria_plato->save();
			return $request;
		} catch (Exception $e) {
			return $e;
		}
	}

	public function deleteDishes($id_categoria_platos){
		try {
			$eliminar_categoria = platos::find($id_categoria_platos);
			$eliminar_categoria->delete();
			return 'usuario eliminado con exito';
		} catch (Exception $e) {
			return $e;
		}
	}
}
