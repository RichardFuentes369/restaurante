<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class menus extends Model
{
	protected $table = "menu";    

	//se puede tocar
	public function catplato(){
		return $this->belongsTo('App\Models\categoria_plato','id_category');
	}	

	public function desplato(){
		return $this->belongsTo('App\Models\plato','id_dishes');		
	}

}
