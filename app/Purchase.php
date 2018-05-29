<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Purchase extends Model
{
    protected $guarded = [];

    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    public function farmer()
    {
        return $this->belongsTo(Farmer::class);
    }

    public function remarks()
    {
        return $this->morphMany(Remark::class, "remarkable");
    }

    public function present()
    {
        return new PurchasePresenter($this);
    }
}
