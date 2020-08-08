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

	public function registerTable(){
		try {
			return 'registrando';
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

	public function deleteTable(){
		try {
			return 'registrando';
		} catch (Exception $e) {
			return $e;
		}
	}
}
