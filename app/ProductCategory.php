<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

/**
 * App\ProductCategory
 *
 * @property-read \Illuminate\Database\Eloquent\Collection|\OwenIt\Auditing\Models\Audit[] $audits
 * @mixin \Eloquent
 * @property int $id
 * @property string $name
 * @property string $description
 * @property int|null $creator_id
 * @property \Carbon\Carbon|null $created_at
 * @property \Carbon\Carbon|null $updated_at
 * @method static \Illuminate\Database\Eloquent\Builder|\App\ProductCategory whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\ProductCategory whereCreatorId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\ProductCategory whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\ProductCategory whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\ProductCategory whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\ProductCategory whereUpdatedAt($value)
 */
class ProductCategory extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    protected $guarded = [];
}
