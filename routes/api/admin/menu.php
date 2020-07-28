<?php

Route::group(['prefix'=>'menu'], function(){
	
	$controller = "Admin\MenuController";

	Route::get("dishes-list", "$controller@listaDishes");
	Route::post("dishes-register", "$controller@registerDishes");
});