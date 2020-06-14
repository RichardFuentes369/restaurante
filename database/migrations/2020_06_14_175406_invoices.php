<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Invoices extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('invoices', function (Blueprint $table) {
            $table->id();
            $table->foreignId('id_header');
            $table->foreignId('id_detail');
            $table->foreignId('id_footer');
            $table->foreignId('id_table');
            $table->foreignId('id_discount');
            $table->enum('efectivo', ['True', 'False']);
            $table->string('pago_electronico_no');
            $table->enum('estado_pago', ['True', 'False']);
            $table->enum('estado_cocina', ['True', 'False']);
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
        Schema::dropIfExists('invoices');
    }
}
