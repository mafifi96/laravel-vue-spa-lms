<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Http\Requests\Auth\LoginRequest;

class AuthController extends Controller
{
    public function login(LoginRequest $request)
    {
        $request->authenticate();

        if (Auth::check()) {

            session()->regenerate();

            $token = auth()->user()->createToken('Token')->plainTextToken;

            return sendData([
                'user' => Auth::user(), 'token' => $token
            ]);
        }

    }


}
