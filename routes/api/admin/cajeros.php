<?php

Route::group(['prefix'=>'cajeros'], function(){
	
	$controller = "Admin\AtmController";


	Route::get("get-users", "$controller@listaUsers");

	Route::get("atm-list", "$controller@listaAtm");
	Route::post("atm-register", "$controller@registerAtm");	
	Route::put("atm-update", "$controller@updateAtm");	
	Route::delete("{id_discount}/atm-delete", "$controller@deleteAtm");	
});