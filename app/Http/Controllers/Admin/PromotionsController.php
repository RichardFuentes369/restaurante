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
	public function registerDiscount(){
		try {
			return 'registro';
		} catch (Exception $e) {
			return $e;
		}
	}
	public function updateDiscount(){
		try {
			return 'actualizacion';
		} catch (Exception $e) {
			return $e;
		}
	}
	public function deleteDiscount(){
		try {
			return 'eliminacion';
		} catch (Exception $e) {
			return $e;
		}
	}
}
