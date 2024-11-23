<?php

use Illuminate\Support\Facades\Route;
use App\http\Controllers\HotelController;
use App\http\Controllers\HabitacionController;

Route::prefix('hoteles')->group(function(){
    //Llamado a ruta de hoteles
    Route::get('/', [HotelController::class,'index']);//lista
    Route::get('{id}', [HotelController::class,'show']);//muestra detalles
    Route::post('/', [HotelController::class,'store']);//crea
    Route::put('{id}', [HotelController::class,'update']);//actualiza
    Route::delete('{id}', [HotelController::class,'destroy']);//elimina
    //LLamado para habitaciones de hotel
    Route::prefix('{id}/habitaciones')->group(function(){
        Route::get('/',[HotelController::class,'listHabitaciones']);//listar
        Route::post('/',[HotelController::class,'addHabitacion']);//asignar
        Route::delete('{habitacionId}',[HotelController::class,'removeHabitacion']);//eliminar
    });
});
