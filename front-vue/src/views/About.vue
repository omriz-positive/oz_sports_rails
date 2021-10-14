<template>
  <div class="about">
    <h1>This is an about page</h1>
    <div class="w-100 d-block">
      <div class="w-25">
        <Datepicker type="time" v-model="date"></Datepicker>
      </div>
    </div>
  </div>
</template>
<script>
  import Datepicker from 'vue3-date-time-picker';
  export default {
    name: 'About',
    components: { Datepicker },
    data: function () {
      return {
         date: null,
      }
    },
    methods: { 
    },
    created() {
    },
  }
</script>
<style></style>