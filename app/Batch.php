<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class Batch extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    protected $guarded = [];

    protected $casts    = [
        "valid_from" => "date",
        "valid_till" => "date",
    ];

    protected $with     = ["harvests.product"];

    public function harvests()
    {
        return $this->hasMany(Harvest::class);
    }

    public function product()
    {
        return $this->hasManyThrough(Product::class, Harvest::class);
    }

    public function farmers()
    {
        return $this->belongsToMany(Farmer::class, "farmer_batch")->withTimestamps();
    }

    public static function number()
    {
        return sprintf("%s-%03d", strtoupper(str_random(4)), rand(1, 999));
    }
}
