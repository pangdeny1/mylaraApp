<?php

use Illuminate\Database\Seeder;

class ProductCategoryTableSeeder extends Seeder
{
    public function run(\Faker\Generator $faker)
    {
        $categories = [
            [
                "name" => "Cereals",
                "description" => $faker->sentence,
            ],
            [
                "name" => "Pulses",
                "description" => $faker->sentence,
            ],
            [
                "name" => "Vegetables",
                "description" => $faker->sentence,
            ],
            [
                "name" => "Fruits",
                "description" => $faker->sentence,
            ],
            [
                "name" => "Nuts",
                "description" => $faker->sentence,
            ],
            [
                "name" => "Oilseeds",
                "description" => $faker->sentence,
            ],
            [
                "name" => "Sugars and Starches",
                "description" => $faker->sentence,
            ],
            [
                "name" => "Fibres",
                "description" => $faker->sentence,
            ],
            [
                "name" => "Beverages",
                "description" => $faker->sentence,
            ],
            [
                "name" => "Narcotics",
                "description" => $faker->sentence,
            ],
            [
                "name" => "Spices",
                "description" => $faker->sentence,
            ],
            [
                "name" => "Condiments",
                "description" => $faker->sentence,
            ],
            [
                "name" => "Rubber Forages",
                "description" => $faker->sentence,
            ],
            [
                "name" => "Green and Green leaf manure",
                "description" => $faker->sentence,
            ],
        ];

        foreach ($categories as $category) {
            factory(\App\ProductCategory::class)->create([
                "name" => $category["name"]
            ]);
        }
    }
}
