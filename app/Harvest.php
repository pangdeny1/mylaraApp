<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

/**
 * App\Harvest
 *
 * @property-read \Illuminate\Database\Eloquent\Collection|\OwenIt\Auditing\Models\Audit[] $audits
 * @property-read \App\Batch $batch
 * @property-read \App\Block $block
 * @property-read \App\Farm $farm
 * @property-read \App\Farmer $farmer
 * @property-read mixed $volume
 * @property-read \App\Product $product
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Purchase[] $purchases
 * @mixin \Eloquent
 * @property int $id
 * @property float $expected_amount
 * @property string $amount_unit
 * @property \Carbon\Carbon $expected_date
 * @property int|null $block_id
 * @property int|null $farmer_id
 * @property int|null $batch_id
 * @property string $description
 * @property \Carbon\Carbon|null $created_at
 * @property \Carbon\Carbon|null $updated_at
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Harvest whereAmountUnit($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Harvest whereBatchId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Harvest whereBlockId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Harvest whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Harvest whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Harvest whereExpectedAmount($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Harvest whereExpectedDate($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Harvest whereFarmerId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Harvest whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Harvest whereUpdatedAt($value)
 */
class Harvest extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    protected $guarded  = [];

    protected $casts    = [
        "expected_date" => "date"
    ];
    
    protected $appends  = [
        "volume"
    ];

    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    public function farmer()
    {
        return $this->belongsTo(Farmer::class);
    }

    public function farm()
    {
        return $this->belongsTo(Farm::class);
    }

    public function batch()
    {
        return $this->belongsTo(Batch::class);
    }

    public function purchases()
    {
        return $this->hasMany(Purchase::class);
    }

    public function block()
    {
        return $this->belongsTo(Block::class);
    }

    public function isPurchased(Batch $batch)
    {
        return $this->purchases()->where("batch_id", $batch->id)->exists();
    }

    public function getVolumeAttribute()
    {
        return sprintf(
            "%s %s",
            $this->attributes["expected_amount"],
            title_case(str_plural($this->attributes["amount_unit"], $this->attributes["expected_amount"]))
        );
    }
}
