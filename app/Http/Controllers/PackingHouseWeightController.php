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
        $format = "Habari %s,Mzigo wako wa %s jumla ya kilo %s kabla ya uchambuzi,kilo %s baada ya uchambuzi,Thamani yake jumla ni %s";

        return sprintf(
            $format,
            $farmer->full_name,
            $product->name,
            $purchase->field_weight,
            $purchase->weight_before
        );
    }
}
