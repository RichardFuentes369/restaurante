<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\descuentos;

class PromotionsController extends Controller
{
	public function listaDiscounts(){
		$lista_descuentos = descuentos::get();
		return $lista_descuentos;
	}
	public function registerDiscount(Request $request){
		try {
			$crear_descuento = new descuentos();
			$crear_descuento->description = $request->description;
			$crear_descuento->name = $request->name;
			$crear_descuento->porcentage = $request->porcentaje;
			$crear_descuento->save();
			return 'Descuento creado exitosamente';
		} catch (Exception $e) {
			return $e;
		}
	}
	public function updateDiscount(Request $request){
		try {
			$actualizar_descuento = descuentos::find($request->id);
			$actualizar_descuento->name = $request->name;
			$actualizar_descuento->description = $request->description;
			if($request->porcentage != ''){
				$actualizar_descuento->porcentage = $request->porcentage;
			}else{
				$actualizar_descuento->porcentage = "0";
			}
			$actualizar_descuento->save();
			return 'actualizacion';
		} catch (Exception $e) {
			return $e;
		}
	}
	public function deleteDiscount($id_discount){
		try {
			$eliminar_descuento = descuentos::find($id_discount);
			$eliminar_descuento->delete();
			return 'Descuento eliminado exitosamente';
		} catch (Exception $e) {
			return $e;
		}
	}
}
