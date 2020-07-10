<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

class Controller extends BaseController
{
	use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    //cargar imagen
	public function getB64Image($base64_image){  
     // Obtener el String base-64 de los datos         
		$image_service_str = substr($base64_image, strpos($base64_image, ",")+1);
     // Decodificar ese string y devolver los datos de la imagen        
		$image = base64_decode($image_service_str);   
     // Retornamos el string decodificado
		return $image; 
	}

	public function getB64Extension($base64_image){  
		$img_extension = explode('/', mime_content_type($base64_image))[1];
		return $img_extension;  
	}

//ver imagen
	public function getImageB64($filename){
    //Obtener la imagen del disco creado anteriormente de acuerdo al nombre de
    // la imagen solicitada

		// ese images_base64 toca pasarselo como parametro
		$file = Storage::disk('images_base64')->get($filename);
    // Retornar una respuesta de tipo 200 con el archivo de la Imagen
		return new Response($file,200);
	}

}
