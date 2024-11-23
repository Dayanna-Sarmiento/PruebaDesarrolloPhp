<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Hotel;
use App\Models\Habitacion;

class HotelController extends Controller
{
    public function index(){
        $hoteles=Hotel::all();
        return response()->json($hoteles,200);
    }
   
    public function show($id){
        $hotel=Hotel::with('habitaciones')->find($id);

        if(!$hotel){
            return response()->json(['error'=>'No se encontro el hotel'],404);
        }
        return response()->json($hotel,200);
    }

    public function store(Request $request){
        $this->validate($request, [
            'nombrehotel' => 'required|string|max:255',
            'direccionhotel' => 'required|string|max:255',
            'ciudad' => 'required|string|max:255',
            'nit' => 'required|string|unique:hoteles',
            'numerohabitaciones' => 'required|integer|min:1',
        ]);

        $hotel = Hotel::create($request->all());
        return response()->json(['message' => 'Hotel creado exitosamente', 'data' => $hotel], 201);
    }

    public function update(Request $request, $id){
        $hotel = Hotel::find($id);

        if (!$hotel) {
            return response()->json(['error' => 'Hotel no encontrado'], 404);
        }

        $hotel->update($request->all());
        return response()->json(['message' => 'Hotel actualizado exitosamente', 'data' => $hotel], 200);
    }

    public function destroy($id){
        $hotel = Hotel::find($id);
    
        if (!$hotel) {
            return response()->json(['error' => 'Hotel no encontrado'], 404);
        }
    
        $hotel->delete();
        return response()->json(['message' => 'Hotel eliminado exitosamente'], 200);
    }

    public function listHabitaciones($id){
        $hotel = Hotel::with('habitaciones')->find($id);

        if (!$hotel) {
            return response()->json(['error' => 'Hotel no encontrado'], 404);
        }

        return response()->json($hotel->habitaciones, 200);
    }

    public function addHabitacion(Request $request, $id){
        $this->validate($request, [
            'tipo' => 'required|string|in:Estándar,Junior,Suite',
            'acomodacion' => 'required|string',
            'cantidad' => 'required|integer|min:1',
        ]);

        // Validar reglas de acomodación
        $validAcomodaciones = [
            'Estándar' => ['Sencilla', 'Doble'],
            'Junior' => ['Triple', 'Cuádruple'],
            'Suite' => ['Sencilla', 'Doble', 'Triple'],
        ];

        if (!in_array($request->acomodacion, $validAcomodaciones[$request->tipo])) {
            return response()->json(['error' => 'Acomodación inválida para el tipo seleccionado'], 400);
        }

        $hotel = Hotel::find($id);
        if (!$hotel) {
            return response()->json(['error' => 'Hotel no encontrado'], 404);
        }

        // Validar límite de habitaciones
        $totalHabitaciones = $hotel->habitaciones->sum('cantidad') + $request->cantidad;
        if ($totalHabitaciones > $hotel->num_habitaciones) {
            return response()->json(['error' => 'La cantidad supera el número máximo de habitaciones'], 400);
        }

        $habitacion = new Habitacion($request->all());
        $hotel->habitaciones()->save($habitacion);

        return response()->json(['message' => 'Habitación asignada exitosamente'], 201);
    }
    public function removeHabitacion($id, $habitacionId){
        $habitacion = Habitacion::find($habitacionId);

        if (!$habitacion) {
            return response()->json(['error' => 'Habitación no encontrada'], 404);
        }

        $habitacion->delete();
        return response()->json(['message' => 'Habitación eliminada exitosamente'], 200);
    }
}
