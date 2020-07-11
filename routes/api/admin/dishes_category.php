<?php

Route::group(['prefix'=>'dishes_category'], function(){
	
	$controller = "Admin\DishesCategoryController";

	Route::get("dishes-category-list", "$controller@listaDishesCategory");
	Route::post("dishes-category-register", "$controller@registerDishesCategory");	
	Route::put("dishes-category-update", "$controller@updateDishesCategory");	
	Route::delete("{id_categoria_plato}/dishes-category-delete", "$controller@deleteDishesCategory");	
});