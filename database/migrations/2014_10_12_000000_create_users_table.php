<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
      Schema::create('users', function (Blueprint $table) {
        $table->id();
        $table->string('photo')->nullable();
        $table->string('name')->nullable();
        $table->string('lastname')->nullable();
        $table->enum('td',['CC','TI','RC','CE','PA']);
        $table->string('dni');
        $table->string('phone')->nullable();
        $table->string('cellphone')->nullable();
        $table->enum('sexo', ['M', 'F']);
        $table->string('email')->unique();
        $table->timestamp('email_verified_at')->nullable();
        $table->string('password');
        $table->string('address');
        $table->date('contract_date')->nullable();
        $table->enum('isSuperAdmin', ['True','False'])->default('False');
        $table->enum('isAdmin', ['True','False'])->default('False');
        $table->enum('isAtm', ['True','False'])->default('False');
        $table->enum('isWaiter', ['True','False'])->default('False');
        $table->enum('isChef', ['True','False'])->default('False');
        $table->string('created_by')->nullable();
        $table->string('updated_by')->nullable();
        $table->string('deleted_by')->nullable();
        $table->rememberToken();
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
      Schema::dropIfExists('users');
    }
  }
