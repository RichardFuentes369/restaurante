<?php

namespace App\Http\Controllers\SuperAdmin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\usuarios;

class AdministradorController extends Controller
{
	public function lista(){
		return 'hola pirobito';
	}

	public function register(Request $request){
		try {
			$crear_usuario = new usuarios();
			$crear_usuario->address = $request->address;
			$crear_usuario->cellphone = $request->cellphone;
			$crear_usuario->dni = $request->dni;
			$crear_usuario->email = $request->email;
			$crear_usuario->lastname = $request->lastname;
			$crear_usuario->name = $request->name;
			$crear_usuario->password = bcrypt($request->password);
			$crear_usuario->phone = $request->phone;
			$crear_usuario->sexo = $request->sexo;
			$crear_usuario->td = $request->td;
			$isAdmin = array_search("isAdmin", $request->checkCargo) != false ? $crear_usuario->isAdmin = 0 : $crear_usuario->isAdmin = 1;
			$isAtm = array_search("isAtm", $request->checkCargo) != false ? $crear_usuario->isAtm = 0 : $crear_usuario->isAtm = 1;
			$crear_usuario->save();
			return 'usuario creado con exito';
		} catch (Exception $e) {
			return $e;
		}
	}
}

