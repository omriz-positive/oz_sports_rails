<template>
  <form @submit="submitNewTrainer" class="d-block container">
    <h3>New Trainer Forms Work</h3>
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
    methods: {
      async submitNewTrainer() {
        if (!this.name) {
          alert("Please enter a name!");
          return;
        }
        try {
          let res = await axios.post("/trainers",{ name : this.name });
          console.log("response :: ",  res);
          if(parseInt(res.status / 100) === 2) {
            alert("trainer added successfully, press enter");
            this.$emit('trainerAdded');
          }
        } catch (err) {
          alert("An error occurred, plea check console");
          console.error("submitNewTrainer ::: ", err);
        }
      },
    }
  }
</script>

<style scoped>

</style>