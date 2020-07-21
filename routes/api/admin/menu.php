<?php

Route::group(['prefix'=>'menu'], function(){
	
	$controller = "Admin\MenuController";

	Route::get("dishes-list", "$controller@listaDishes");
});