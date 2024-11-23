<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Hotel;
use App\Models\Habitacion;

class HabitacionController extends Controller
{
    public function store(Request $request)
    {
        $validated = $request->validate([
            'hotel_id' => 'required|exists:hoteles,id',
            'tipo_habitacion_id' => 'required|exists:tipos_habitaciones,id',
            'acomodacion_id' => 'required|exists:acomodaciones,id',
            'cantidad' => 'required|integer|min:1',
        ]);

        $hotel = Hotel::find($validated['hotel_id']);
        $totalHabitaciones = $hotel->habitaciones->sum('cantidad') + $validated['cantidad'];

        if ($totalHabitaciones > $hotel->numero_habitaciones) {
            return response()->json(['error' => 'El total de habitaciones excede el máximo permitido.'], 400);
        }

        $tipoHabitacion = TipoHabitacion::find($validated['tipo_habitacion_id']);
        $acomodacion = Acomodacion::find($validated['acomodacion_id']);

        $validas = [
            'Estandar' => ['Sencilla', 'Doble'],
            'Junior' => ['Triple', 'Cuádruple'],
            'Suite' => ['Sencilla', 'Doble', 'Triple'],
        ];

        if (!in_array($acomodacion->nombre, $validas[$tipoHabitacion->nombre])) {
            return response()->json(['error' => 'Acomodación no válida para este tipo de habitación.'], 400);
        }

        Habitacion::create($validated);
        return response()->json(['message' => 'Habitación asignada exitosamente.'], 201);
    }
}
