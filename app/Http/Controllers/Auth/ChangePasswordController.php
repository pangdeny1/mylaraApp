<?php

namespace App\Http\Controllers\Auth;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use App\Auth;

class ChangePasswordController extends Controller
{
     public function __construct()
    {
        $this->middleware("auth");
    } 
    public function index()
    {
    	$id = \Auth::user()->id;
       $user = User::find($id);
    	 return view("auth/passwords.changepassword",compact('user'));
    }

    public function update(Request $request, User $user)
    {
        $this->validate($request, [
            "old_password" => "required",
            "new_password" => "required",
            "confirm_password" => "required|same:new_password",
            
        ]);

 
        $user->update([
            "password" => request("new_password"),
            
        ]);

       

       return redirect()->back()->with('status', 'password changed Successfully!');;
    }



}
