<?php

namespace App\Http\Controllers;

use App\Events\UserRegistered;
use App\Role;
use App\State;
use App\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class UsersController extends Controller
{
    public function __construct()
    {
        $this->middleware("auth");
    }

    public function index()
    {
        $users = User::latest()->paginate();

        return view("users.index", compact("users"));
    }

    public function create()
    {
        $states = State::getCountryName("Tanzania");

        $roles  = Role::get();

        return view("users.create", compact("states", "roles"));
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            "first_name" => "required",
            "last_name" => "required",
            "email" => "required|email|unique:users",
            "phone" => "required",
            "country" => "required",
            "gender" => ["required", Rule::in(["male","female"])],
            "birthday" => "required",
            "roles" => "required|array",
            "roles.*" => "required|exists:roles,name",
        ]);

        $user = User::create([
            "first_name" => request("first_name"),
            "last_name" => request("last_name"),
            "email" => request("email"),
            "phone" => request("phone"),
            "country" => request("country"),
            "gender" => request("gender"),
            "birthday" => request("birthday"),
            "password" => $password = str_random(6),
        ]);

        $user->address()->create([
            "street" => request("street"),
            "address" => request("address", ""),
            "state" => request("state"),
            "country" => request("country"),
            "postal_code" => request("postal_code"),
        ]);

        foreach (request("roles") as $role) {
            $user->assign($role);
        }

        event(new UserRegistered($user, $password));

        return redirect()->route("users.index");
    }

    public function edit(User $user)
    {
        return view("users.edit", [
            "user" => $user,
            "states" => State::getCountryName("Tanzania"),
        ]);
    }

    public function update(Request $request, User $user)
    {
        $this->validate($request, [
            "first_name" => "required",
            "last_name" => "required",
            "email" => "required|email",
            "phone" => "required",
            "country" => "required",
            "gender" => ["required", Rule::in(["male","female"])],
            "birthday" => "required",
        ]);

        $user->update([
            "first_name" => request("first_name"),
            "last_name" => request("last_name"),
            "email" => request("email"),
            "phone" => request("phone"),
            "country" => request("country"),
            "gender" => request("gender"),
            "birthday" => request("birthday"),
        ]);

        if ($user->address()->exists()){
            $user->address()->update([
                "street" => request("street", optional($user->address)->street),
                "address" => request("address", optional($user->address)->address),
                "state" => request("state", optional($user->address)->state),
                "country" => request("country", optional($user->address)->country),
                "postal_code" => request("postal_code", optional($user->address)->postal_code),
            ]);
        } else {
            $user->address()->create([
                "street" => request("street"),
                "address" => request("address", ""),
                "state" => request("state"),
                "country" => request("country"),
                "postal_code" => request("postal_code"),
            ]);
        }

        return redirect()->route("users.index");
    }

    public function show(User $user)
    {
        return view("users.show",compact("user"));
    }

    /**
     * @param User $user
     * @return \Illuminate\Http\RedirectResponse
     * @throws Exception
     */
    public function destroy(User $user)
    {
        try {
            $user->addresses()->delete();
            $user->delete();
        } catch (Exception $e) {
            return redirect()->back()->with("error", $e->getMessage());
        }

        return redirect()->route("users.index");
    }
}
