<?php

namespace App;

use App\Presenter\Purchase\Price;
use App\Presenter\Purchase\Weight;
use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

/**
 * App\Purchase
 *
 * @property-read \Illuminate\Database\Eloquent\Collection|\OwenIt\Auditing\Models\Audit[] $audits
 * @property-read \App\Batch $batch
 * @property-read \App\Farmer $farmer
 * @property-read \App\Harvest $harvest
 * @property-read \App\Product $product
 * @property-read \App\Remark $remark
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Remark[] $remarks
 * @mixin \Eloquent
 * @property int $id
 * @property float $field_weight
 * @property float|null $weight_before
 * @property float|null $weight_after
 * @property string|null $weight_unit
 * @property float|null $amount
 * @property string $currency
 * @property string $status
 * @property int|null $product_id
 * @property int|null $batch_id
 * @property int|null $harvest_id
 * @property int|null $farmer_id
 * @property string|null $paid_at
 * @property int|null $creator_id
 * @property \Carbon\Carbon|null $created_at
 * @property \Carbon\Carbon|null $updated_at
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Purchase whereAmount($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Purchase whereBatchId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Purchase whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Purchase whereCreatorId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Purchase whereCurrency($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Purchase whereFarmerId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Purchase whereFieldWeight($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Purchase whereHarvestId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Purchase whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Purchase wherePaidAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Purchase whereProductId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Purchase whereStatus($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Purchase whereUpdatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Purchase whereWeightAfter($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Purchase whereWeightBefore($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Purchase whereWeightUnit($value)
 */
class Purchase extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    protected $guarded = [];

    public function harvest()
    {
        return $this->belongsTo(Harvest::class);
    }

    public function batch()
    {
        return $this->belongsTo(Batch::class);
    }

    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    public function farmer()
    {
        return $this->belongsTo(Farmer::class);
    }

    public function remarks()
    {
        return $this->morphMany(Remark::class, "remarkable");
    }

    public function remark()
    {
        return $this->morphOne(Remark::class, "remarkable");
    }

    public function weight()
    {
        return new Weight($this);
    }

    public function price()
    {
        return new Price($this);
    }

    public function hasAnyStatus(array $statuses)
    {
        foreach ($statuses as $status) {
            if ($this->status === $status){
                return true;
                break;
            }
        }

        return false;
    }

    public function hasStatus($name)
    {
        if ($this->status === $name){
            return true;
        }

        return false;
    }

    public function isProcessed()
    {
        return !is_null($this->attributes["amount"]) && !is_null($this->attributes["weight_after"]);
    }
}
