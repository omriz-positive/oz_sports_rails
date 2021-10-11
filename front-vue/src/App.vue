<template>
  <div id="nav">
    <router-link to="/">Home</router-link> |
    <router-link to="/about">About</router-link>
    <button v-on:click="logoutOfTrainer()" id="logout" class="btn btn-danger">Logout</button>
  </div>
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
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#nav {
  padding: 30px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #42b983;
}

#logout{
  float:right;
}
</style>
