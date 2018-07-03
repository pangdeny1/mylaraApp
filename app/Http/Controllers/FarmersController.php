<?php

namespace App\Http\Controllers;

use App\Farm;
use App\Http\Requests\FarmerCreateRequest;
use App\State;
use App\Farmer;
use Illuminate\Auth\Access\AuthorizationException;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\View\View;

class FarmersController extends Controller
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
        $this->authorize("view", Farmer::class);

        $farmers = Farmer::latest()->paginate();

        return view("farmers.index", compact("farmers"));
    }

    /**
     * @return View
     * @throws AuthorizationException
     */
    public function create()
    {
        $this->authorize("create", Farmer::class);

        return view("farmers.create", [
            "states" => State::getCountryName("Tanzania"),
        ]);
    }

    /**
     * @param FarmerCreateRequest $request
     * @return RedirectResponse
     * @throws AuthorizationException
     */
    public function store(FarmerCreateRequest $request)
    {
        $this->authorize("create", Farmer::class);

        $farmer = Farmer::create([
            "first_name" => request("first_name"),
            "last_name" => request("last_name"),
            "phone" => request("phone"),
            "email" => request("email"),
            "gender" => request("gender"),
            "creator_id" => auth()->id(),
        ]);

        $farmer->address()->create($request->only([
            "street",
            "address",
            "state",
            "country",
            "postal_code",
        ]));
        
        return redirect()->route("farmers.show", $farmer);
    }

    /**
     * @param Farmer $farmer
     * @return RedirectResponse
     * @throws AuthorizationException
     */
    public function update(Farmer $farmer)
    {
        $this->authorize("edit", $farmer);

        $farmer->update([
            "first_name" => request("first_name", $farmer->first_name),
            "last_name" => request("last_name", $farmer->last_name),
            "phone" => request("phone", $farmer->phone),
            "email" => request("email", $farmer->email),
            "gender" => request("gender", $farmer->gender),
        ]);

        return redirect()->back();
    }

    /**
     * @param Farmer $farmer
     * @return View
     * @throws AuthorizationException
     */
    public function show(Farmer $farmer)
    {
        $this->authorize("view", $farmer);

        return view("farmers.show", compact("farmer"));
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
