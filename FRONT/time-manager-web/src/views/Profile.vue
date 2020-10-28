<template>
    <div class="profile">
        <h2>Profile</h2>
        <img src="" alt="">
        <p>{{message}} details</p>
        <button class="btn-primary">Logout</button>
    </div>
</template>

<script>
export default {
  name: "Profile",
  methods: {
    getUserAvatar: function() {
    }
  },
  data() {
    return {
      message: "Profile"
    };
  }
};
</script>

<style lang="scss">
@import "../styles/buttons";

.profile {
  height: 100vh;
  width: 100vw;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
}
</style>


