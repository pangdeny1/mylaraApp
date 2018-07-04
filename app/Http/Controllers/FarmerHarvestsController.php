<?php

namespace App\Http\Controllers;

use App\Batch;
use App\Farmer;
use App\Harvest;
use App\Http\Requests\HarvestCreateRequest;
use Illuminate\Auth\Access\AuthorizationException;
use Illuminate\Http\Request;
use Illuminate\View\View;

class FarmerHarvestsController extends Controller
{
    public function __construct()
    {
        $this->middleware("auth");
    }

    /**
     * @param Farmer $farmer
     * @return View
     * @throws AuthorizationException
     */
    public function index(Farmer $farmer)
    {
        $this->authorize("view", Farmer::class);

        return view("farmers.harvests.index", compact("farmer"));
    }

    /**
     * @param Farmer $farmer
     * @return View
     * @throws AuthorizationException
     */
    public function create(Farmer $farmer)
    {
        $this->authorize("create", $farmer);

        return view("farmers.harvests.create", compact("farmer"));
    }

    public function store(HarvestCreateRequest $request, Farmer $farmer)
    {
        $batch = Batch::create([
            "number" => request("batch_number"),
            "description" => request("batch_description", ""),
        ]);

        $farmer->batches()->attach($batch);

        Harvest::create([
            "expected_amount" => request("expected_amount"),
            "amount_unit" => request("amount_unit"),
            "expected_date" => request("expected_date"),
            "farm_id" => request("farm_id"),
            "block_id" => request("block_id"),
            "product_id" => request("product_id"),
            "description" => request("description"),
            "batch_id" => $batch->id
        ]);

        return redirect()->route("farmers.show", $farmer);
    }
}
