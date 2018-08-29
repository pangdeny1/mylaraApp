<?php

namespace App\Http\Controllers;


use Sms;
use App\Batch;
use App\Farmer;
use App\Product;
use App\Purchase;
use App\HouseholdBlock;
use App\DeliveryNote;
use App\Harvest;
use Nexmo\Client;
use Illuminate\View\View;
use App\Exports\BatchPurchaseExport;
use App\Http\Requests\PurchaseCreateRequest;
use Illuminate\Auth\Access\AuthorizationException;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;

class ClusterPurchasesController extends Controller
{
    public function index(Batch $batch)
    {
        return view("clusters.purchases.index", compact("batch"));
    }

    public function store(PurchaseCreateRequest $request, Batch $batch)
    {
        $this->authorize("create", Purchase::class);

        $deliveryNote = DeliveryNote::firstOrCreate(["number" => request("delivery_note_number")]);

        $farmer = Farmer::findOrFail(request("farmer_id"));

        $block  = HouseholdBlock::find(request("block_id"));

        $harvest = Harvest::create([
            "farmer_id" => request("farmer_id"),
            "batch_id" => $batch->id,
            "household_block_id" => request("block_id"),
            "expected_date" => request("harvest_date"),
            "amount_unit" => request("weight_unit"),
            "expected_amount" => request("field_weight"),
            "description" => request("description", ""),
        ]);
        
        $purchase = Purchase::create([
            "delivery_note_id" => $deliveryNote->id,
            "product_id" => $block->product_id,
            "harvest_id" => $harvest->id,
            "farmer_id" => $farmer->id,
            "block_id" => $block->id,
            "batch_id" => $batch->id,
            "crates_count" => request("crates_count"),
            "weight_unit" => request("weight_unit"),
            "field_weight" => request("field_weight"),
            "creator_id" => auth()->id(),
        ]);

        Sms::send(phone($purchase->farmer->phone, "TZ"), $this->messageBody(
            $purchase->farmer,
            $purchase->product,
            $purchase
        ));

        return redirect()->back()->with('status', 'Purchase was recorded successfully!');
    }

    public function exportAsPdf(Batch $batch)
    {
        $pdf = \PDF::loadView('clusters.purchases.pdf', compact('batch'));

        return $pdf->download('delivery_note.pdf');
    }

    public function print(Batch $batch)
    {
        $pdf = \PDF::loadView('clusters.purchases.pdf', compact('batch'));

        return $pdf->stream();
    }

    public function exportAsExcel(Batch $batch)
    {
        return (new BatchPurchaseExport($batch))->download('invoices.xlsx');
    }

    public function messageBody($farmer, $product, $purchase)
    {
        $format = "Habari %s, Mazao yako %s wenye jumla ya kilo %s yamepokelewa, Utajulishwa thamani yake baada ya uchambuzi";

        return sprintf($format,
            $farmer->full_name,
            $product->name,
            $purchase->weight_before,
            $purchase->weight_after,
            $purchase->amount,
            $purchase->field_weight
        );
    }
}
