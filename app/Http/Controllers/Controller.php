<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

class Controller extends BaseController
{
  use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

  /*Cargar imagen*/
  public function getB64Image($base64_image){  
    /*Obtener el String base-64 de los datos*/         
    $image_service_str = substr($base64_image, strpos($base64_image, ",")+1);
    /*Decodificar ese string y devolver los datos de la imagen*/        
    $image = base64_decode($image_service_str);   
    /*Retornamos el string decodificado*/
    return $image; 
  }

  /*Obtiene la extension de la imagen*/
  public function getB64Extension($base64_image){  
    /*Obtener la extension de la imagen del disco creado anteriormente de acuerdo al nombre de la imagen solicitada*/
    $img_extension = explode('/', mime_content_type($base64_image))[1]; 
    return $img_extension;  
  }

  /*Ver Imgaen*/
  public function getImageB64($filename){
    $file = Storage::disk('images_base64')->get($filename); /*Obtener la imagen del disco creado anteriormente de acuerdo al nombre de la imagen solicitada*/
    return new Response($file,200);
  }

  /*detecta si es una base64 o no*/
  public function isBase64($filename){
    if (!preg_match('/data:([^;]*);base64,(.*)/', $filename, $matches)) {
      return false; /*No es base 64*/
    }else{
      return true; /*Es base 64*/
    }
  }

}
