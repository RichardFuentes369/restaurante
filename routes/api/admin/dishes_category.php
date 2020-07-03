<?php

Route::group(['prefix'=>'dishes_category'], function(){
	
	$controller = "Admin\DishesCategoryController";

	Route::get("dishes-category-list", "$controller@listaDishesCategory");
	Route::post("dishes-category-register", "$controller@registerDishesCategory");	
	Route::delete("{id_categoria_platos}/dishes-category-delete", "$controller@deleteDishesCategory");	
});