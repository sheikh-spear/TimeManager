<template>
<header class="sidebar" id="sidebar" > 
        <a class="sidebar__burger-btn" href="#sidebar">
            <span class="burger-icon">
              
            </span>
          </a>

          <a class="sidebar__close-btn" href="#">
            <span class="close-icon">
            </span>
          </a>
        <div class="sidebar-inner" v-if="isLoggedIn">
          <div class="sidebar__details">
            <img src="https://via.placeholder.com/60x60" alt="">
            <div class="sidebar__details-inner">
              <p id="mail" v-if="user">{{user.email}}</p>
              <p id="role" v-if="user.is_general_manager">general manager</p>
              <p id="role" v-if="!user.is_general_manager && user.is_manager">manager</p>
              <p id="role" v-if="!user.is_general_manager && !user.is_manager">user</p>
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

        <div class="message" v-if="!isLoggedIn">
          <h2>Welcome to Time Manager App !</h2>
        </div>
      </header>
    
</template>

<script>
import { logoutUser } from "../utils/auth.js";
export default {
  props: ["isLoggedIn", "user"],
  data() {
    return {
      mail: "mail"
    };
  },
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

.message {
  height: 100%;
  display: flex;
  justify-content: center;
  /* align-items: center; */
  padding: 30px;
  flex-direction: column;

  h2 {
    line-height: 40px;
  }
}
</style>

