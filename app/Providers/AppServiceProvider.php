<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Event;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        // Event::listen('eloquent.saving: *', function ($model)
        // {
        //     return false;
        // });
        // Event::listen('eloquent.deleting: *', function ($model)
        // {
        //     return false;
        // });
    }
}
