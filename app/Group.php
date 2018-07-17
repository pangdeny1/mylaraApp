<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Group extends Model
{
    protected $guarded  = [];

    protected $with     = ["products"];

    public function products()
    {
    	return $this->belongsToMany(Product::class);
    }
}
