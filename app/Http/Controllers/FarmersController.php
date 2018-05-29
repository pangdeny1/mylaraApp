<?php

namespace App\Http\Controllers;

use App\Farmer;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;

class FarmersController extends Controller
{
    public function __construct()
    {
        $this->middleware("auth");
    }

    public function index()
    {
        $farmers = Farmer::latest()->paginate();

        return view("farmers.index", compact("farmers"));
    }

    public function create()
    {
        return view("farmers.create");
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            "first_name"    => "required",
            "last_name"     => "required",
            "phone"         => "required",
        ]);

        Farmer::create([
            "first_name" => request("first_name"),
            "last_name" => request("last_name"),
            "phone" => request("phone"),
        ]);

        return redirect()->route("farmers.index");
    }

    public function update(Farmer $farmer)
    {
        $farmer->update([
            "first_name" => \request("first_name", $farmer->first_name),
            "last_name" => \request("last_name", $farmer->last_name),
            "phone" => \request("phone", $farmer->phone),
        ]);

        return redirect()->back();
    }

    /**
     * @param Farmer $farmer
     * @return RedirectResponse
     * @throws \Exception
     */
    public function destroy(Farmer $farmer)
    {
        $farmer->delete();

        return redirect()->route("farmers.index");
    }
}
