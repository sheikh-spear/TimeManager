<template>
  <div id="Home">
    <Navbar />
    <div class="container">
      <UserList/>
    </div>
  </div>
</template>

<script>
import Navbar from "./Navbar";
import UserList from "../User/UserList"

export default {
  name: "HomePage",
  components: {
    Navbar,
    UserList
  },
};
</script>

<style lang="scss">
  @import "../../assets/style.scss";
  @import "../../../node_modules/bootstrap/scss/bootstrap.scss";
</style>