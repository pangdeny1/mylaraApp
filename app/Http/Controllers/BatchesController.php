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

        return \view("batches.create");
    }

    /**
     * @param BatchCreateRequest $request
     * @return \Illuminate\Http\RedirectResponse
     * @throws AuthorizationException
     */
    public function store(BatchCreateRequest $request)
    {
        $this->authorize("create", Batch::class);

        $batch = Batch::create($request->only([
            "number",
            "valid_from",
            "valid_till",
            "description",
            "max_count"
        ]));

        $batch->farmers()->attach(request("farmers"));

        return redirect()->route("batches.index");
    }
}
