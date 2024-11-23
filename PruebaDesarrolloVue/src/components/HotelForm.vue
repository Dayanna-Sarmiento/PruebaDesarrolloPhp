<template>
  <div class="container mt-4">
    <h3>Registrar Hotel</h3>
    <form @submit.prevent="submitHotel">
      <div class="mb-3">
        <label class="form-label">Nombre</label>
        <input type="text" v-model="hotel.nombre" class="form-control" required />
      </div>
      <div class="mb-3">
        <label class="form-label">Dirección</label>
        <input type="text" v-model="hotel.direccion" class="form-control" required />
      </div>
      <div class="mb-3">
        <label class="form-label">Ciudad</label>
        <input type="text" v-model="hotel.ciudad" class="form-control" required />
      </div>
      <div class="mb-3">
        <label class="form-label">NIT</label>
        <input type="text" v-model="hotel.nit" class="form-control" required />
      </div>
      <div class="mb-3">
        <label class="form-label">Número de Habitaciones</label>
        <input type="number" v-model="hotel.numero_habitaciones" class="form-control" required />
      </div>
      <button type="submit" class="btn btn-primary">Guardar</button>
    </form>
  </div>
</template>

<script>
import axios from 'axios';
baseURL: import.meta.env.VITE_API_BASE_URL || 'http://localhost:8000/api'

export default {
  data() {
    return {
      hotel: {
        nombre: '',
        direccion: '',
        ciudad: '',
        nit: '',
        numero_habitaciones: '',
      },
    };
  },
  methods: {
    async submitHotel() {
      try {
        await axios.post('http://localhost:8000/api/hotel', this.hotel);
        alert('Hotel registrado con éxito.');
        this.$emit('hotel-registered');
      } catch (error) {
        console.error(error);
        alert('Error al registrar el hotel.');
      }
    },
  },
};
</script>
