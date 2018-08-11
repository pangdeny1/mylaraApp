<?php

namespace App\Http\Controllers;

use App\Product;
use App\GroupProduct;
use App\HouseholdBlock;
use App\Farmer;
use App\Block;
use App\Http\Requests\BlockCreateRequest;
use Illuminate\Http\Request;

class FarmerHouseholdBlocksController extends Controller
{
    public function __construct()
    {
        $this->middleware("auth");
    }

    public function index(Farmer $farmer)
    {
        return view("farmers.blocks.index", compact("farmer"));
    }

    public function create(Farmer $farmer)
    {
        // Get products according to farmers group
        if($farmer->groups->count()){
            $groupIds   = $farmer->groups->pluck("id");
            $productIds = GroupProduct::whereIn("group_id", $groupIds)->pluck("product_id");
            $products   = Product::find($productIds);
        } else {
            $products = Product::all();
        }

        return view("farmers.blocks.create", [
            "farmer" => $farmer,
            "products" => $products,
        ]);
    }

      public function edit(Block $block)
    {
        $this->authorize("edit", Block::class);

        return view("blocks.edit", ["states" => State::getCountryName("Tanzania"),]);
    }


    public function store(BlockCreateRequest $request, Farmer $farmer)
    {
        HouseholdBlock::create($request->only(["number", "size", "size_unit", "farm_id", "product_id", "description"]));

        return redirect()->route("farmers.show", $farmer);
    }
}
