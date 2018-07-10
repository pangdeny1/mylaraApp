<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

/**
 * App\Farm
 *
 * @property-read \App\Address $address
 * @property-read \Illuminate\Database\Eloquent\Collection|\OwenIt\Auditing\Models\Audit[] $audits
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Block[] $blocks
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Product[] $crops
 * @property-read mixed $acreage
 * @property-read mixed $location
 * @property-read mixed $name
 * @mixin \Eloquent
 * @property int $id
 * @property float $size
 * @property string $size_unit
 * @property int|null $farmer_id
 * @property string $description
 * @property \Carbon\Carbon|null $created_at
 * @property \Carbon\Carbon|null $updated_at
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Farm whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Farm whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Farm whereFarmerId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Farm whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Farm whereSize($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Farm whereSizeUnit($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Farm whereUpdatedAt($value)
 */
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
            "%s %s, %s Farm",
            $this->attributes["size"],
            str_plural(title_case($this->attributes["size_unit"]), $this->attributes["size"]),
            optional($this->address)->state
        );
    }

    public function getAcreageAttribute()
    {
        return sprintf(
            "%s %s",
            $this->attributes["size"],
            str_plural(title_case($this->attributes["size_unit"]), $this->attributes["size"])
        );
    }

    public function getLocationAttribute()
    {
        return sprintf(
            "%s, %s",
            optional($this->address)->state,
            optional($this->address)->country
        );
    }
}
