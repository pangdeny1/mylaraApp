<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

/**
 * App\Address
 *
 * @property-read \Illuminate\Database\Eloquent\Collection|\OwenIt\Auditing\Models\Audit[] $audits
 * @mixin \Eloquent
 * @property int $id
 * @property string $street
 * @property string|null $address
 * @property string $country
 * @property string $state
 * @property string|null $postal_code
 * @property string|null $addressable_type
 * @property int|null $addressable_id
 * @property int|null $creator_id
 * @property \Carbon\Carbon|null $created_at
 * @property \Carbon\Carbon|null $updated_at
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Address whereAddress($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Address whereAddressableId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Address whereAddressableType($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Address whereCountry($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Address whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Address whereCreatorId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Address whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Address wherePostalCode($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Address whereState($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Address whereStreet($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Address whereUpdatedAt($value)
 */
class Address extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    protected $guarded = [];
}
