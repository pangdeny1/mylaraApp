<?php

namespace App;

use Exception;
use Illuminate\Database\Eloquent\Model;

class ProductPrice extends Model
{
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

    public function convertWeightToKg($weight, $unit)
    {
        if (array_key_exists($unit, $this->weightConventions)) {
            return (float) $weight / $this->weightConventions[$unit];
        }

        throw new Exception;
    }

    public function normalize($weight, $unit)
    {
        return $this->convertWeightToKg($weight, $unit) * $this->perKg();
    }
}
