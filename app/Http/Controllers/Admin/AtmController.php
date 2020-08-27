<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\usuarios;
use Illuminate\Support\Facades\Storage;

class AtmController extends Controller
{
	public function listaAtm() {
		$lista_atm = usuarios::where('isAtm', 1)->where('deleted_at',Null)->get();
		return $lista_atm;
	}
	public function registerAtm() {
		try {
			return 'registrando atm';
		} catch (Exception $e) {
			return $e;
		}
	}
	public function updateAtm() {
		try {
			return 'actualizando atm';
		} catch (Exception $e) {
			return $e;
		}
	}
	public function deleteAtm() {
		try {
			return 'eliminando atm';
		} catch (Exception $e) {
			return $e;
		}
	}
}
