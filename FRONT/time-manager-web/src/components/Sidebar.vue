<template>
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
            <li><router-link to="/">dashboard</router-link></li>
            <li><router-link to="/profile">profile</router-link></li>
            <li><router-link to="/users">employees</router-link></li>
            <li><router-link to="/teams">teams</router-link></li>
          </ul>
          
        </nav>
        <button class="sidebar__button" v-on:click="logout">logout</button>
        </div>
      </header>
    
</template>

<script>
import { logoutUser } from "../utils/auth.js";
export default {
  methods: {
    logout: function() {
      logoutUser();
      console.log("logout");
      this.$router.push("/login");
    }
  }
};
</script>

<style lang="scss">
@import "../styles/index.scss";
</style>

