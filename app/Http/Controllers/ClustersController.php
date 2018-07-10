<?php

namespace App\Http\Controllers;

use App\Batch;
use Illuminate\Http\Request;

class ClustersController extends Controller
{
    public function __construct()
    {
        $this->middleware("auth");
    }

    public function index()
    {
        $clusters = Batch::latest()->paginate();

        return view("clusters.index", compact("clusters"));
    }
}
