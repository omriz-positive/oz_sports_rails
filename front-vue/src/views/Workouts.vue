<template>
  <main class="d-block w-100">
    <h4 class="text-center m-5"><a @click="goToTrainerPage">Go back to trainer panel</a></h4>
    <h1 class="text-center">Workouts page</h1>
    <section class="w-75 m-auto">
      <table v-if="workouts && workouts.length > 0" class="table table-bordered">
        <thead>
          <tr>
            <th> Id </th>
            <th> Name </th>
            <th> Start Hour </th>
            <th> Duration </th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="w in workouts" :key="w.id">
            <td> {{ w.id }} </td>
            <td> {{ w.name }} </td>
            <td> {{ w.start_hour }} </td>
            <td> {{ w.duration ? (w.duration + " Hour/s ") : "N/A" }} </td>
            <td> <button class="btn btn-primary"> Select Workout to Edit </button> </td>
        </tr>
      </tbody>
      </table>
      <div v-else>
        <h4>You have no workouts, would you like to add?</h4>
        <p>If so, click <a>here</a> </p>
      </div>
    </section>
    <hr/>
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
      async loadTrainees() {
        let res = await axios.get("/trainers/" + this.trainerId + "/workouts");
        this.workouts = res.data;
      },
    },
    async created() { 
      this.trainerId = parseInt(this.$route.params["id"]);
      await this.loadTrainees();
    },
  }
</script>

<style>h1 {color:red}</style>
