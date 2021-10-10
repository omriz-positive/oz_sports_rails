<template>
  <main class="d-block w-100">
  <header class="d-block w-100">
    <h2 class="text-center">Choose a Trainer account</h2>
  </header>
  <section class="d-block m-auto w-75">
    <table class="table">
      <thead>
        <tr>
          <th> Id </th>
          <th> Name </th>
          <th> Edit </th>
          <th> Select </th>
          <th> delete </th>
        </tr>
      </thead>
      <tbody>
        <!-- Add Foreach here -->
        <tr v-for="t in trainers" :key="t.id">
          <td> {{ t.id }} </td>
          <td> {{ t.name }} </td>
          <td> <button class="btn btn-info"> Edit "{{ t.name }}" </button> </td>
          <td> <button v-on:click="selectTrainer(t.id)" class="btn btn-primary"> Select "{{ t.name }}" </button> </td>
          <td> <button v-on:click="deleteTrainer(t.id)" class="btn btn-danger"> Remove "{{ t.name }}" </button> </td> 
        </tr>
      </tbody>
    </table>
  </section>
  <br>
</main>
</template>
<script>
import axios from 'axios';

  export default {
    name: 'Trainers',
    data: function () {
      return {
        TRAINER_ID_KEY: "trainer_id",
        trainers: [],
      }
    },
    methods: {
      redirectToTrainerPage(trainerId) {
        console.log("trainerId ::: ", trainerId);
      },
      async loadTrainers() {
        let trainersRes = await axios.get("/trainers");
        this.trainers = trainersRes.data;
      },
      selectTrainer(trainerId) {
        const yes = confirm("Are you sure?");
        if (yes) {
          window.localStorage.setItem(this.TRAINER_ID_KEY, trainerId);
          this.redirectToTrainerPage(trainerId);
        }
      },
      async deleteTrainer(trainerId) {
        const yes = confirm("Are you sure you want to delete a trainer?");
        if (yes) {
          let res = await axios.delete("/trainers/ " + trainerId + ".json");
          if(res.status == "200") {
            await this.loadTrainers();
            setTimeout(() => { alert("Deleted trainer successfully"); },0) 
          } else {
            console.info("Notice Res ::: ", res);
            alert("Could not delete trainer, plz check console");
          }
        }
      }
    },
    async created() { 
      let trainerId = window.localStorage.getItem(this.TRAINER_ID_KEY);
      if (trainerId !== null) { // Redirect to Trainer page
        this.redirectToTrainerPage(trainerId)
      } else {
        await this.loadTrainers();
      }
    },
  }
</script>

<style></style>
