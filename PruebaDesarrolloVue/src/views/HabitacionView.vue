<template>
    <div class="container mt-4">
      <h3>Gestión de Habitaciones</h3>
      <HabitacionForm @Habitacion-added="fetchHabitacion" :hotel-id="hotelId" />
      <HabitacionList :habitacion="habitacion" />
    </div>
  </template>
  
  <script>
  import HabitacionForm from '@/components/HabitacionForm.vue';
  import HabitacionList from '@/components/HabitacionList.vue';
  import axios from 'axios';
  
  export default {
    components: { HabitacionForm, HabitacionList },
    data() {
      return {
        hotelId: '', 
        habitacion: [],
      };
    },
    methods: {
      async fetchHabitacion() {
        try {
          const response = await axios.get(`http://localhost:8000/api/habitaciones/${this.hotelId}`);
          this.habitacion = response.data;
        } catch (error) {
          console.error(error);
          alert('Error al cargar las habitaciones.');
        }
      },
    },
    watch: {
      hotelId: 'fetchHabitacion',
    },
  };
  </script>
  