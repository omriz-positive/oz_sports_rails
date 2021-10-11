<template>
  <main class="d-block w-100">
    <h4 class="text-center m-5"><a @click="goToTrainerPage">Go back to trainer panel</a></h4>
    <h1 class="text-center">Workouts page</h1>
    <!-- Workout Table -->
    <section class="w-75 m-auto">
      <table v-if="workouts && workouts.length > 0" class="table table-bordered">
        <thead>
          <tr>
            <th> Id </th>
            <th> Name </th>
            <th> Start Hour </th>
            <th> Duration </th>
            <th class="text-center"> Options </th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="w in workouts" :key="w.id">
            <td> {{ w.id }} </td>
            <td> {{ w.name }} </td>
            <td> {{ w.start_hour }} </td>
            <td> {{ w.duration ? (w.duration + " Hour/s ") : "N/A" }} </td>
            <td>
              <div class="d-flex flex-wrap justify-content-around">
                <button @click="displayDetails(w.id)" class="btn btn-primary"> Display </button> 
                <button @click="editWorkout(w.id)" class="btn btn-secondary"> Select Workout to Edit </button> 
                <button @click="removeWorkout(w.id)" class="btn btn-danger"> Remove workout </button> 
              </div>
            </td>
        </tr>
      </tbody>
      </table>
      <div v-else>
        <h4>You have no workouts, would you like to add?</h4>
        <p>If so, click <a>here</a> </p>
      </div>
    </section>
    <hr/>
    <!-- Display Selected Workout's -->
    <section>
    </section>
  </main>
</template> 
<script>
  import axios from 'axios';
  export default {
    name: 'Workouts',
    data: function () {
      return {
        TRAINER_ID_KEY: "trainer_id",
        trainerId: 0,
        workouts: [],
      }
    },
    methods: { 
      goToTrainerPage() { 
        this.$router.push("/Trainer/" + this.trainerId);
      },
      async loadWorkouts() {
        let res = await axios.get("/trainers/" + this.trainerId + "/workouts");
        this.workouts = res.data;
      },
      async removeWorkout(id) {
        let sure = confirm("Are you sure?");
        if(!sure) return;
        let res = await axios.delete("/trainers/" + this.trainerId + "/workouts/" + id);
        if (parseInt(res.status / 100) === 2) alert("Deleted successfully");
        this.loadWorkouts();
      },
    },
    async created() { 
      this.trainerId = parseInt(this.$route.params["id"]);
      await this.loadWorkouts();
    },
  }
</script>

<style>h1 {color:red}</style>
