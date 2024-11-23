<template>
    <div class="container mt-4">
      <h3>Asignar Habitaciones</h3>
      <form @submit.prevent="submitHabitacion">
        <div class="mb-3">
          <label class="form-label">Tipo de Habitación</label>
          <select v-model="habitacion.tipo_habitacion" class="form-select" required>
            <option value="" disabled>Seleccione un tipo</option>
            <option value="Estándar">Estándar</option>
            <option value="Junior">Junior</option>
            <option value="Suite">Suite</option>
          </select>
        </div>
  
        <div class="mb-3">
          <label class="form-label">Acomodación</label>
          <select v-model="habitacion.acomodacion" class="form-select" required>
            <option value="" disabled>Seleccione una acomodación</option>
            <option v-for="acomodacion in acomodaciones" :key="acomodacion" :value="acomodacion">
              {{ acomodacion }}
            </option>
          </select>
        </div>
  
        <div class="mb-3">
          <label class="form-label">Cantidad</label>
          <input type="number" v-model="room.cantidad" class="form-control" min="1" required />
        </div>
  
        <button type="submit" class="btn btn-primary">Asignar Habitación</button>
      </form>
    </div>
  </template>
  
  <script>
  import axios from 'axios';
  
  export default {
    props: {
      hotelId: {
        type: Number,
        required: true,
      },
    },
    data() {
      return {
        habitacion: {
          tipo_habitacion: '',
          acomodacion: '',
          cantidad: '',
        },
        acomodaciones: [],
      };
    },
    watch: {
      'habitacion.tipo_habitacion': function (newTipo) {
        this.updateAcomodaciones(newTipo);
      },
    },
    methods: {
      updateAcomodaciones(tipo) {
        const opciones = {
          Estándar: ['Sencilla', 'Doble'],
          Junior: ['Triple', 'Cuádruple'],
          Suite: ['Sencilla', 'Doble', 'Triple'],
        };
        this.acomodaciones = opciones[tipo] || [];
        if (!this.acomodaciones.includes(this.habitacion.acomodacion)) {
          this.habitacion.acomodacion = '';
        }
      },
      async submitRoom() {
        try {
          const response = await axios.post(`http://localhost:8000/api/hotel/${this.hotelId}/habitacion`, this.habitacion);
          alert('Habitación asignada con éxito.');
          this.$emit('room-added'); 
          this.resetForm();
        } catch (error) {
          console.error('Error al asignar la habitación:', error);
          alert('Hubo un problema al asignar la habitación.');
        }
      },
      resetForm() {
        this.habitacion = {
          tipo_habitacion: '',
          acomodacion: '',
          cantidad: '',
        };
        this.acomodaciones = [];
      },
    },
  };
  </script>
  
  <style scoped>
  .container {
    margin-top: 20px;
  }
  </style>
  