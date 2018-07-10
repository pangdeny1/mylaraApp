<?php

namespace App;

use OwenIt\Auditing\Contracts\Auditable;

/**
 * App\Role
 *
 * @property-read \Illuminate\Database\Eloquent\Collection|\Silber\Bouncer\Database\Ability[] $abilities
 * @property-read \Illuminate\Database\Eloquent\Collection|\OwenIt\Auditing\Models\Audit[] $audits
 * @property-read mixed $color
 * @property-read mixed $placeholder
 * @method static \Illuminate\Database\Eloquent\Builder|\Silber\Bouncer\Database\Role whereAssignedTo($model, $keys = null)
 * @mixin \Eloquent
 * @property int $id
 * @property string $name
 * @property string|null $title
 * @property int $level
 * @property int|null $scope
 * @property string $description
 * @property \Carbon\Carbon|null $created_at
 * @property \Carbon\Carbon|null $updated_at
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Role whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Role whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Role whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Role whereLevel($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Role whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Role whereScope($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Role whereTitle($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Role whereUpdatedAt($value)
 */
class Role extends \Silber\Bouncer\Database\Role implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    protected $appends = ["placeholder", "color"];

    public function getColorAttribute()
    {
        return array_random(["primary", "yellow", "purple", "red", "success", "danger"]);
    }

    public function getPlaceholderAttribute()
    {
        if ($this->hasMultipleWords($this->attributes["title"])) {
            $words = $this->getWords();

            return $this->makePlaceholder($words);
        }

        return $this->makePlaceholder($this->attributes["title"]);
    }

    public function hasMultipleWords($title)
    {
        $words = explode(" ", $title);

        return count($words) > 1;
    }

    private function getFirstLetter($word)
    {
        return $word[0];
    }

    public function getWords()
    {
        return explode(" ", $this->attributes["title"]);
    }

    public function makePlaceholder($words)
    {
        if (is_array($words)) {
            return strtoupper($this->getFirstLetter($words[0]) . "" . $this->getFirstLetter($words[1]));
        }

        return strtoupper($words[0] ."". $words[1]);
    }
}