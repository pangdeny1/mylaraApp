<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

/**
 * App\Batch
 *
 * @property-read \Illuminate\Database\Eloquent\Collection|\OwenIt\Auditing\Models\Audit[] $audits
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Farmer[] $farmers
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Harvest[] $harvests
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Product[] $product
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Purchase[] $purchases
 * @mixin \Eloquent
 * @property int $id
 * @property string $number
 * @property int $max_count
 * @property \Carbon\Carbon $valid_from
 * @property \Carbon\Carbon $valid_till
 * @property string $status
 * @property string $description
 * @property \Carbon\Carbon|null $created_at
 * @property \Carbon\Carbon|null $updated_at
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Batch whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Batch whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Batch whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Batch whereMaxCount($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Batch whereNumber($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Batch whereStatus($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Batch whereUpdatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Batch whereValidFrom($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Batch whereValidTill($value)
 */
class Batch extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    protected $guarded = [];

    protected $casts    = [
        "valid_from" => "date",
        "valid_till" => "date",
    ];

    protected $with     = ["harvests.product"];

    public function harvests()
    {
        return $this->hasMany(Harvest::class);
    }

    public function purchases()
    {
        return $this->hasMany(Purchase::class);
    }

    public function product()
    {
        return $this->hasManyThrough(Product::class, Harvest::class);
    }

    public function farmers()
    {
        return $this->belongsToMany(Farmer::class, "farmer_batch")->withTimestamps();
    }

    public static function number()
    {
        return sprintf("%s-%03d", strtoupper(str_random(4)), rand(1, 999));
    }
}
