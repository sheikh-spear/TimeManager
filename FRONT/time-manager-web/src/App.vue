<template>
  <div id="app">
    <router-view></router-view>
    <HomePage/>
  </div>

</template>

<script>

import HomePage from './components/Views/HomePage.vue'

export default {
  name: "App",
  components: {
    HomePage
  }
};
</script>

<style lang="scss">
#app {
  @import url("https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap");
  font-family: "Noto Sans", sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
}
</style>
