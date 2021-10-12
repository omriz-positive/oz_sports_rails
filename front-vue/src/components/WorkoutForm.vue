<template>
    <form @submit="submitNewTrainer" class="d-block container">
    <h3>WorkoutForms</h3>
    <!-- 
    <div class="form-group mt-5 mb-4 w-50">
      <label>Name:</label>
      <input v-model="name" type="text" class="form-control">
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
    -->
  </form>
</template>

<script>
    export default {
        props: {
            trainerId: {
                type: Number,
                required: true
            },
            id: {
                type: Number,
                required: false,
                default: -1,
            },
        },
        created() {
            alert("Weclome my friend!");
            alert("trainer id ::: " + this.trainerId + " || workout id ::: " + this.id);
        },
    }
</script>

<style>
</style>
