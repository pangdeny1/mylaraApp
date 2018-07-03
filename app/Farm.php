<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Farm extends Model
{
    protected $guarded = [];

    protected $appends = ["name"];

    public function crops()
    {
        return $this->belongsToMany(Product::class, "farm_crop");
    }

    public function getNameAttribute()
    {
        return sprintf(
            "%s %s Farm",
            $this->attributes["size"],
            str_plural(title_case($this->attributes["size_unit"]), $this->attributes["size"])
        );
    }
}
