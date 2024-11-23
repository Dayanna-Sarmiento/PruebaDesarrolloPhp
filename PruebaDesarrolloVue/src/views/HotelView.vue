<template>
    <div class="container mt-4">
      <h2>Gestión de Hoteles</h2>
      <hr />
      <HotelForm @hotel-registered="fetchHoteles" />
  
      <hr />
  
      <HotelList :hoteles="hoteles" />
    </div>
  </template>
  
  <script>
  import HotelForm from '@/components/HotelForm.vue';
  import HotelList from '@/components/HotelList.vue';
  import axios from 'axios';
  
  export default {
    components: {
      HotelForm,
      HotelList,
    },
    data() {
      return {
        hoteles: [], // Lista de hoteles registrados
      };
    },
    async created() {
      // Cargar los hoteles al montar la vista
      await this.fetchHoteles();
    },
    methods: {
      async fetchHoteles() {
        try {
          const response = await axios.get('http://localhost:8000/api/hotel');
          this.hoteles = response.data; 
        } catch (error) {
          console.error('Error al cargar los hoteles:', error);
          alert('Hubo un problema al cargar la lista de hoteles.');
        }
      },
    },
  };
  </script>
  
  <style scoped>
  /* Estilo opcional */
  .container {
    padding-top: 20px;
  }
  </style>
  