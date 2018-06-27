<?php

namespace App\Http\Controllers;

use App\Farmer;
use Illuminate\Http\Request;

class FarmerFarmsController extends Controller
{
    public function __construct()
    {
        $this->middleware("auth");
    }

    /**
     * @param Farmer $farmer
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function index(Farmer $farmer)
    {
        $this->authorize("view", $farmer);

        return view("farmers.farms.index", compact("farmer"));
    }
}
