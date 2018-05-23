<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Farmer extends Model
{
    protected $guarded = [];

    public function getFullNameAttribute()
    {
        return $this->first_name ." ". $this->last_name;
    }
}
