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

	public function updateDishes(Request $request){
		try {
			$actualizar_plato = plato::find($request->id);
			$actualizar_plato->name = $request->name;
			$actualizar_plato->size = $request->size;
			$actualizar_plato->price = $request->price;

			if(isset($request->boton)){
				$actualizar_plato->id_dishes_category = $request->mid_dishes_categoria;
			}else{
				$actualizar_plato->id_dishes_category = $request->id_dishes_category;			
			}
	
			$actualizar_plato->description = $request->description;

			if(isset($request->show)){
				if($request->show == true){
					if($request->photo != null){
						Storage::disk('dishes')->delete($actualizar_plato->photo);	
						$img = $this->getB64Image($request->photo);
						$img_extension = $this->getB64Extension($request->photo);
						$img_name = 'dishes'. time() . '.' . $img_extension; 
						$actualizar_plato->photo = $img_name;
						Storage::disk('dishes')->put($img_name, $img);
					}else{
						Storage::disk('dishes')->delete($actualizar_plato->photo);
						$actualizar_plato->photo = null;
					}
				}else{
					if($request->photo != null){
						Storage::disk('dishes')->delete($request->photo);
					}
					$actualizar_plato->photo = null;
				}
			}

			$actualizar_plato->save();
			return 'categoria plato actualizada';	
		} catch (Exception $e) {
			return $e;
		}
	}


	public function deleteDishes($id_categoria_platos){
		try {
			$eliminat_plato = plato::find($id_categoria_platos);
			$url_photo = $eliminat_plato->photo;
			Storage::disk('dishes')->delete($url_photo);
			$eliminat_plato->delete();
			return 'plato eliminado con exito';
		} catch (Exception $e) {
			return $e;
		}
	}
}
