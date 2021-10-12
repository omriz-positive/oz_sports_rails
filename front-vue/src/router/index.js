import { createRouter, createWebHashHistory } from 'vue-router'
import Trainers from '../views/Trainers.vue'
import Trainer from '../views/Trainer.vue'
import Trainees from '../views/Trainees.vue'
import Workouts from '../views/Workouts.vue'
import Workout from '../views/Workout.vue'
import WorkoutNew from '../views/WorkoutNew.vue'

const routes = [
  {
    path: '/',
    name: 'Root',
    component: Trainers
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
    path: '/Trainer/:id/Trainees',
    name: 'TrainerTainees',
    component: Trainees
  },
  {
    path: '/Trainer/:id/Workouts',
    name: 'TrainerWorkouts',
    component: Workouts
  },
  {
    path: '/Trainer/:trainerId/Workouts/:id',
    name: 'TrainerWorkoutPage',
    component: Workout
  },
  {
    path: '/Trainer/:trainerId/Workouts/New',
    name: 'TrainerWorkoutNew',
    component: WorkoutNew
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
