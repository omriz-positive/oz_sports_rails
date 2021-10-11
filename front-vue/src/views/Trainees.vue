<template>
  <main class="d-block w-100">
    <h1 class="text-center">Trainees page</h1>
    <section class="w-75 m-auto">
      <table class="table table-bordered">
      <thead>
        <tr>
          <th> Id </th>
          <th> Name </th>
          <th> Last workout </th>
          <th> Edit </th>
          <th> Delete </th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="t in trainees" :key="t.id">
          <td> {{ t.id }} </td>
          <td> {{ t.name }} </td>
          <td> {{ t.last_workout?.start_hour || "N/A" }} </td>
          <td>
            <button @click="editTrainee(t.id)" class="btn btn-secondary">Edit {{ t.name }} </button>
          </td>
          <td>
            <button @click="removeTrainee(t.id)" class="btn btn-danger">Remove {{ t.name }} </button>
          </td>
        </tr>
      </tbody>
    </table>
    </section>
  </main>
</template> 
<script>
  import axios from 'axios';
  export default {
    name: 'Trainees',
    data: function () {
      return {
        TRAINER_ID_KEY: "trainer_id",
        trainerId: 0,
        trainees: [],
      }
    },
    methods: { 
      async loadTrainees() {
        let res = await axios.get("/trainers/" + this.trainerId + "/trainees");
        this.trainees = res.data;
      },
      async editTrainee(id) {
        let newName = prompt("Change the name of the trainee","");
        if(!newName) return;
        let res = await axios.put("/trainers/" + this.trainerId + "/trainees/" + id,{ name: newName });
        if (parseInt(res.status / 100) === 2) alert("changed name successfully");
        this.loadTrainees();
      },
      async removeTrainee(id) { 
        let sure = confirm("Are you sure?");
        if(!sure) return;
        let res = await axios.delete("/trainers/" + this.trainerId + "/trainees/" + id);
        if (parseInt(res.status / 100) === 2) alert("Deleted successfully");
        this.loadTrainees();
      },
    },
    async created() { 
      this.trainerId = this.$route.params["id"];
      await this.loadTrainees();
    },
  }
</script>

<style>
</style>
