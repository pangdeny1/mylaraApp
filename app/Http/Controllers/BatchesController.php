<?php

namespace App\Http\Controllers;

use App\Batch;
use App\Http\Requests\BatchCreateRequest;
use Illuminate\Auth\Access\AuthorizationException;
use Illuminate\Http\Request;
use Illuminate\View\View;

class BatchesController extends Controller
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
        $this->authorize("view", Batch::class);

        $batches = Batch::latest()->paginate();

        return view("batches.index", compact("batches"));
    }

    /**
     * @return View
     * @throws AuthorizationException
     */
    public function create()
    {
        $this->authorize("create", Batch::class);

        return view("batches.create");
    }

    /**
     * @param BatchCreateRequest $request
     * @return \Illuminate\Http\RedirectResponse
     * @throws AuthorizationException
     */
    public function store(BatchCreateRequest $request)
    {
        $this->authorize("create", Batch::class);

        $this->validate($request, [
            "farmers" => function($attribute, $value, $fail) {
                if (count($value) > request("max_count")){
                    return $fail($attribute.' is selected exceed maximum limit.');
                }
            },
        ]);

        $batch = Batch::create($request->only([
            "number",
            "valid_from",
            "valid_till",
            "description",
            "max_count",
            "block_id",
            "expected_arrival_time",
            "expected_arrival_temperature",
            "expected_delivery_time",
            "expected_departure_time",
            "expected_harvest_time",
        ]));

      /* if(count($request->farmers)){
            $batch->farmers()->attach(request("farmers"));

            if ($batch->max_count == $batch->farmers->count()) {
                $batch->update(["status" => "active"]);
            }
        }
        */

        return redirect()->route("batches.index");
    }
}
