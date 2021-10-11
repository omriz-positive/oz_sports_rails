import { createRouter, createWebHashHistory } from 'vue-router'
import Home from '../views/Home.vue'
import Trainers from '../views/Trainers.vue'
import Trainer from '../views/Trainer.vue'

const routes = [
  {
    path: '/',
    name: 'Root',
    component: Trainers
  },
  {
    path: '/Home',
    name: 'Home',
    component: Home
  },
  {
    path: '/Trainers',
    name: 'Trainers',
    component: Trainers
  },
  {
    path: '/Trainer/:id',
    name: 'Trainer',
    component: Trainer
  },
  {
    path: '/about',
    name: 'About',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  }
]

const router = createRouter({
  history: createWebHashHistory(),
  routes
})

export default router
