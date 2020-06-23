<?php

Route::group(['prefix'=>'usuario'], function(){
	Route::post("user-register", "UsuariosController@register");
});