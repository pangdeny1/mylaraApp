<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Batch extends Model
{
    protected $guarded = [];

    protected $casts = [
        "valid_from" => "date",
        "valid_till" => "date",
    ];

    public function farmers()
    {
        return $this->belongsToMany(Farmer::class, "farmer_batch")->withTimestamps();
    }

    public static function number()
    {
        return sprintf("%s-%03d", strtoupper(str_random(4)), rand(1, 999));
    }
}
