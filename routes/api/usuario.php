<?php

Route::group(['prefix'=>'usuario'], function(){
	Route::post("crear-usuario", "UsuariosController@crear");
});