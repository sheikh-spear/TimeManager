<template>
  <div id="app">

    <!-- <Navbar /> -->
    <div class="app-container">
      <header class="sidebar" id="sidebar">
        <a class="sidebar__burger-btn" href="#sidebar">
            <span class="burger-icon">
              
            </span>
          </a>

          <a class="sidebar__close-btn" href="#">
            <span class="close-icon">
            </span>
          </a>
        <div class="sidebar-inner">
          <div class="sidebar__details">
            <img src="https://via.placeholder.com/60x60" alt="">
            <div class="sidebar__details-inner">
              <p id="mail">email@email.com</p>
              <p id="role">general manager</p>
            </div>
          </div>
        <nav class="sidebar__navigation">
          <ul>
            <li><a href="#">dashboard</a></li>
            <li><a href="#">profile</a></li>
            <li><a href="#">employees</a></li>
            <li><a href="#">teams</a></li>
          </ul>
          
        </nav>
        <button class="sidebar__button">logout</button>
        </div>
      </header>
    <main class="dashboard">
      main
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

export default {
  name: "App",
  components: {
    // Navbar
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
  @import url("https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap");
  font-family: "Noto Sans", sans-serif;
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
  grid-column: 2 / -1;
}
</style>
