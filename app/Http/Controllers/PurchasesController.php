<?php

namespace App\Http\Controllers;

use App\Farmer;
use App\Http\Requests\PurchaseCreateRequest;
use App\Product;
use App\Purchase;
use Illuminate\Auth\Access\AuthorizationException;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\View\View;
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

        return view("purchases.create", [
            "farmers"   => Farmer::all(),
            "products"  => Product::all(),
        ]);
    }

    /**
     * @param PurchaseCreateRequest $request
     * @param Client $nexmo
     * @return RedirectResponse
     * @throws AuthorizationException
     */
    public function store(PurchaseCreateRequest $request, Client $nexmo)
    {
        $this->authorize("create", Purchase::class);

        $this->validate($request, ["field_weight" => "gte:weight_before"]);

        if($request->weight_after && $request->weight_unit) {
            $amount = Product::findOrfail(request("product_id"))->calculatePrice(
                    request("weight_after"),
                    request("weight_unit")
                );
        }

        $purchase = Purchase::create([
            "product_id" => request("product_id"),
            "farmer_id" => request("farmer_id"),
            "amount" => request("amount", isset($amount) ? $amount : null),
            "currency" => request("currency", "TZS"),
            "weight_unit" => request("weight_unit"),
            "field_weight" => request("field_weight"),
            "weight_before" => request("weight_before"),
            "weight_after" => request("weight_after"),
        ]);

        if ($request->has("remarks") && $request->remarks) {
            $purchase->remarks()->create(["body" => request("remarks")]);
        }

        if ($purchase->amount && $purchase->weight_after_processing) {

            $purchase->update(["status" => "processed"]);

            $farmer = Farmer::findOrFail(request("farmer_id"));

            $product = Product::findOrFail(request("product_id"));

            try {
                $nexmo->message()->send([
                    'to' => "+255762764819",
                    'from' => '@leggetter',
                    'text' => "Hello {$farmer->full_name}, Tumepokea mzigo wako wa  {$product->name} wenye jumla ya kilo {$purchase->weight_before_processing} kabla ya kuchambua na kilo {$purchase->weight_after_processing} baada ya uchambuzi, ambao thamini yake ni Tsh. {$purchase->amount}"
                ]);
            } catch (Client\Exception\Request $e) {

            } catch (Client\Exception\Server $e) {

            } catch (Client\Exception\Exception $e) {

            }
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
     * @return RedirectResponse
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
