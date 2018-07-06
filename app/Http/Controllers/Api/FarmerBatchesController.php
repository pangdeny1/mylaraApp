<?php

namespace App\Http\Controllers\Api;

use App\Farmer;
use App\Http\Resources\BatchesCollection;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class FarmerBatchesController extends Controller
{
    public function index(Farmer $farmer)
    {
        return new BatchesCollection($farmer->batches);
    }
}
