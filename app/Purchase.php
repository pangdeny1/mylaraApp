<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class Purchase extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

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

    public function remark()
    {
        return $this->morphOne(Remark::class, "remarkable");
    }

    public function present()
    {
        return new PurchasePresenter($this);
    }
}
