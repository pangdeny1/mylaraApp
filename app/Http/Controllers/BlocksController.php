<?php

namespace App\Http\Controllers;

use App\Block;
use App\Http\Requests\BlockCreateRequest;
use App\State;
use Illuminate\Auth\Access\AuthorizationException;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\View\View;

class BlocksController extends Controller
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
        $this->authorize("view", Block::class);

        $blocks = Block::latest()->paginate();

        return view("blocks.index", compact("blocks"));
    }

    /**
     * @return View
     * @throws AuthorizationException
     */
    public function create()
    {
        $this->authorize("create", Block::class);

        return view("blocks.create", ["states" => State::getCountryName("Tanzania"),]);
    }

    /**
     * @param BlockCreateRequest $request
     * @return RedirectResponse
     * @throws AuthorizationException
     */
    public function store(Request $request)
    {
        $this->authorize("create", Block::class);

        $this->validate($request, [
            "number" => "required",
            "description" => "required",
        ]);

        $block = Block::create($request->only(["number", "description"]));

        $block->address()->create($request->only(["street", "state", "country"]));

        return redirect()->route("blocks.index");
    }
}
