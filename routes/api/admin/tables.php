<?php

Route::group(['prefix'=>'tables'], function(){
	
	$controller = "Admin\TablesController";

	Route::get("tables-list", "$controller@listaTables");
	Route::post("table-register", "$controller@registerTable");	
	Route::put("table-update", "$controller@updateTable");	
	Route::delete("{id_table}/table-delete", "$controller@deleteTables");	
});