<?php

namespace App\Http\Controllers;

use App\Http\Requests\ProductCreateRequest;
use App\Product;
use App\ProductCategory;
use App\ProductPrice;
use Illuminate\Auth\Access\AuthorizationException;
use Illuminate\Http\RedirectResponse;
use Illuminate\View\View;

class ProductsController extends Controller
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
        $this->authorize("view", Product::class);

        $products = Product::latest()->paginate();

        return view("products.index", compact("products"));
    }

    /**
     * @return View
     * @throws AuthorizationException
     */
    public function create()
    {
        $this->authorize("create", Product::class);

        $productCategories = ProductCategory::all();

        return view("products.create", compact("productCategories"));
    }

    /**
     * @param ProductCreateRequest $request
     * @return RedirectResponse
     * @throws AuthorizationException
     */
    public function store(ProductCreateRequest $request)
    {
        $this->authorize("create", Product::class);

        $product = Product::create($request->only(["name", "description"]));

        $product->categories()->attach(request("category_id"));

        return redirect()->route("products.index");
    }
}
