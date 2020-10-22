<?php

Route::group(['prefix'=>'chatbot'], function(){
	
	$controller = "Botman\BotManController";
	
	Route::match(['get', 'post'], '/botman', "$controller@handle");
	Route::get('/botman/tinker', "BotManController@tinker");
});