<template>
  <form @submit="submitNewTrainer" class="d-block container">
    <h3>New Trainer Form</h3>
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
          console.log("work ?", res);
          console.log("work ?", res.validateStatus);
          alert("trainer added successfully, press enter");
          this.$emit('trainerAdded');
        } catch (err) {
          console.error("Axious ::: ", err);
          alert("An error occurred, plea check console");
        }
      },
    }
  }
</script>

<style scoped>

</style>