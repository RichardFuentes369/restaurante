<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class MonthlyMovements extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('monthle_movements', function (Blueprint $table) {
            $table->id();
            $table->string('year');
            $table->string('month');
            $table->string('waiter');
            $table->string('number_of_invoices');
            $table->string('aucente_turns');
            $table->string('total_bills');
            $table->string('number_of_payment');
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
        Schema::dropIfExists('monthle_movements');
    }
}
