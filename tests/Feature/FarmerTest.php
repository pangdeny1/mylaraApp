<?php

namespace Tests\Feature;

use Tests\TestCase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Foundation\Testing\RefreshDatabase;

class FarmerTest extends TestCase
{
    use RefreshDatabase;

    use WithFaker;

    public function test_register_a_new_farmer()
    {
        $response = $this->post(route("farmers.store"), [
            "first_name" => $firstName = $this->faker->firstName,
            "last_name" => $lastName = $this->faker->lastName,
            "phone" => $phone = $this->faker->phoneNumber,
        ]);

        $this->assertDatabaseHas("farmers", [
            "first_name" => $firstName,
            "last_name" => $lastName,
            "phone" => $phone,
        ]);

        $response->assertRedirect(route("farmers.index"));
    }

    public function test_upon_register_a_new_farmer_create_view_must_be_exist()
    {
        $this->withoutExceptionHandling();

        $response = $this->get(route("farmers.create"));

        $response
            ->assertViewIs("farmers.create")
            ->assertSee("First name")
            ->assertSee("Last name")
            ->assertSee("Phone number");
    }

    public function test_first_name_is_mandatory_for_a_new_farmer()
    {
        $response = $this->post(route("farmers.store"), [
            "last_name" => $lastName = $this->faker->lastName,
            "phone" => $phone = $this->faker->phoneNumber,
        ]);

        $response->assertSessionHasErrors(["first_name"]);
    }

    public function test_last_name_is_mandatory_for_a_new_farmer()
    {
        $response = $this->post(route("farmers.store"), [
            "first_name" => $lastName = $this->faker->firstName,
            "phone" => $phone = $this->faker->phoneNumber,
        ]);

        $response->assertSessionHasErrors(["last_name"]);
    }

    public function test_phone_number_is_mandatory_for_a_new_farmer()
    {
        $response = $this->post(route("farmers.store"), [
            "first_name" => $firstName = $this->faker->firstName,
            "last_name" => $lastName = $this->faker->phoneNumber,
        ]);

        $response->assertSessionHasErrors(["phone"]);
    }

    public function test_edit_an_existing_farmer()
    {
        $this->withoutExceptionHandling();

        $farmer = factory(\App\Farmer::class)->create();

        $response = $this->put(route("farmers.update", $farmer), [
            "first_name" => $firstName = $this->faker->firstName,
        ]);

        $this->assertDatabaseMissing("farmers", [
            "first_name" => $farmer->first_name
        ]);

        $this->assertDatabaseHas("farmers", [
            "id" => $farmer->id,
            "last_name" => $farmer->last_name,
        ]);

        //$response->assertRedirect(route("farmers.index"));
    }

    public function test_delete_existing_farmer()
    {
        $this->withoutExceptionHandling();

        $farmer = factory(\App\Farmer::class)->create();

        $response = $this->delete(route("farmers.destroy", $farmer), []);

        $this->assertDatabaseMissing("farmers", [
            "id" => $farmer->id
        ]);

        $response->assertRedirect(route("farmers.index"));
    }
}
