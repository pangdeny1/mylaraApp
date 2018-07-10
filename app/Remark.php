<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

/**
 * App\Remark
 *
 * @property-read \Illuminate\Database\Eloquent\Collection|\OwenIt\Auditing\Models\Audit[] $audits
 * @property-read \App\Remark $parent
 * @mixin \Eloquent
 * @property int $id
 * @property string $body
 * @property string|null $remarkable_type
 * @property int|null $remarkable_id
 * @property int|null $creator_id
 * @property \Carbon\Carbon|null $created_at
 * @property \Carbon\Carbon|null $updated_at
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Remark whereBody($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Remark whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Remark whereCreatorId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Remark whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Remark whereRemarkableId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Remark whereRemarkableType($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Remark whereUpdatedAt($value)
 */
class Remark extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    protected $guarded = [];

    public function parent()
    {
        return $this->belongsTo(Remark::class, "parent_id");
    }
}
