<?php

Route::group(['prefix'=>'super-admin'], function(){
	
	$controller = "SuperAdmin\AdministradorController";
	
	Route::get("admin-list", "$controller@listaAdmins");
	Route::post("admin-register", "$controller@registerAdmins");
	Route::put("{id_user}/admin-update", "$controller@updateAdmins");
	Route::delete("{id_user}/admin-delete", "$controller@deleteAdmins");
});