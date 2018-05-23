<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $guarded = [];

    public function category()
    {
        return $this->categories()->first();
    }

    public function categories()
    {
        return $this->belongsToMany(ProductCategory::class, "product_category", "category_id", "product_id");
    }

    public function price()
    {
        return $this->hasOne(ProductPrice::class);
    }

    public function prices()
    {
        return $this->hasMany(ProductPrice::class);
    }

    public function calculatePrice($weight, $unit)
    {
        return $this->price->normalize($weight, $unit);
    }
}
