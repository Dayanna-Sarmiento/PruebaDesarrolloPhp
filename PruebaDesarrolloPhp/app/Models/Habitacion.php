<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Habitacion extends Model
{
    use HasFactory;

    
    protected $table = 'habitacionAcomodacion';

    
    protected $fillable = [
        'habitaciontipoid',
        'habitaciontipoid',
    ];

   
    public function habitaciones()
    {
        return $this->hasMany(Habitacion::class, 'hotel_id', 'id');
    }

}
