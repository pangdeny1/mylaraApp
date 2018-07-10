<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use OwenIt\Auditing\Contracts\Auditable;

/**
 * App\Product
 *
 * @property-read \Illuminate\Database\Eloquent\Collection|\OwenIt\Auditing\Models\Audit[] $audits
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\ProductCategory[] $categories
 * @property-read \App\ProductPrice $price
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\ProductPrice[] $prices
 * @mixin \Eloquent
 * @property int $id
 * @property string $name
 * @property string $description
 * @property int|null $creator_id
 * @property \Carbon\Carbon|null $created_at
 * @property \Carbon\Carbon|null $updated_at
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Product whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Product whereCreatorId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Product whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Product whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Product whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Product whereUpdatedAt($value)
 */
class Product extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    protected $guarded = [];

    public function category()
    {
        return $this->categories()->first();
    }

    public function categories()
    {
        return $this->belongsToMany(
            ProductCategory::class,
            "product_category",
            "category_id",
            "product_id"
        )->withTimestamps();
    }

    public function price()
    {
        return $this->hasOne(ProductPrice::class);
    }

    public function prices()
    {
        return $this->hasMany(ProductPrice::class);
    }

    public function calculatePrice($weight, $unit)
    {
        return $this->price->normalize($weight, $unit);
    }
}
