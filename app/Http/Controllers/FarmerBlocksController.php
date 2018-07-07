<?php

namespace App\Http\Controllers;

use App\Block;
use App\Farmer;
use App\Http\Requests\BlockCreateRequest;
use Illuminate\Http\Request;

class FarmerBlocksController extends Controller
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
        return view("farmers.blocks.create", compact("farmer"));
    }

    public function store(BlockCreateRequest $request, Farmer $farmer)
    {
        Block::create($request->only(["number", "size", "size_unit", "farm_id", "product_id", "description"]));

        return redirect()->route("farmers.show", $farmer);
    }
}
