<template>
  <section class="d-block w-100">
    <h1>Trainer View Works</h1>
  </section>
</template>

<script>
export default {
  name: 'Trainer',
  data: function () {
    return {
      TRAINER_ID_KEY: "trainer_id",
    }
  },
  props: {
    msg : String 
  },
  created() {
    if(!localStorage.getItem(this.TRAINER_ID_KEY)) {
      this.$router.push('/Trainers');
      return;
    }
  }
}
</script>

<style scoped>

</style>