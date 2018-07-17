<?php

namespace App\Http\Controllers;

use App\Batch;
use App\Farmer;
use App\Http\Requests\PurchaseCreateRequest;
use App\Product;
use App\Purchase;
use Illuminate\Auth\Access\AuthorizationException;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\View\View;
use Nexmo\Client;
use Sms;

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

    public function __construct()
    {
        $this->middleware("auth");
    }

    /**
     * @return View
     * @throws AuthorizationException
     */
    public function index()
    {
        $this->authorize("view", Purchase::class);

        $purchases = Purchase::latest()->when(request("status"), function($query){
            return $query->where("status", request("status"));
        })->paginate(10);

        return view("purchases.index", compact("purchases"));
    }

    /**
     * @return View
     * @throws AuthorizationException
     */
    public function create()
    {
        $this->authorize("view", Purchase::class);

        $farmers = Farmer::query()
            ->has("batches")
            ->has("groups")
            ->get();

        $products   = Product::all();

        return view("purchases.create", [
            "farmers"   => $farmers,
            "products"  => $products,
        ]);
    }

    /**
     * @param PurchaseCreateRequest $request
     * @return RedirectResponse
     * @throws AuthorizationException
     */
    public function store(PurchaseCreateRequest $request)
    {
        $this->authorize("create", Purchase::class);

        $farmer     = Farmer::findOrFail(request("farmer_id"));
        // Get Farmer's selected batch
        $batch      = $farmer->batches()->findOrFail(request("batch_id"));
        // Find means to get exactly harvest for given batch
        $harvest    = $batch->harvests()->where("farmer_id", $farmer->id)->firstOrFail();

        $purchase = Purchase::create([
            "batch_id" => $batch->id,
            "product_id" => $harvest->block->product_id,
            "harvest_id" => $harvest->id,
            "farmer_id" => $farmer->id,
            "amount" => request("amount", isset($amount) ? $amount : null),
            "currency" => request("currency", "TZS"),
            "weight_unit" => request("weight_unit"),
            "field_weight" => request("field_weight"),
            "creator_id" => auth()->id(),
        ]);

        if (! is_null($request->remarks)) {
            $purchase->remarks()->create(["body" => request("remarks")]);
        }

        return redirect()->route("purchases.index")->with('status', 'Purchase was recorded successfully!');
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
            $amount = Product::findOrfail(request("product_id"))->calculatePrice($request);
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

        return redirect()->back()->with('status', 'Purchase was updated successfully!');
    }

    public function show(Purchase $purchase)
    {
        return view("purchases.show", compact("purchase"));
    }

    /**
     * @param Purchase $purchase
     * @return RedirectResponse
     * @throws \Exception
     */
    public function destroy(Purchase $purchase)
    {
        $purchase->delete();

        return redirect()->back()->with("status", "Entity is deleted successfully");
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
