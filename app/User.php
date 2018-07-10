<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use OwenIt\Auditing\Contracts\Auditable;
use Silber\Bouncer\Database\HasRolesAndAbilities;

/**
 * App\User
 *
 * @property-read \Illuminate\Database\Eloquent\Collection|\Silber\Bouncer\Database\Ability[] $abilities
 * @property-read \App\Address $address
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Address[] $addresses
 * @property-read \Illuminate\Database\Eloquent\Collection|\OwenIt\Auditing\Models\Audit[] $audits
 * @property-read mixed $full_name
 * @property-read \Illuminate\Notifications\DatabaseNotificationCollection|\Illuminate\Notifications\DatabaseNotification[] $notifications
 * @property-read \Illuminate\Database\Eloquent\Collection|\Silber\Bouncer\Database\Role[] $roles
 * @property-write mixed $password
 * @method static \Illuminate\Database\Eloquent\Builder|\App\User whereIs($role)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\User whereIsAll($role)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\User whereIsNot($role)
 * @mixin \Eloquent
 * @property int $id
 * @property string $first_name
 * @property string $last_name
 * @property string $email
 * @property string $phone
 * @property string $gender
 * @property string|null $birthday
 * @property string $country
 * @property string|null $remember_token
 * @property int|null $creator_id
 * @property \Carbon\Carbon|null $created_at
 * @property \Carbon\Carbon|null $updated_at
 * @method static \Illuminate\Database\Eloquent\Builder|\App\User whereBirthday($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\User whereCountry($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\User whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\User whereCreatorId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\User whereEmail($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\User whereFirstName($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\User whereGender($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\User whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\User whereLastName($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\User wherePassword($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\User wherePhone($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\User whereRememberToken($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\User whereUpdatedAt($value)
 */
class User extends Authenticatable implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    use Notifiable;

    use HasRolesAndAbilities;

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

    public function role()
    {
        if (! $this->roles()->exists()) {
            return "Staff";
        }

        return $this->roles()->first()->title;
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
