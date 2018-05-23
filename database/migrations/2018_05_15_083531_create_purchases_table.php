<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePurchasesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('purchases', function (Blueprint $table) {
            $table->increments('id');
            $table->string('weight_unit')->nullable();
            $table->double('weight_before_processing');
            $table->double('weight_after_processing')->nullable();
            $table->double('amount')->nullable();
            $table->string('currency');
            $table->enum('status', ["unprocessed", "processed", "rejected", "completed"])->default("unprocessed");
            $table->unsignedInteger('product_id')->nullable();
            $table->unsignedInteger('farmer_id')->nullable();
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
        Schema::dropIfExists('purchases');
    }
}
