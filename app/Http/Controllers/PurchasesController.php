<?php

namespace App\Http\Controllers;

use App\Farmer;
use App\Product;
use App\Purchase;
use Illuminate\Http\Request;
use Nexmo\Client;

class PurchasesController extends Controller
{
    protected $weightUnites = [
        [
            "name" => "Tonne",
            "unit" => "ton"
        ],
        [
            "name" => "Kilogram",
            "unit" => "kg"
        ],
        [
            "name" => "Gram",
            "unit" => "gm"
        ],
    ];

    public function index()
    {
        $purchases = Purchase::latest()->when(request("status"), function($query){
            return $query->where("status", request("status"));
        })->paginate(10);

        return view("purchases.index", compact("purchases"));
    }

    public function create()
    {
        return view("purchases.create", [
            "farmers"   => Farmer::all(),
            "products"  => Product::all(),
        ]);
    }

    /**
     * @param Request $request
     * @param Client $nexmo
     * @return \Illuminate\Http\RedirectResponse
     * @throws Client\Exception\Exception
     * @throws Client\Exception\Request
     * @throws Client\Exception\Server
     */
    public function store(Request $request, Client $nexmo)
    {
        $this->validate($request, [
            "weight_unit" => "required|in:kg,gm,ton",
            "product_id" => "required|exists:products,id",
            "farmer_id" => "required|exists:farmers,id",
            "amount" => "nullable|numeric",
            "weight_before" => "required|numeric",
            "weight_after" => "nullable|numeric",
            "remarks" => "nullable",
        ]);

        if($request->weight_after && $request->weight_unit) {
            $amount = Product::findOrfail(request("product_id"))
                ->calculatePrice(request("weight_after"),
                    request("weight_unit")
                );
        }

        $purchase = Purchase::create([
            "product_id" => request("product_id"),
            "farmer_id" => request("farmer_id"),
            "amount" => request("amount", isset($amount) ? $amount : null),
            "currency" => request("currency", "TZS"),
            "weight_unit" => request("weight_unit"),
            "weight_before_processing" => request("weight_before"),
            "weight_after_processing" => request("weight_after"),
        ]);

        if ($request->has("remarks") && $request->remarks) {
            $purchase->remarks()->create(["body" => request("remarks")]);
        }

        if ($purchase->amount && $purchase->weight_after_processing) {

            $purchase->update(["status" => "processed"]);

            $farmer = Farmer::findOrFail(request("farmer_id"));

            $product = Product::findOrFail(request("product_id"));

            $nexmo->message()->send([
                'to' => "+255762764819",
                'from' => '@leggetter',
                'text' => "Hello {$farmer->full_name}, Tumepokea mzigo wako wa  {$product->name} wenye jumla ya kilo {$purchase->weight_before_processing} kabla ya kuchambua na kilo {$purchase->weight_after_processing} baada ya uchambuzi, ambao thamini yake ni Tsh. {$purchase->amount}"
            ]);
        }

        return redirect()
            ->route("purchases.index")
            ->with(
                'status', 'Purchase was recorded successfully!'
            );
    }

    public function edit(Purchase $purchase)
    {
        return view("purchases.edit", [
            "purchase"      => $purchase,
            "farmers"       => Farmer::all(),
            "products"      => Product::all(),
            "weightUnits"   => $this->weightUnites
        ]);
    }

    public function update(Request $request, Purchase $purchase)
    {
        $this->validate($request, [
            "weight_unit" => "required|in:kg,gm,ton",
            "product_id" => "required|exists:products,id",
            "farmer_id" => "required|exists:farmers,id",
            "amount" => "nullable|numeric",
            "weight_before" => "required|numeric",
            "weight_after" => "nullable|numeric",
            "remarks" => "nullable",
        ]);

        if($request->weight_after && $request->weight_unit) {
            $amount = Product::findOrfail(request("product_id"))
                ->calculatePrice(request("weight_after"),
                    request("weight_unit")
                );
        }

        $purchase->update([
            "product_id" => request("product_id"),
            "farmer_id" => request("farmer_id"),
            "amount" => request("amount", isset($amount) ? $amount : null),
            "currency" => request("currency", "TZS"),
            "weight_unit" => request("weight_unit"),
            "weight_before_processing" => request("weight_before"),
            "weight_after_processing" => request("weight_after"),
        ]);

        if ($purchase->amount && $purchase->weight_after_processing) {
            $purchase->update(["status" => "processed"]);
        }

        return redirect()->back()->with(
                'status', 'Purchase was updated successfully!'
            );
    }

    public function show(Purchase $purchase)
    {
        return view("purchases.show", compact("purchase"));
    }

    /**
     * @param Purchase $purchase
     * @return \Illuminate\Http\RedirectResponse
     * @throws \Exception
     */
    public function destroy(Purchase $purchase)
    {
        $purchase->delete();

        return redirect()->back()->with(
                "status", "Entity is deleted successfully"
            );
    }
}
