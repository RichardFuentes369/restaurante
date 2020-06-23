<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\usuarios;

class UsuariosController extends Controller
{
	public function crear(Request $request){
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


			$isSuperAdmin = array_search("isSuperAdmin", $request->checkCargo)  ? $crear_usuario->isSuperAdmin = True : $crear_usuario->isSuperAdmin = False;

			$isAdmin = array_search("isAdmin", $request->checkCargo) ? $crear_usuario->isAdmin = True : $crear_usuario->isAdmin = False;

			$isAtm = array_search("isAtm", $request->checkCargo) ? $crear_usuario->isAtm = True : $crear_usuario->isAtm = False;

			$isWaiter = array_search("isWaiter", $request->checkCargo) ? $crear_usuario->isWaiter = True : $crear_usuario->isWaiter = False;

			$isChef = array_search("isChef", $request->checkCargo) ? $crear_usuario->isChef = True : $crear_usuario->isChef = False;

			return $crear_usuario;



			$crear_usuario->save();
			return 'usuario creado con exito';
		} catch (Exception $e) {
			return $e;
		}
	}
}


