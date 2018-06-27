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
            $table->double('field_weight');
            $table->double('weight_before')->nullable();
            $table->double('weight_after')->nullable();
            $table->string('weight_unit')->nullable();
            $table->double('amount')->nullable();
            $table->string('currency');
            $table->enum('status', [
                "received",
                "processed",
                "pending",
                "rejected",
                "completed",
                "paid",
            ])->default("received");
            $table->unsignedInteger('product_id')->nullable();
            $table->unsignedInteger('batch_id')->nullable();
            $table->unsignedInteger('farmer_id')->nullable();
            $table->timestamp("paid_at")->nullable();
            $table->unsignedInteger('creator_id')->nullable();
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
