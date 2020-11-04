<template>
  <div id="app">

    <!-- <Navbar /> -->
    <div class="app-container">
    <Sidebar />
    <main class="dashboard">
      <!-- We pass our user state across the component tree thanks to router-view
    component that acts as a placeholder for another children component
    We ensure that all components share the same user state -->
      <router-view :user="user"></router-view>
    </main>
    </div>

  </div>
</template>

<script>
import axios from "axios";
// import Navbar from "./views/Navbar";
import Sidebar from "./components/Sidebar";

export default {
  name: "App",
  components: {
    Sidebar
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
@import "./styles/index.scss";

#app {
  @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap");
  font-family: "Poppins", sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
}

.app-container {
  display: grid;
  width: 100vw;
  height: 100vh;
  grid-template-columns: repeat(12, 1fr);

  /* @include mobile {
    grid-template-columns: minmax(80px, 10%) 1fr;
  }

  @include laptop-l {
    grid-template-columns: minmax(150px, 25%) 1fr;
  } */
}

.dashboard {
  background-color: #d6e3ff;

  @include mobile {
    grid-column: 2 / -1;
  }

  @include laptop-l {
    grid-column: 4 / -1;
  }
}
</style>
