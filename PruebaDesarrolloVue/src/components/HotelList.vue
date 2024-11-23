<template>
    <div class="container mt-4">
      <h3>Hoteles Registrados</h3>
      <table class="table table-striped">
        <thead>
          <tr>
            <th>Nombre</th>
            <th>Dirección</th>
            <th>Ciudad</th>
            <th>NIT</th>
            <th>Habitaciones</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="hotel in hoteles" :key="hotel.id">
            <td>{{ hotel.nombre }}</td>
            <td>{{ hotel.direccion }}</td>
            <td>{{ hotel.ciudad }}</td>
            <td>{{ hotel.nit }}</td>
            <td>{{ hotel.numero_habitaciones }}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </template>
  
  <script>
  import axios from 'axios';
  
  export default {
    data() {
      return {
        hoteles: [],
      };
    },
    async created() {
      await this.fetchHoteles();
    },
    methods: {
      async fetchHoteles() {
        try {
          const response = await axios.get('http://localhost:8000/api/hotel');
          this.hoteles = response.data;
        } catch (error) {
          console.error(error);
          alert('Error al cargar los hoteles.');
        }
      },
    },
  };
  </script>
  