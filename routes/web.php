<?php


use Olifolkerd\Convertor\Convertor;
use PragmaRX\Countries\Package\Countries;

Route::view("/", "welcome");

Route::view("template", "template");

Route::get("test", function (){
    //return $country   = Countries::where('name.common', "Tanzania")->first();
    //return ;
    //return $measurements = Converter::getMeasurements();
    //return $simpleConvertor = (new Convertor(10, "g"))->to("kg");
});

Auth::routes();
Route::get('home', [
    "as" => "home",
    "uses" => "HomeController@index"
]);
Route::get("accounts/{user}/activations", [
    "as" => "accounts.activate",
    "uses" => "AccountActivationsController@create",
]);
Route::patch("purchases/{purchase}/weights", [
    "as" => "purchases.weights.update",
    "uses" => "PurchasesWeightsController@update",
]);
Route::post("purchases/{purchase}/status", [
    "as" => "purchases.acceptances",
    "uses" => "PurchaseStatusesController@store"
]);
Route::delete("purchases/{purchase}/status", [
    "as" => "purchases.rejections",
    "uses" => "PurchaseStatusesController@destroy"
]);
Route::post("purchases/{purchase}/remarks", [
    "as" => "purchases.remarks.store",
    "uses" => "PurchaseRemarksController@store",
]);

Route::post("remarks/{remark}/replays", [
    "as" => "remarks.replays.store",
    "uses" => "RemarkReplaysController@store",
]);

Route::prefix('reports')->group(function () {
    Route::get("purchases", [
        "as" => "purchases.reports",
        "uses" => "PurchasesReportsController@index",
    ]);
    Route::get("products", [
        "as" => "products.reports",
        "uses" => "ProductsReportsController@index",
    ]);
});

Route::resource("purchases", "PurchasesController");
Route::resource("farmers", "FarmersController");

Route::resource("users", "UsersController");
Route::resource("roles", "RolesController");
Route::resource("products", "ProductsController");
Route::resource("product_categories", "ProductCategoriesController");


