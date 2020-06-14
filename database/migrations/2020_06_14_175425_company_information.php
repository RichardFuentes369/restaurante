<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CompanyInformation extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('company_information', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('address');
            $table->string('phone');
            $table->string('cellphone');
            $table->string('email');
            $table->string('logo'); // viene desde el storage
            $table->string('slogan');
            $table->string('slogan_color');
            $table->enum('background', ['0', '1']); // si es 0 esta activo el fondo color, si es 1 esta activo el fondo imagen
            $table->string('background_color'); // viene desde el storage
            $table->string('background_image'); // viene desde el storage
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
        Schema::dropIfExists('company_information');
    }
}
