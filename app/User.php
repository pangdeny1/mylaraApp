<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use Notifiable;

    protected $guarded  = [];

    protected $hidden   = [
        'password',
        'remember_token',
    ];

    public function address()
    {
        return $this->morphOne(Address::class, "addressable");
    }

    public function addresses()
    {
        return $this->morphMany(Address::class, "addressable");
    }

    public function getFullNameAttribute()
    {
        return $this->attributes["first_name"] ." ". $this->attributes["last_name"];
    }

    public function setPasswordAttribute($password)
    {
        $this->attributes["password"] = bcrypt($password);
    }
}
