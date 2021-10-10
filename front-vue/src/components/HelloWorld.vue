<template>
  <div class="hello">
    <h1 class="d-block text-success">{{ msg }}</h1>
    <h3>My docs</h3>
    <ul class="list-group">
      <li class="list-group-item"><a href="https://cli.vuejs.org" target="_blank" rel="noopener">vue-cli documentation</a>.</li>
      <li class="list-group-item"><a href="https://router.vuejs.org" target="_blank" rel="noopener">vue-router</a></li>
      <li class="list-group-item"><a href="https://vuex.vuejs.org" target="_blank" rel="noopener">vuex</a></li>
      <li class="list-group-item"><a href="https://vuejs.org" target="_blank" rel="noopener">Core Docs</a></li>
    </ul>
  </div>
</template>

<script>
export default {
  name: 'HelloWorld',
  props: {
    msg: String
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
