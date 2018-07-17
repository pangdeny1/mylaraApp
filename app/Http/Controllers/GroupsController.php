<?php

namespace App\Http\Controllers;

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
            "description" => "required"
        ]);

        Group::create($request->only(["name", "description"]));

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
