<?php

namespace App;

use Exception;
use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

/**
 * App\ProductPrice
 *
 * @property-read \Illuminate\Database\Eloquent\Collection|\OwenIt\Auditing\Models\Audit[] $audits
 * @mixin \Eloquent
 * @property int $id
 * @property float $amount
 * @property string $currency
 * @property string $unit
 * @property float $unit_value
 * @property string|null $valid_from
 * @property string|null $valid_till
 * @property int $is_current_price
 * @property int|null $product_id
 * @property int|null $creator_id
 * @property \Carbon\Carbon|null $created_at
 * @property \Carbon\Carbon|null $updated_at
 * @method static \Illuminate\Database\Eloquent\Builder|\App\ProductPrice whereAmount($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\ProductPrice whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\ProductPrice whereCreatorId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\ProductPrice whereCurrency($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\ProductPrice whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\ProductPrice whereIsCurrentPrice($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\ProductPrice whereProductId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\ProductPrice whereUnit($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\ProductPrice whereUnitValue($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\ProductPrice whereUpdatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\ProductPrice whereValidFrom($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\ProductPrice whereValidTill($value)
 */
class ProductPrice extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    protected $guarded = [];

    protected $weightConventions = [
        "gm"    => 1000,
        "kg"    => 1,
        "ton"   => 0.001,
    ];

    public function perKg()
    {
        return (float) $this->weightConventions[$this->unit] * $this->amount;
    }

    /**
     * @param $weight
     * @param $unit
     * @return float|int
     * @throws Exception
     */
    public function convertWeightToKg($weight, $unit)
    {
        if (array_key_exists($unit, $this->weightConventions)) {
            return (float) $weight / $this->weightConventions[$unit];
        }

        throw new Exception;
    }

    /**
     * @param $weight
     * @param $unit
     * @return float|int
     * @throws Exception
     */
    public function normalize($weight, $unit)
    {
        return $this->convertWeightToKg($weight, $unit) * $this->perKg();
    }
}
