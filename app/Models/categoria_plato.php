<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class categoria_plato extends Model
{
	protected $table = "dishes_category";

	public function misplatos(){
		return $this->hasMany('App\Models\plato','id_disehs_category');
	}
}
