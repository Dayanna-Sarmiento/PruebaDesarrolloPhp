<template>
    <div class="container mt-4">
      <h3>Habitaciones Asignadas</h3>
      <div v-if="rooms.length">
        <table class="table table-bordered table-striped">
          <thead class="table-dark">
            <tr>
              <th>#</th>
              <th>Tipo de Habitación</th>
              <th>Acomodación</th>
              <th>Cantidad</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(habitacion, index) in habitaciones" :key="habitacion.id">
              <td>{{ index + 1 }}</td>
              <td>{{ habitacion.tipo_habitacion }}</td>
              <td>{{ habitacion.acomodacion }}</td>
              <td>{{ habitacion.cantidad }}</td>
            </tr>
          </tbody>
        </table>
      </div>
      <!-- Mensaje si no hay habitaciones -->
      <div v-else class="alert alert-warning">
        No se han asignado habitaciones a este hotel.
      </div>
    </div>
  </template>
  
  <script>
  export default {
    props: {
      habitaciones: {
        type: Array,
        required: true,
        default: () => [],
      },
    },
  };
  </script>
  
  <style scoped>
  .container {
    margin-top: 20px;
  }
  </style>
  