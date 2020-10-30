<template>
  <div id="Home">
      <user-worktime :userId="userId"></user-worktime>
  </div>
</template>


<script>
import UserWorktime from '../components/UserWorktime'

export default {
  name: "UserDashboard",
  data () {
    return {
      userId: "b65d-4fed1..."
    }
  },
  components: {
    UserWorktime
  }
};
</script>

<style lang="scss">

</style>