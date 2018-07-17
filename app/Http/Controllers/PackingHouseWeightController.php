<?php

namespace App\Http\Controllers;

use App\Purchase;
use Illuminate\Http\Request;

class PackingHouseWeightController extends Controller
{
    public function __construct()
    {
        $this->middleware("auth");
    }

    public function update(Request $request, Purchase $purchase)
    {
        $this->validate($request, ["weight_before" => "required"]);

        $purchase->update([
            "status" => "packed",
            "weight_before" => request("weight_before"),
        ]);

        \Sms::send(phone($purchase->farmer->phone, "TZ"), $this->messageBody(
            $purchase->farmer,
            $purchase->product,
            $purchase
        ));

        return redirect()->back();
    }

    public function messageBody($farmer, $product, $purchase)
    {
        $format = 'Hello %s, Tumepokea mzigo wako wa zao %s wenye jumla ya kilo %s ukiwa shambani na kilo %s ukiwa packing house, tutakufaarifu baada ya uchambuzi, Asante.';

        return sprintf(
            $format,
            $farmer->full_name,
            $product->name,
            $purchase->field_weight,
            $purchase->weight_before
        );
    }
}
