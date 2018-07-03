<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class Farm extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    protected $guarded = [];

    protected $appends = ["name"];

    public function crops()
    {
        return $this->belongsToMany(Product::class, "farm_product")->withTimestamps();
    }

    public function blocks()
    {
        return $this->hasMany(Block::class);
    }

    public function address()
    {
        return $this->morphOne(Address::class, "addressable");
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
