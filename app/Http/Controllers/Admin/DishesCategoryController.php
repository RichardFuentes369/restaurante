<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\categoria_plato;
use Illuminate\Support\Facades\Storage;

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
			if($request->show == true){
				$img = $this->getB64Image($request->photo);
				$img_extension = $this->getB64Extension($request->photo);
				$img_name = 'dishes_category'. time() . '.' . $img_extension; 
				$creando_categoria_plato->photo = $img_name;
				Storage::disk('dishesCategory')->put($img_name, $img);
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
			$url_photo = $eliminar_categoria->photo;
			Storage::disk('dishesCategory')->delete($url_photo);
			$eliminar_categoria->delete();
			return 'usuario eliminado con exito';
		} catch (Exception $e) {
			return $e;
		}
	}


	/*
	public function subirimagen(Request $request){
		try {
			$img = $this->getB64Image($request->imagen);
			$img_extension = $this->getB64Extension($request->imagen);
			$img_name = 'user_avatar'. time() . '.' . $img_extension; 
			$actualizar_fotografia = empleados::find($request->idEmpleado);
			$actualizar_fotografia->url_fotografia = $img_name;
			$actualizar_fotografia->save();
			Storage::disk('images_base64')->put($img_name, $img);
			return 'imagen guardada correctamente';
		} catch (Exception $e) {
			return ($e);
		}
	}	

	public function eliminarFoto($url_imagen, $id_empleado){
		$eliminar_fotografia = empleados::find($id_empleado);
		$eliminar_fotografia->url_fotografia = null;
		$eliminar_fotografia->save();
		Storage::disk('images_base64')->delete($url_imagen);
		return 'imagen eliminada correctamente';
	}

	*/
}
