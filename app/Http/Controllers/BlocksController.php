<?php

namespace App\Http\Controllers;

use App\Block;
use App\Http\Requests\BlockCreateRequest;
use App\State;
use Illuminate\Auth\Access\AuthorizationException;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\View\View;

class BlocksController extends Controller
{
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
        $this->authorize("view", Block::class);

        $blocks = Block::latest()->paginate();

        return view("blocks.index", compact("blocks"));
    }

    /**
     * @return View
     * @throws AuthorizationException
     */
    public function create()
    {
        $this->authorize("create", Block::class);

        return view("blocks.create", ["states" => State::getCountryName("Tanzania"),]);
    }

    /**
     * @param BlockCreateRequest $request
     * @return RedirectResponse
     * @throws AuthorizationException
     */
    public function store(Request $request)
    {
        $this->authorize("create", Block::class);

        $this->validate($request, [
            "number" => "required",
            "description" => "required",
        ]);

        $block = Block::create($request->only(["number", "description"]));

        $block->address()->create($request->only(["street", "state", "country"]));

        return redirect()->route("blocks.index");
    }

      public function edit(Block $block)
    {
        $this->authorize("edit", Block::class);

        return view("blocks.edit", ["states" => State::getCountryName("Tanzania"),
            "block"=>$block]);
    }


    public function update(Request $request,Block $block)
    {
        $this->authorize("update", $block);
        $this->validate($request, [
            "number" => "required",
            "description" => "required",
            
        ]);

        $block->update([
            "number" => request("number"),
            "description" => request("description"),
            ]);


        if ($block->address()->exists()){
            $block->address()->update([
                "street" => request("street", optional($block->address)->street),
                "address" => request("address", optional($block->address)->address),
                "state" => request("state", optional($block->address)->state),
                "country" => request("country", optional($block->address)->country),
                "postal_code" => request("postal_code", optional($block->address)->postal_code),
            ]);
        } else {
            $block->address()->create([
                "street" => request("street"),
                "address" => request("address", ""),
                "state" => request("state"),
                "country" => request("country"),
                "postal_code" => request("postal_code"),
            ]);
        }

        //$block->groups()->sync($request->group_id);
        return redirect()->route("blocks.index");
        //return redirect()->back();
    }

}
