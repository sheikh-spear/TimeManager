<template>
    <div class="profile">
        <img src="" alt="">

        <div class="profile__card">
          <h2 class="profile__title">Profile details</h2>

          <div class="profile__details">
            <div class="profile__details-group">
              <span class="profile__details-label">email</span>
              <p class="profile__details-text">email@test.com</p>
            </div>
            <div class="profile__details-group">
              <span class="profile__details-label">id</span>
              <p class="profile__details-text">057231ee-91a9-404f-97ea-0f1a344de529</p>
            </div>
             <div class="profile__details-group">
              <span class="profile__details-label">role</span>
              <p class="profile__details-text"> <span id="role">manager</span></p>
            </div>
          </div>

          <button class="btn btn-default">Logout</button>
        </div>
    
    </div>
</template>

<script>
export default {
  name: "Profile",
  methods: {
    getUserAvatar: function() {}
  },
  data() {
    return {
      message: "Profile"
    };
  }
};
</script>

<style lang="scss">
@import "../styles/index";

.profile {
  height: 100vh;
  width: 100vw;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;

  &__card {
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
    transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
    border-radius: 8px;
    padding: 50px;
    display: flex;
    flex-direction: column;
  }

  &__title {
    padding-bottom: 30px;
  }

  &__details {
    &-group {
      padding: 5px 0;

      #role {
        display: inline-block;
        padding: 5px 10px;
        text-transform: uppercase;
        border: 1px solid #2c3e50;
        border-radius: 4px;
        font-weight: 600;
        margin-top: 10px;
      }
    }

    &-label {
      text-transform: uppercase;
      color: #9e9e9e;
      font-weight: 700;
      font-size: 16px;
    }

    &-text {
      font-size: 16px;
    }
  }
}
</style>


