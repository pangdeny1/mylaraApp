<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

/**
 * App\Block
 *
 * @property-read \Illuminate\Database\Eloquent\Collection|\OwenIt\Auditing\Models\Audit[] $audits
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Batch[] $batches
 * @property-read \App\Farm $farm
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Harvest[] $harvests
 * @property-read \App\Product $product
 * @mixin \Eloquent
 * @property int $id
 * @property string|null $number
 * @property float|null $size
 * @property string|null $size_unit
 * @property int|null $farm_id
 * @property int|null $product_id
 * @property string $description
 * @property \Carbon\Carbon|null $created_at
 * @property \Carbon\Carbon|null $updated_at
 * @property string|null $status
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Block whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Block whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Block whereFarmId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Block whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Block whereNumber($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Block whereProductId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Block whereSize($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Block whereSizeUnit($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Block whereStatus($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Block whereUpdatedAt($value)
 */
class Block extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    protected $guarded = [];

    public function farm()
    {
        return $this->belongsTo(Farm::class);
    }

    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    public function harvests()
    {
        return $this->hasMany(Harvest::class);
    }

    public function batches()
    {
        return $this->hasMany(Batch::class);
    }
}
