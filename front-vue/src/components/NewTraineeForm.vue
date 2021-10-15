<template>
  <form @submit="submitNewTrainee" class="d-block container">
    <h3>New Trainee Form</h3>
    <div class="form-group mt-5 mb-4 w-50">
      <label>Name:</label>
      <input v-model="name" type="text" class="form-control">
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
  </form>
</template>

<script>
  import axios from 'axios';
  export default {
    name: 'NewTrainerForm',
    data: function () {
      return {
        name: null,
      }
    },
    props: {
      trainerId: Number
    },
    methods: {
      async submitNewTrainee() {
        if(!this.name){
          alert("Please set the name of the trainee ");
          return;
        }
        try {
          let res = await axios.post("/trainers/" + this.trainerId + "/trainees", { name : this.name, trainer_id : this.trainerId });
          console.log("response :: ",  res);
          if(parseInt(res.status / 100) === 2) {
            alert("trainer added successfully, press enter");
            this.$emit('traineeAdded');
          }
        } catch (err) {
          alert("An error occurred, please check console");
        }
      }
    }  
  }
</script>

<style scoped>

</style>