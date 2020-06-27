<?php

Route::group(['prefix'=>'super-admin'], function(){
	
	$controller = "SuperAdmin\AdministradorController";
	
	Route::get("admin-list", "$controller@lista");
	Route::post("admin-register", "$controller@register");
});