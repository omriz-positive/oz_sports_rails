<template>
   <main>
    <h3 class="text-center"><a @click="goToWorkoutsPage">go back to trainer's workouts page</a></h3>
    <h1 class="text-center">New Workout</h1>
    <WorkoutForm @workoutAdded="goToNewelyAddedWorkout" :trainerId="trainerId" />
  </main>
</template> 
<script>
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
      goToNewelyAddedWorkout(newWorkout) {
        let redirect = confirm("workout added successfully, redirect to Workout page ? no will go to trainer's workout page");
        if(redirect) this.$router.push("/Trainer/" + this.trainerId + "/Workouts/" + newWorkout.id);
        else this.$router.push("/Trainer/" + this.trainerId + "/Workouts");
      }
    },
    created() {
      this.trainerId = parseInt(this.$route.params["trainerId"]);
    },
  }
</script>

<style></style>
