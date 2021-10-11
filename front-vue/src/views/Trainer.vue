<template>
  <main class="d-block w-100">
    <h1 class="text-center">Trainer View Works</h1>
    <section class="d-flex flex-wrap w-100 p-4 mt-2 justify-content-around">
      <ul class="w-100 list-group mt-2 mb-5">
        <li class="list-group-item">Id :: {{ trainer.id }}</li>
        <li class="list-group-item">Name :: {{ trainer.name }}</li>
        <li class="list-group-item">Created :: {{ trainer.created_at }}</li>
        <li class="list-group-item">Last Updated :: {{ trainer.updated_at }}</li>
      </ul>
      <button @click="changeName" class="btn btn-warning">Change Name?</button>
    </section>
    <section class="d-flex flex-wrap w-100 p-4 mt-2 justify-content-around">
        <button class="btn w-25 btn-primary" @click="goToWorkouts">Check workouts</button>
        <button class="btn w-25 btn-secondary" @click="goToTrainees">Check Trainees</button>
    </section>
  </main>
</template>

<script>
import axios from 'axios';
export default {
  name: 'Trainer',
  data: function () {
    return {
      TRAINER_ID_KEY: "trainer_id",
      trainer: {},
    }
  },
  methods:{
    async loadTrainer(id) {
      try {
        const trainerBaseUrl = "/trainers/" + id;
        let res = await axios.get(trainerBaseUrl);
        this.trainer = res.data;
      } catch (err) {
        alert("An error occured, please check the console");
        console.error("Trainer::created::error::: ",err);
        console.info("Response ",err.response);
      }
    },
    async changeName() {
      let newName = window.prompt("sometext","");
      if(!newName) {
        return;
      }
      const trainerBaseUrl = "/trainers/" + this.trainer.id;
      let res = await axios.put(trainerBaseUrl,{ name: newName });
      this.trainer = res.data;
    },
    goToWorkouts() { alert("go to workouts"); },
    goToTrainees() { alert("go to trainees"); },
  },
  async created() {
    let id = localStorage.getItem(this.TRAINER_ID_KEY)
    if(!id) {
      this.$router.push('/Trainers');
      return;
    }
    this.loadTrainer(id);
  }
}
</script>

<style scoped>

</style>