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
        $table->string('name');
        $table->string('lastname');
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
        $table->boolean('isSuperAdmin')->default(0);
        $table->boolean('isAdmin')->default(0);
        $table->boolean('isAtm')->default(0);
        $table->boolean('isWaiter')->default(0);
        $table->boolean('isChef')->default(0);
        $table->boolean('isClient')->default(0);
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
