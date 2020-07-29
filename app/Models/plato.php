<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class plato extends Model
{
	protected $table = "dishes";  

	public function nombreCategoria(){
		return $this->belongsTo('App\Models\categoria_plato','id_dishes_category');
	}

}
 