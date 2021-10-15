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
      <Datepicker v-model="workout.start_hour"></Datepicker>
    </div>
    <!-- Add Trainees to workout here -->
    <section class="d-flex flex-wrap w-50 m-auto">
        <h4 class="w-100">Trainees</h4>
        <multiselect v-model="workoutTraineesVModel" :options="trainerTrainees" :multiple="true" 
            @select="addTrainee" @remove="removeTrainee" :close-on-select="true" 
            placeholder="Pick some" label="name" track-by="name" />
    </section>
    <button type="submit" class="btn btn-primary">Submit</button>
  </form>
</template>

<script>
    import axios from 'axios';
    import Datepicker from 'vue3-date-time-picker';
    import Multiselect from 'vue-multiselect'
    export default {
        name: "WorkoutForm",
        components: { Datepicker, Multiselect },
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
            workout: { name: '', duration: 0, start_hour: new Date() ,
                       workout_trainees_attributes: [] , // For Form to send back
                       workout_trainees: [] // has the PK of the Join table for M-to-M
                     },
            workoutTrainees: [],
            workoutTraineesVModel: [],
            trainerTrainees: [],
            arr: [],
          }
        },
        computed: {
            apiRoutePrefix: function() {
                return "/trainers/" + this.trainerId;
            },
        },
        methods: {
            async submit() {
                this.workout.workout_trainees_attributes = 
                    this.workout.workout_trainees_attributes.filter(t => t._destroy || this.workoutTrainees.every(wt => wt.id !== t.trainee_id));
                if(this.id === -1) {
                    this.workout.trainer_id = this.trainerId;
                    let res = await axios.post(this.apiRoutePrefix + "/workouts", this.workout);
                    this.$emit('workoutAdded',res.data);
                } else {
                    let res = await axios.put(this.apiRoutePrefix + "/workouts/" + this.id, this.workout);
                    this.$emit('workoutUpdated',res.data);
                }
            },
            addTrainee(trainee) {
                let traineeId = trainee.id;
                let input = { trainee_id : traineeId };
                let index = this.workout.workout_trainees_attributes.findIndex(t => t.trainee_id === traineeId);
                if(index !== -1){
                    this.workout.workout_trainees_attributes[index] = input;
                } else {
                    this.workout.workout_trainees_attributes.push(input);
                }
            },
            removeTrainee(trainee) {
                let traineeId = trainee.id;
                let input = this.workout.workout_trainees.find(t => t.trainee_id === traineeId);
                input = input ? 
                    { _destroy : 1, id : input.id, trainee_id : traineeId } : 
                    { _destroy : 1, trainee_id : traineeId };
                let index = this.workout.workout_trainees_attributes.findIndex(t => t.trainee_id === traineeId);
                if(index !== -1){
                    this.workout.workout_trainees_attributes[index] = input;
                } else {
                    this.workout.workout_trainees_attributes.push(input);
                }
            },
        },
        async created() {
            const apiRoutePrefix = "/trainers/" + this.trainerId;
            // Load Trainer's Trainees for adding/removing
            let trainerTraineesRes = await axios.get(apiRoutePrefix + "/trainees");
            this.trainerTrainees = trainerTraineesRes.data;
            if(this.id !== -1)  { 
                let workoutRes = await axios.get(apiRoutePrefix + "/workouts/" + this.id);
                this.workoutTrainees = workoutRes.data.trainees;
                this.workoutTraineesVModel = [...workoutRes.data.trainees];
                workoutRes.data.start_hour = new Date(workoutRes.data.start_hour);
                workoutRes.data.workout_trainees_attributes = this.workoutTrainees.map(t => { return { trainee_id : t.id }; });
                this.workout = workoutRes.data;
            }
        },
    }
</script>

<style>
</style>
