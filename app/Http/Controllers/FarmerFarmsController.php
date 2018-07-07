<?php

namespace App\Http\Controllers;

use App\Farmer;
use App\Http\Requests\FarmCreateRequest;
use App\State;
use Illuminate\Auth\Access\AuthorizationException;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\View\View;

class FarmerFarmsController extends Controller
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
        $this->authorize("view", $farmer);

        return view("farmers.farms.index", compact("farmer"));
    }

    /**
     * @param Farmer $farmer
     * @return View
     * @throws AuthorizationException
     */
    public function create(Farmer $farmer)
    {
        $this->authorize("create", $farmer);

        return view("farmers.farms.create", [
            "farmer" => $farmer,
            "states" => State::getCountryName("Tanzania"),
        ]);
    }

    /**
     * @param FarmCreateRequest $request
     * @param Farmer $farmer
     * @return RedirectResponse
     * @throws AuthorizationException
     */
    public function store(FarmCreateRequest $request, Farmer $farmer)
    {
        $this->authorize("create", $farmer);

        $farm = $farmer->farms()->create($request->only(["size", "size_unit", "description"]));

        $farm->address()->create($request->only(["country", "state"]));

        return redirect()->route("farmers.show", $farmer);
    }
}
