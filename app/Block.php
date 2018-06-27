<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Block extends Model
{
    protected $guarded = [];

    public function address()
    {
        return $this->morphOne(Address::class, "addressable");
    }
}
