<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Dishes extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
      Schema::create('dishes', function (Blueprint $table) {
        $table->id();
        $table->string('photo')->nullable();
        $table->string('name')->nullable();
        $table->enum('size', ['small', 'big', 'median'])->nullable();
        $table->string('description')->nullable();
        $table->string('price')->nullable();
        $table->foreignId('id_menu')->nullable();
        $table->string('created_by')->nullable();
        $table->string('updated_by')->nullable();
        $table->string('deleted_by')->nullable();
        $table->softDeletes();
        $table->timestamps();
    });
  }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
      Schema::dropIfExists('dishes');
  }
}
