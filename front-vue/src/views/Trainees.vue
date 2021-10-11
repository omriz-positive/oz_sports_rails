<template>
  <main class="d-block w-100">
    <h4 class="text-center m-5"><a @click="goToTrainerPage">Go back to trainer panel</a></h4>
    <h1 class="text-center">Trainees page</h1>
    <section class="w-75 m-auto">
      <table v-if="trainees && trainees.length > 0" class="table table-bordered">
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
      <div v-else>
        <h4>You have no trainees, would you like to add?</h4>
        <p>If so, fill the form below</p>
      </div>
    </section>
    <hr/>
    <section>
      <TraineeForm :trainerId="trainerId" @traineeAdded="loadTrainees" />
    </section>
  </main>
</template> 
<script>
  import axios from 'axios';
  import TraineeForm from '@/components/NewTraineeForm.vue'
  export default {
    name: 'Trainees',
    components: {
      TraineeForm
    },
    data: function () {
      return {
        TRAINER_ID_KEY: "trainer_id",
        trainerId: 0,
        trainees: [],
      }
    },
    methods: { 
      goToTrainerPage() { 
        this.$router.push("/Trainer/" + this.trainerId);
      },
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
      this.trainerId = parseInt(this.$route.params["id"]);
      await this.loadTrainees();
    },
  }
</script>

<style>
</style>
