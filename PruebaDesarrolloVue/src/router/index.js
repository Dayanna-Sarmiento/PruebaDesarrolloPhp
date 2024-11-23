import { createRouter, createWebHistory } from 'vue-router'
import HotelView from '@/views/HotelView.vue';
import HabitacionView from '@/views/HabitacionView.vue';

const routes = [
  { path: '/', name: 'hotel', component: HotelView },
  { path: '/habitacion', name: 'habitacion', component: HabitacionView },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
