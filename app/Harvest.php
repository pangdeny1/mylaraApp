<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Harvest extends Model
{
    protected $guarded  = [];

    protected $casts    = ["expected_date" => "date"];
    
    protected $appends  = ["volume"];

    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    public function farm()
    {
        return $this->belongsTo(Farm::class);
    }

    public function getVolumeAttribute()
    {
        return sprintf(
            "%s %s",
            $this->attributes["expected_volume"],
            title_case(str_plural($this->attributes["volume_unit"], $this->attributes["expected_volume"]))
        );
    }
}
