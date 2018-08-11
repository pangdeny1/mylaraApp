<?php

namespace App\Http\Controllers;

use App\ProductPrice;
use App\Group;
use App\State;
use Illuminate\Http\Request;

class GroupsController extends Controller
{
    public function __construct()
    {
        $this->middleware("auth");
    }

    public function index()
    {
        $groups = Group::latest()->paginate();

        return view("groups.index", compact("groups"));
    }


    public function create()
    {
        return view("groups.create");
    }


    public function store(Request $request)
    {
        $this->validate($request, [
            "name" => "required",
            "description" => "required",
            "product_id" => "required",
            // "currency" => "required",
            // "amount" => "required",
            // "unit" => "required",
            // "unit_value" => "required",
            // "valid_from" => "required|date",
            // "valid_till" => "nullable|date"
        ]);

        $group = Group::create($request->only(["name", "description"]));

        $group->products()->attach($request->product_id, ["status" => "active"]);
    
        return redirect()->route("groups.index");
    }


    public function show(Group $group)
    {
        //
    }


    public function edit(Group $group)
    {
         $this->authorize("edit", Group::class);

        return view("groups.edit", ["states" => State::getCountryName("Tanzania"),
            "group"=>$group]);
    }


    public function update(Request $request, Group $group)
    {
        $this->authorize("update", $group);
        $this->validate($request, [
            "name" => "required",
            "description" => "required",
            
        ]);

        $group->update([
            "name" => request("name"),
            "description" => request("description"),
            ]);

/*
        if ($group->address()->exists()){
            $group->address()->update([
                "street" => request("street", optional($group->address)->street),
                "address" => request("address", optional($group->address)->address),
                "state" => request("state", optional($group->address)->state),
                "country" => request("country", optional($group->address)->country),
                "postal_code" => request("postal_code", optional($group->address)->postal_code),
            ]);
        } else {
            $group->address()->create([
                "street" => request("street"),
                "address" => request("address", ""),
                "state" => request("state"),
                "country" => request("country"),
                "postal_code" => request("postal_code"),
            ]);
        }
        */

        //$group->groups()->sync($request->group_id);
        return redirect()->route("groups.index");
        //return redirect()->back();
    }


    public function destroy(Group $group)
    {
        //
    }
}
