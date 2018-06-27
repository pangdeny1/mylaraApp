<?php

namespace App;

use App\Presenter\Purchase\Price;
use App\Presenter\Purchase\Weight;
use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class Purchase extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    protected $guarded = [];

    public function batch()
    {
        return $this->belongsTo(Batch::class);
    }

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

    public function weight()
    {
        return new Weight($this);
    }

    public function price()
    {
        return new Price($this);
    }
}
