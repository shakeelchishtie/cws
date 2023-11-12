<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Notification extends Model
{
    protected $table = 'notification';

    protected $fillable = ['user_id','user_type','order_id','title','message'];

    protected $appends = ['user','order'];

    public function getUserAttribute()
    {
        // return User::find($this->user_id);
        if(User::where('id',$this->user_id)->first())
            return User::where('id',$this->user_id)->first(['name','image']);
        return (object)[];
    }

    public function getOrderAttribute()
    {
        // return Appointment::find($this->order_id)->date;
        if(Appointment::where('id',$this->order_id)->first())
            return Appointment::where('id',$this->order_id)->first(['date','start_time'])->makeHidden(['service']);
        return (object)[];
    }
}
