<?php

namespace App\Http\Controllers;

use App\Product;
use App\ProductCategory;
use App\ProductPrice;
use Illuminate\Http\Request;

class ProductsController extends Controller
{
    public function __construct()
    {
        $this->middleware("auth");
    }

    public function index()
    {
        $products = Product::latest()->paginate();

        return view("products.index", compact("products"));
    }

    public function create()
    {
        $productCategories = ProductCategory::all();

        return view("products.create", compact("productCategories"));
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            "name" => "required",
            "description" => "required",
            "category_id" => "required|exists:product_categories,id",
            "amount" => "required|numeric",
            "currency" => "required|in:TZS",
            "unit" => "required|in:kg,gm",
            "unit_value" => "required|numeric",
        ]);

        $product = Product::create([
            "name" => request("name"),
            "description" => request("description"),
        ]);

        ProductPrice::create([
            "amount" => request("amount"),
            "currency" => request("currency"),
            "unit" => request("unit"),
            "unit_value" => request("unit_value"),
            "product_id" => $product->id,
            "valid_from" => request("valid_from"),
            "valid_till" => request("valid_till"),
            "is_current_price" => true,
        ]);

        $product->categories()->attach(request("category_id"));

        return redirect()->route("products.index");
    }
}
