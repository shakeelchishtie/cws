<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use App\Setting;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use LicenseBoxExternalAPI;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::HOME;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        // $this->middleware('guest')->except('logout');
        $this->middleware('guest:coworker')->except('logout');
    }

    protected function credentials(Request $request)
    {
        $data = Setting::find(1);
        $api = new LicenseBoxExternalAPI();
        $res = $api->verify_license();
        if ($res['status'] != true)
        {
            $data->license_verify = 0;
            $data->save();
        }
        else
        {
            $data->license_verify = 1;
            $data->save();
        }
        return ['email'=>$request->{$this->username()},'password'=>$request->password];
    }
}
