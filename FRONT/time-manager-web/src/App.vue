<template>
  <div id="app">

    <!-- <Navbar /> -->
    <div class="app-container">
    <Sidebar v-if="loading" :user="user" :isLoggedIn="isLoggedIn" />
    <main class="dashboard">
      <!-- We pass our user state across the component tree thanks to router-view
    component that acts as a placeholder for another children component
    We ensure that all components share the same user state -->
      <router-view v-if="loading" :user="user"></router-view>
    </main>
    </div>

  </div>
</template>

<script>
import axios from "axios";
// import Navbar from "./views/Navbar";
import Sidebar from "./components/Sidebar";
import { isLoggedIn } from "./utils/auth.js";

export default {
  name: "App",
  components: {
    Sidebar
  },
  data() {
    return {
      user: null,
      isLoggedIn: null,
      loading: false
    };
  },
  methods: {
    getUserData: function() {
      console.log("get user");
      // console.log(document.cookie);
      var config = {
        method: "get",
        url: `users/profile`,
        headers: {
          "X-Requested-With": "XMLHttpRequest",
          "Content-Type": "application/json"
        }
      };

      axios(config)
        .then(response => {
          this.user = response.data.data;
          this.loading = true;
        })
        .catch(error => {
          console.log(error);
        });
    }
  },
  updated() {
    this.isLoggedIn = isLoggedIn();
  },
  watch: {
    isLoggedIn: function() {
      this.loading = false;
      this.getUserData();
    }
  },
  created: function() {
    if (isLoggedIn()) {
      this.getUserData();
    } else {
      this.loading = true;
    }
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
  overflow-y: scroll;
  @include mobile {
    grid-column: 3 / -1;
  }

  @include tablet {
    grid-column: 2 / -1;
  }

  @include laptop-l {
    grid-column: 4 / -1;
  }
}
</style>
