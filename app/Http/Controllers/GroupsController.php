<?php

namespace App\Http\Controllers;

use App\ProductPrice;
use App\Group;
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
        //
    }


    public function update(Request $request, Group $group)
    {
        //
    }


    public function destroy(Group $group)
    {
        //
    }
}
