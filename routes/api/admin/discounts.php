<?php

Route::group(['prefix'=>'discounts'], function(){
	
	$controller = "Admin\PromotionsController";

	Route::get("discounts-list", "$controller@listaDiscounts");
	Route::post("discounts-register", "$controller@registerDiscount");	
	Route::put("discounts-update", "$controller@updateDiscount");	
	Route::delete("{id_discount}/discounts-delete", "$controller@deleteDiscount");	
});