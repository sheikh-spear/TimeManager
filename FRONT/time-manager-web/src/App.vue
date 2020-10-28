<template>
  <div id="app">
    <!-- We pass our user state across the component tree thanks to router-view
    component that acts as a placeholder for another children component
    We ensure that all components share the same user state -->
    <router-view :user="user"></router-view>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "App",
  data() {
    return {
      user: null
    };
  },
  created() {
    // => Asnyc API call here <=
    axios.get("/api/users").then(response => {
      //get the user and store it to the local state of our App parent component
      this.user = response.data;
    });
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
