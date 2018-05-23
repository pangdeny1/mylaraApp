<?php

use Illuminate\Database\Seeder;

class ProductCategoryTableSeeder extends Seeder
{
    public function run()
    {
        $categories = [
            [
                "name" => "Cereals",
                "description" => ""
            ],
            [
                "name" => "Pulses",
                "description" => ""
            ],
            [
                "name" => "Vegetables",
                "description" => ""
            ],
            [
                "name" => "Fruits",
                "description" => ""
            ],
            [
                "name" => "Nuts",
                "description" => ""
            ],
            [
                "name" => "Oilseeds",
                "description" => ""
            ],
            [
                "name" => "Sugars and Starches",
                "description" => ""
            ],
            [
                "name" => "Fibres",
                "description" => ""
            ],
            [
                "name" => "Beverages",
                "description" => ""
            ],
            [
                "name" => "Narcotics",
                "description" => ""
            ],
            [
                "name" => "Spices",
                "description" => ""
            ],
            [
                "name" => "Condiments",
                "description" => ""
            ],
            [
                "name" => "Rubber Forages",
                "description" => ""
            ],
            [
                "name" => "Green and Green leaf manure",
                "description" => ""
            ],
        ];

        foreach ($categories as $category) {
            factory(\App\ProductCategory::class)->create([
                "name" => $category["name"]
            ]);
        }
    }
}
