<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Collection;
use App\Models\{
	categoria_plato, 
	plato
};
use Illuminate\Support\Facades\Storage;

class DishesController extends Controller
{
	public function listaDishes(){
		$lista_platos = categoria_plato::with('misplatos')->get();
		return $lista_platos;
	}	

	public function registerDishes(Request $request) {
		try {
			$creando_plato = new plato();
			$creando_plato->name = $request->name;
			$creando_plato->size = $request->size;
			$creando_plato->description = $request->description;
			$creando_plato->price = $request->price;
			$creando_plato->id_dishes_category = $request->mid_dishes_categoria;

			/*posiblemente tenga que romper con la relacion id_menu en la tabla platos*/
			$creando_plato->id_menu = $request->id_menu;

			if($request->show == true){
				if($request->photo != null){
					$img = $this->getB64Image($request->photo);
					$img_extension = $this->getB64Extension($request->photo);
					$img_name = 'dishes'. time() . '.' . $img_extension; 
					$creando_plato->photo = $img_name;
					Storage::disk('dishes')->put($img_name, $img);
				}else{
					$creando_plato->photo = null;
				}
			}

			$creando_plato->save();
			return $request;
		} catch (Exception $e) {
			return $e;
		}
	}

	public function deleteDishes($id_categoria_platos){
		try {
			$eliminar_categoria = plato::find($id_categoria_platos);
			$eliminar_categoria->delete();
			return 'usuario eliminado con exito';
		} catch (Exception $e) {
			return $e;
		}
	}
}
