<?php

namespace App\Http\Controllers;

use App\Http\Requests\ProductCategoryCreateRequest;
use App\ProductCategory;
use Illuminate\Auth\Access\AuthorizationException;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class ProductCategoriesController extends Controller
{
    public function __construct()
    {
        $this->middleware("auth");
    }

    /**
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     * @throws AuthorizationException
     */
    public function index()
    {
        $this->authorize("view", ProductCategory::class);

        $productCategories = ProductCategory::paginate(10);

        return view("products.categories.index", compact("productCategories"));
    }

    /**
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     * @throws AuthorizationException
     */
    public function create()
    {
        $this->authorize("create", ProductCategory::class);

        return view("products.categories.create");
    }


    /**
     * @param ProductCategoryCreateRequest $request
     * @return RedirectResponse
     * @throws AuthorizationException
     */
    public function store(ProductCategoryCreateRequest $request)
    {
        $this->authorize("create", ProductCategory::class);

        ProductCategory::create($request->only(["name", "description",]));

        return redirect()->route("product_categories.index");
    }

    /**
     * Display the specified resource.
     *
     * @param  ProductCategory  $productCategory
     * @return Response
     */
    public function show(ProductCategory $productCategory)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  ProductCategory  $productCategory
     * @return Response
     */
    public function edit(ProductCategory $productCategory)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  Request  $request
     * @param  ProductCategory  $productCategory
     * @return Response
     */
    public function update(Request $request, ProductCategory $productCategory)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  ProductCategory  $productCategory
     * @return Response
     */
    public function destroy(ProductCategory $productCategory)
    {
        //
    }
}
