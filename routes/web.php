<?php

Auth::routes();

Route::view("/", "welcome");

Route::view("template", "template");

Route::get('dashboard', [
    "as" => "home",
    "uses" => "HomeController@index"
]);

Route::post("clusters/{batch}/members",   [
    "as"    => "clusters.members.store",
    "uses"  => "ClusterMembersController@store"
]);

Route::get("accounts/{user}/activations", [
    "as" => "accounts.activate",
    "uses" => "AccountActivationsController@create",
]);

Route::patch("purchases/{purchase}/packing_house_weight", [
    "as" => "packing_house_weight.record",
    "uses" => "PackingHouseWeightController@update",
]);
Route::patch("purchases/{purchase}/graded_weight", [
    "as" => "graded_weight.record",
    "uses" => "GradedWeightController@update",
]);

Route::delete("purchases/{purchase}/rejections", [
    "as" => "purchases.rejections.delete",
    "uses" => "PurchaseRejectionsController@destroy"
]);
Route::patch("purchases/{purchase}/completions", [
    "as" => "purchases.completions.store",
    "uses" => "PurchaseCompletionsController@store"
]);
Route::patch("purchases/{purchase}/payment_completions", [
    "as" => "purchases.payment_completions.store",
    "uses" => "PurchasePaymentCompletionsController@store"
]);
Route::post("purchases/{purchase}/remarks", [
    "as" => "purchases.remarks.store",
    "uses" => "PurchaseRemarksController@store",
]);

Route::post("remarks/{remark}/replays", [
    "as" => "remarks.replays.store",
    "uses" => "RemarkReplaysController@store",
]);

Route::get("farmers/{farmer}/farms", [
    "as" => "farmers.farms.index",
    "uses" => "FarmerFarmsController@index",
]);
Route::get("farmers/{farmer}/farms/create", [
    "as" => "farmers.farms.create",
    "uses" => "FarmerFarmsController@create",
]);
Route::post("farmers/{farmer}/farms", [
    "as" => "farmers.farms.store",
    "uses" => "FarmerFarmsController@store",
]);

Route::get("farmers/{farmer}/blocks", [
    "as" => "farmers.blocks.index",
    "uses" => "FarmerBlocksController@index",
]);
Route::get("farmers/{farmer}/blocks/create", [
    "as" => "farmers.blocks.create",
    "uses" => "FarmerBlocksController@create",
]);
Route::post("farmers/{farmer}/blocks", [
    "as" => "farmers.blocks.store",
    "uses" => "FarmerBlocksController@store",
]);

Route::get("farmers/{farmer}/harvests", [
    "as" => "farmers.harvests.index",
    "uses" => "FarmerHarvestsController@index",
]);
Route::get("farmers/{farmer}/harvests/create", [
    "as" => "farmers.harvests.create",
    "uses" => "FarmerHarvestsController@create",
]);
Route::post("farmers/{farmer}/harvests", [
    "as" => "farmers.harvests.store",
    "uses" => "FarmerHarvestsController@store",
]);

Route::get("farmers/{farmer}/sales", [
    "as" => "farmers.sales.index",
    "uses" => "FarmerSalesController@index",
]);
Route::get("farmers/{farmer}/batches", [
    "as" => "farmers.batches.index",
    "uses" => "FarmerBatchesController@index",
]);
Route::get("farmers/{farmer}/settings", [
    "as" => "farmers.settings.index",
    "uses" => "FarmerSettingsController@index",
]);

Route::resource("farmers", "FarmersController");
Route::post("farmers/{farmer}", "FarmersController@update");

Route::resource("purchases", "PurchasesController");
Route::resource("clusters", "ClustersController");


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

Route::prefix('settings')->group(function () {
    Route::post("groups/{group}/products", [
        "as" => "groups.products.store",
        "uses" => "GroupProductsController@store"
    ]);
    Route::get("group_products", [
        "as" => "group_products.index",
        "uses" => "GroupProductsController@index"
    ]);
    Route::patch("group_products/{id}", [
        "as" => "group_products.update",
        "uses" => "GroupProductsController@update"
    ]);

     Route::get("changepassword", [
        "as" => "changepassword.index",
        "uses" => "ChangePasswordControllerr@index"
    ]);

     Route::post("changepassword/{user}","Auth\ChangePasswordController@update");
    Route::resource("blocks", "BlocksController");
    Route::post("blocks/{block}", "BlocksController@update");
    Route::resource("groups", "GroupsController");
    Route::post("groups/{group}", "GroupsController@update");
    Route::resource("users", "UsersController");
    Route::resource("roles", "RolesController");
    Route::resource("products", "ProductsController");
    Route::resource("batches", "BatchesController");
    Route::resource("product_categories", "ProductCategoriesController");
    Route::resource("changepassword", "Auth\ChangePasswordController");
});

Route::get("users/{user}/passwordchange", [
    "as" => "password.change",
    "uses" => "ResetPasswordController@change",
]);




