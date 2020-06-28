<?php

namespace App\Http\Controllers\SuperAdmin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\usuarios;

class AdministradorController extends Controller
{
	public function listaAdmins(){
		$lista_usuarios = usuarios::where('isAdmin', 1)->get();
		return $lista_usuarios;
	}

	public function registerAdmins(Request $request){
		try {
			$creando_administrador = new usuarios();
			$creando_administrador->address = $request->address;
			$creando_administrador->cellphone = $request->cellphone;
			$creando_administrador->dni = $request->dni;
			$creando_administrador->email = $request->email;
			$creando_administrador->lastname = $request->lastname;
			$creando_administrador->name = $request->name;
			$creando_administrador->password = bcrypt($request->password);
			$creando_administrador->phone = $request->phone;
			$creando_administrador->sexo = $request->sexo;
			$creando_administrador->td = $request->td;
			$request->isAdmin == '1' ? $creando_administrador->isAdmin = 1 : $creando_administrador->isAdmin = 0;
			$request->isAtm == '1' ? $creando_administrador->isAtm = 1 : $creando_administrador->isAtm = 0;
			$creando_administrador->save();
			return 'usuario creado con exito';
		} catch (Exception $e) {
			return $e;
		}
	}	

	public function updateAdmins($id_user,Request $request){
		try {
			$actualizando_administrador = usuarios::find($id_user);
			$actualizando_administrador->address = $request->address;
			$actualizando_administrador->cellphone = $request->cellphone;
			$actualizando_administrador->dni = $request->dni;
			$actualizando_administrador->email = $request->email;
			$actualizando_administrador->lastname = $request->lastname;
			$actualizando_administrador->name = $request->name;
			if($request->haspassword = true){
				$actualizando_administrador->password = bcrypt($request->password);
			}
			$actualizando_administrador->phone = $request->phone;
			$actualizando_administrador->sexo = $request->sexo;
			$actualizando_administrador->td = $request->td;
			$request->isAdmin == 1 ? $actualizando_administrador->isAdmin = 1 : $actualizando_administrador->isAdmin = 0;
			$request->isAtm == 1 ? $actualizando_administrador->isAtm = 1 : $actualizando_administrador->isAtm = 0;
			$actualizando_administrador->save();
			return 'usuario actualizando con exito';
		} catch (Exception $e) {
			return $e;
		}
	}	

	public function deleteAdmins($id_user){
		try {
			$eliminando_administrador = usuarios::find($id_user);
			$eliminando_administrador->delete();
			return 'usuario eliminado con exito';
		} catch (Exception $e) {
			return $e;
		}
	}
}

