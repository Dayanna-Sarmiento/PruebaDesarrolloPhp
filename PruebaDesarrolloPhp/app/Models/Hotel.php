<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Hotel extends Model
{
    use HasFactory;

    
    protected $table = 'hoteles';

    
    protected $fillable = [
        'nombre',
        'direccion',
        'ciudad',
        'nit',
        'num_habitaciones',
    ];

   
    public function habitaciones()
    {
        return $this->hasMany(Habitacion::class, 'hotel_id', 'id');
    }

    
    public function getFormattedNitAttribute()
    {
        return strtoupper($this->nit);
    }
}