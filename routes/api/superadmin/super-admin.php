<?php

Route::group(['prefix'=>'super-admin'], function(){
	
	$controller = "SuperAdmin\AdministradorController";
	
	Route::get("lista-admins", "$controller@lista");
	Route::post("admin-register", "$controller@register");
});