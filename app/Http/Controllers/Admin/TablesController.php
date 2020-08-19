<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\mesas;

class TablesController extends Controller
{
	public function listaTables(){
		$lista_mesas = mesas::get();
		return $lista_mesas;
	}

	public function registerTable(Request $request){
		try {
			$nuevo_registro = new mesas();
			$nuevo_registro->nro_table = $request->nro_mesa;
			$nuevo_registro->nro_chair = $request->nro_silla;
			$nuevo_registro->save();
			return 'mesa registrada cone exito';
		} catch (Exception $e) {
			return $e;
		}
	}

	public function updateTable(){
		try {
			return 'registrando';
		} catch (Exception $e) {
			return $e;
		}
	}

	public function deleteTable($id_mesa){
		try {
			$eliminar_mesa = mesas::find($id_mesa);
			$eliminar_mesa->delete();
			return 'mesa elimnada';
		} catch (Exception $e) {
			return $e;
		}
	}
}
