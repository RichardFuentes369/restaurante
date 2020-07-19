<?php

Route::group(['prefix'=>'dishes'], function(){
	
	$controller = "Admin\DishesController";

	Route::get("dishes-list", "$controller@listaDishes");
	Route::post("dishes-register", "$controller@registerDishes");	
	Route::put("dishes-update", "$controller@updateDishes");	
	Route::delete("{id_plato}/dishes-delete", "$controller@deleteDishes");	
});