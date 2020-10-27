<template>
  <div id="Home">
    <Navbar />
    <div class="container">
      <TeamList/>
    </div>
  </div>
</template>


<script>

import Navbar from "./Navbar";
import TeamList from "../User/TeamList"

export default {
  name: "HomePage",
  components: {
    Navbar,
    TeamList
  },
};
</script>

<style lang="scss">
  @import "../../assets/style.scss";
  @import "../../../node_modules/bootstrap/scss/bootstrap.scss";
</style>