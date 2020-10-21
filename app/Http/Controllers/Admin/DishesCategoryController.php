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
        if($request->photo != null){
          $img = $this->getB64Image($request->photo);
          $img_extension = $this->getB64Extension($request->photo);
          $img_name = 'dishes_category'. time() . '.' . $img_extension; 
          $creando_categoria_plato->photo = $img_name;
          Storage::disk('dishesCategory')->put($img_name, $img);
        }else{
          $creando_categoria_plato->photo = null;
        }
      }
      $creando_categoria_plato->save();
      return $request;
    } catch (Exception $e) {
      return $e;
    }
  }

  public function deleteDishesCategory($id_categoria_plato){
    try {
      $eliminar_categoria = categoria_plato::find($id_categoria_plato);
      $url_photo = $eliminar_categoria->photo;
      Storage::disk('dishesCategory')->delete($url_photo);
      $eliminar_categoria->delete();
      return 'usuario eliminado con exito';
    } catch (Exception $e) {
      return $e;
    }
  }

  public function updateDishesCategory(Request $request){
    try {
      $actualizar_categoria = categoria_plato::find($request->id);
      $actualizar_categoria->name = $request->name;
      $actualizar_categoria->color = $request->color;
      $actualizar_categoria->description = $request->description;

      if(isset($request->show)){
        if($request->show == true){
          if($request->photo != null){
            $esBase64 = $this->isBase64($request->photo); /*Si es base64 retorna true de lo contrario retorna false*/
            
            if($esBase64 == true){
              Storage::disk('dishesCategory')->delete($actualizar_categoria->photo);  
              $img = $this->getB64Image($request->photo);
              $img_extension = $this->getB64Extension($request->photo);
              $img_name = 'dishes_category'. time() . '.' . $img_extension; 
              $actualizar_categoria->photo = $img_name;
              Storage::disk('dishesCategory')->put($img_name, $img);
            }

          }else{
            Storage::disk('dishesCategory')->delete($actualizar_categoria->photo);
            $actualizar_categoria->photo = null;
          }
        }else{
          if($request->photo != null){
            Storage::disk('dishesCategory')->delete($request->photo);
          }
          $actualizar_categoria->photo = null;
        }
      }

      $actualizar_categoria->save();
      return 'categoria plato actualizada';   
    } catch (Exception $e) {
      return $e;
    }
  }
}
