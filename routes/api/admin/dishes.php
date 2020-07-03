<?php

Route::group(['prefix'=>'dishes'], function(){
	
	$controller = "Admin\DishesCategoryController";

	Route::get("dishes-list", "$controller@listaDishes");
	Route::get("{id_category}/dishes-list-for-category", "$controller@listaDishesForCategory");
	Route::post("dishes-category-register", "$controller@registerDishes");	
	Route::delete("{id_categoria_platos}/dishes-category-delete", "$controller@deleteDishes");	
});