<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

/**
 * App\Farmer
 *
 * @property-read \App\Address $address
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Address[] $addresses
 * @property-read \Illuminate\Database\Eloquent\Collection|\OwenIt\Auditing\Models\Audit[] $audits
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Batch[] $batches
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Block[] $blocks
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Farm[] $farms
 * @property-read mixed $full_name
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Harvest[] $harvests
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Purchase[] $sales
 * @mixin \Eloquent
 * @property int $id
 * @property string $first_name
 * @property string $last_name
 * @property string $phone
 * @property string|null $email
 * @property string $gender
 * @property int|null $creator_id
 * @property \Carbon\Carbon|null $created_at
 * @property \Carbon\Carbon|null $updated_at
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Farmer whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Farmer whereCreatorId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Farmer whereEmail($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Farmer whereFirstName($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Farmer whereGender($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Farmer whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Farmer whereLastName($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Farmer wherePhone($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Farmer whereUpdatedAt($value)
 */
class Farmer extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    protected $guarded = [];

    protected $appends = [
        "full_name"
    ];

    public function farms()
    {
        return $this->hasMany(Farm::class);
    }

    public function harvests()
    {
        return $this->hasMany(Harvest::class);
    }

    public function blocks()
    {
        return $this->hasManyThrough(Block::class, Farm::class);
    }

    public function sales()
    {
        return $this->hasMany(Purchase::class, "farmer_id");
    }

    public function address()
    {
        return $this->morphOne(Address::class, "addressable");
    }

    public function addresses()
    {
        return $this->morphMany(Address::class, "addressable");
    }

    public function batches()
    {
        return $this->belongsToMany(Batch::class, "farmer_batch")->withTimestamps();
    }

    public function findHarvestByBatchId($id)
    {
        return $this->harvests()->where("batch_id", $id)->first();
    }

    public function hasHarvested(Batch $batch)
    {
        return $this->harvests()->where("batch_id", $batch->id)->exists();
    }

    public function getFullNameAttribute()
    {
        return $this->attributes["first_name"] ." ". $this->attributes["last_name"];
    }
}
