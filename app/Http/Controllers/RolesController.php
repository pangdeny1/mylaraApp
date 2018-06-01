<?php

namespace App\Http\Controllers;

use App\Role;
use Illuminate\Http\Request;

class RolesController extends Controller
{
    public function __construct()
    {
        $this->middleware("auth");
    }

    public function index()
    {
        $roles = Role::paginate();

        return view("roles.index", compact("roles"));
    }

    public function create()
    {
        return view("roles.create");
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            "name" => "required|unique:roles,name",
            "title" => "required",
            "description" => "required",
            "permissions" => "required|array"
        ]);

        $entities = [
            "users" => \App\User::class,
            "farmers" => \App\Farmer::class,
            "products" => \App\Product::class,
            "product-categories" => \App\ProductCategory::class,
            "purchases" => \App\User::class,
        ];

        $role = Role::forceCreate($request->only(["name", "title", "description"]));

        foreach (request("permissions") as $key => $permissions) {
            foreach ($permissions as $name => $permission) {
                \Bouncer::allow($role->name)->to($name, $entities[$key]);
            }
        }

        return redirect()->route("roles.index");
    }

    public function edit(Role $role)
    {
        return view("roles.edit", compact("role"));
    }

    public function update(Request $request, Role $role)
    {
        $this->validate($request, [
            "name" => "required",
            "title" => "required",
            "description" => "required",
        ]);

        $role->update($request->only(["name", "title", "description"]));

        return redirect()->route("roles.index");
    }
}
