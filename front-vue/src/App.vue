<template>
  <nav id="nav" class="w-75 d-block m-auto">
    <button v-if="trainerIdSet" v-on:click="logoutOfTrainer()" id="logout" class="btn btn-danger">Logout</button>
  </nav>
  <router-view/>
</template>
<script>
  export default {
    name: 'Trainers',
    data: function () {
      return {
        TRAINER_ID_KEY: "trainer_id",
        get trainerId() {
          return localStorage.getItem(this.TRAINER_ID_KEY) || null;
        },
        set trainerId(value) {
          if(value === null) window.localStorage.removeItem(this.TRAINER_ID_KEY);
          else localStorage.setItem(this.TRAINER_ID_KEY, value);
        }        
      }
    },
    computed: {
      trainerIdSet: function () {
        return this.trainerId ? true : false;
      }
    },
    methods: {
      logoutOfTrainer() {
        let logout = confirm("Are sure you wanna signout ?");
        if (!logout) return;
        this.trainerId = null;
        this.$router.push('/');
      }
    },
    created() {
    }
  }
</script>

<style>

#nav {

}
</style>
