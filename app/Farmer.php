<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class Farmer extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    protected $guarded = [];

    public function getFullNameAttribute()
    {
        return $this->attributes["first_name"] ." ". $this->attributes["last_name"];
    }

    public function getPlaceholderAttribute()
    {
        return $this->attributes["first_name"][0] ."". $this->attributes["last_name"][0];
    }

    public function getColorAttribute()
    {
        return array_random(["primary", "yellow", "purple", "red", "success", "danger"]);
    }
}
