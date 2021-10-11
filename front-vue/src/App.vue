<template>
  <nav id="nav" class="w-75 d-block m-auto">
    <button v-on:click="logoutOfTrainer()" id="logout" class="btn btn-danger">Logout</button>
  </nav>
  <router-view/>
</template>
<script>
  export default {
    name: 'Trainers',
    data: function () {
      return {
        TRAINER_ID_KEY: "trainer_id"
      }
    },
    methods: {
      logoutOfTrainer(trainerId) {
        let logout = confirm("Are sure you wanna signout ?");
        if (!logout) return;
        window.localStorage.removeItem(this.TRAINER_ID_KEY);
        this.$router.push('/');
      }
    },
  }
</script>

<style>

#nav {

}
</style>
