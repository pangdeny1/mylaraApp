<?php

namespace App\Http\Controllers;

use App\Purchase;
use Illuminate\Http\Request;

class GradedWeightController extends Controller
{
    public function __construct()
    {
        $this->middleware("auth");
    }

    public function update(Request $request, Purchase $purchase)
    {
        $this->validate($request, ["weight_after" => "required"]);

        $amount = $purchase->product->calculatePrice(request("weight_after"), $purchase->weight_unit);

        $purchase->update([
            "status" => "graded",
            "weight_after" => request("weight_after"),
            "amount" => $amount,
            "currency" => "TZS",
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
        $format = "Hello %s, Tumepokea mzigo wako wa %s wenye jumla ya kilo %s kabla ya kuchambua na kilo %s baada ya uchambuzi, ambao thamini yake ni %s";

        return sprintf($format,
            $farmer->full_name,
            $product->name,
            $purchase->weight_before,
            $purchase->weight_after,
            $purchase->amount
        );
    }
}
