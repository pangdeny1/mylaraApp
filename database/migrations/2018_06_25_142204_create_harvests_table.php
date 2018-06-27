<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateHarvestsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('harvests', function (Blueprint $table) {
            $table->increments('id');
            $table->double('expected_volume');
            $table->timestamp('expected_date');
            $table->string('volume_unit');
            $table->unsignedInteger('farm_id')->nullable();
            $table->unsignedInteger('product_id')->nullable();
            $table->text("description");
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
        Schema::dropIfExists('harvests');
    }
}
