<template>
    <form @submit="submit" class="d-block container">
    <h3>WorkoutForms</h3>
    <div class="form-group mt-5 mb-4 w-50">
      <label>Name:</label>
      <input v-model="workout.name" type="text" class="form-control">
    </div>
    <div class="form-group mt-5 mb-4 w-50">
      <label>Duration in hours:</label>
      <input v-model="workout.duration" type="number" min="0" class="form-control">
    </div>
    <div class="form-group mt-5 mb-4 w-50">
      <label>Start Hour:</label>
      <input v-model="workout.start_hour" type="datetime" class="form-control">
    </div>
    <!-- Add Trainees to workout here -->
    <section class="d-flex flex-wrap w-50 m-auto">
        <h4 class="w-100">Trainees</h4>
        <ul class="list-group w-100">
            <li v-for="t in trainerTrainees" :key="t.id" class="list-group-item text-center d-flex flex-wrap justify-content-around">
                <div class="w-25">{{t.name}} </div>
                <div v-if="isTraineeInserted(t.id)" class="w-25">
                    <button class="btn btn-danger" type="button" @click="removeTrainee(t.id)">Remove</button>
                </div>
                <div v-else class="w-25">
                    <button class="btn btn-primary" type="button" @click="addTrainee(t.id)">Add</button>
                </div>
            </li>
        </ul>
    </section>
    <button type="submit" class="btn btn-primary">Submit</button>
  </form>
</template>

<script>
    import axios from 'axios';
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
        data: function () {
          return {
            workout: { name: '', duration: 0, start_hour: new Date() , trainees: [] },
            trainerTrainees: [],
          }
        },
        computed: {
            apiRoutePrefix: function() {
                return "/trainers/" + this.trainerId;
            },
        },
        methods: {
            async submit() {
                this.workout.trainee_arr = this.workout.trainees.map(t => t.id);
                if(this.id === -1) {
                    let res = await axios.post(this.apiRoutePrefix + "/workouts", this.workout);
                    this.$emit('workoutAdded',res.data);
                } else {
                    let res = await axios.put(this.apiRoutePrefix + "/workouts/" + this.id, this.workout);
                    this.$emit('workoutUpdated',res.data);
                }
            },
            addTrainee(traineeId) {
                let trainee = this.trainerTrainees.find(t => t.id === traineeId);
                this.workout.trainees.push(trainee);
            },
            isTraineeInserted(traineeId) {
                return this.workout.trainees.some(t => t.id === traineeId)
            },
            removeTrainee(traineeId) {
                this.workout.trainees = this.workout.trainees.filter(t => t.id !== traineeId);
            },
        },
        async created() {
            const apiRoutePrefix = "/trainers/" + this.trainerId;
            // Load Trainer's Trainees for adding/removing
            let trainerTraineesRes = await axios.get(apiRoutePrefix + "/trainees");
            this.trainerTrainees = trainerTraineesRes.data;
            if(this.id !== -1)  { // Load Relevent 
                let workoutRes = await axios.get(apiRoutePrefix + "/workouts/" + this.id);
                let workoutTraineesRes = await axios.get(apiRoutePrefix + "/workouts/" + this.id + "/trainees");
                this.workout = workoutRes.data;
                this.workout.start_hour = new Date(workoutRes.data.start_hour);
                this.workout.trainees = workoutTraineesRes.data;
            }
        },
    }
</script>

<style>
</style>
