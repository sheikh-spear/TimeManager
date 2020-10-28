<template>
  <div id="app">
    <!-- We pass our user state across the component tree thanks to router-view
    component that acts as a placeholder for another children component
    We ensure that all components share the same user state -->
    <Navbar />
    <div class="container">
    <router-view :user="user"></router-view>
    </div>

  </div>
</template>

<script>
import axios from "axios";
import Navbar from "./views/Navbar";

export default {
  name: "App",
  components: {
    Navbar
  },
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
@import "./assets/style.scss";
@import "../node_modules/bootstrap/scss/bootstrap.scss";
#app {
  @import url("https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap");
  font-family: "Noto Sans", sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
}
</style>
