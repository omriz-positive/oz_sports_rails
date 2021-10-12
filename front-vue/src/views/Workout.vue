<template>
  <main>
    <h3 class="text-center"><a @click="goToWorkoutsPage">go back to trainer's workouts page</a></h3>
    <h1 class="text-center">Workout (Edit) Page</h1>
  </main>
</template> 
<script>
  // import axios from 'axios';
  export default {
    name: 'Workout',
    data: function () {
      return {
        TRAINER_ID_KEY: "trainer_id",
        id: 0,
        trainerId: 0,
        workout: null,
        workoutTrainees: [],
      }
    },
    methods: { 
      goToWorkoutsPage() { 
        this.$router.push("/Trainer/" + this.trainerId + "/Workouts");
      },
    },
    async created() {
      this.trainerId = parseInt(this.$route.params["trainerId"]);
      this.id = parseInt(this.$route.params["id"]);
      console.log("trainerId ::: ",this.trainerId);
      console.log("WorkoutId ::: ",this.id);
    },
  }
</script>

<style></style>
