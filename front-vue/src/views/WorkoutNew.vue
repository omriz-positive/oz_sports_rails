<template>
   <main>
    <h3 class="text-center"><a @click="goToWorkoutsPage">go back to trainer's workouts page</a></h3>
    <h1 class="text-center">New Workout</h1>
    <WorkoutForm :trainerId="trainerId" />
  </main>
</template> 
<script>
  // import axios from 'axios';
  import WorkoutForm from '@/components/WorkoutForm.vue'
  export default {
    name: 'WorkoutNew',
    components: {
      WorkoutForm
    },
    data: function () {
      return {
        trainerId: 0,
      }
    },
    methods: { 
      goToWorkoutsPage() { 
        this.$router.push("/Trainer/" + this.trainerId + "/Workouts");
      },
    },
    created() {
      this.trainerId = parseInt(this.$route.params["trainerId"]);
      console.log("trainerId ::: ",this.trainerId);
    },
  }
</script>

<style></style>
