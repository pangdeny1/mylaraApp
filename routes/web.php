<?php

Route::view("/", "welcome");

Route::view("template", "template");

Route::get("test", function (\Nexmo\Client $nexmo){

    // $message = $nexmo->message()->send([
    //     'to' => "255762764819",
    //     'from' => '@leggetter',
    //     'text' => 'Sending SMS from Laravel. Woohoo!'
    // ]);

    // return "Sent";
});

Auth::routes();

Route::get('/home', [
    "as" => "home",
    "use" => "HomeController@index"
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

Route::resource("purchases", "PurchasesController");
Route::resource("farmers", "FarmersController");


Route::resource("products", "ProductsController");
Route::resource("product_categories", "ProductCategoriesController");


