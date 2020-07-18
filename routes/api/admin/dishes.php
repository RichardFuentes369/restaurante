<?php

Route::group(['prefix'=>'dishes'], function(){
	
	$controller = "Admin\DishesController";

	Route::get("dishes-list", "$controller@listaDishes");
	Route::post("dishes-register", "$controller@registerDishes");	
	Route::delete("{id_plato}/dishes-delete", "$controller@deleteDishes");	
});