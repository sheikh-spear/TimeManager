<template>
  <div class="home" id="Home">
      <!-- <div class="grid-ruler">
          <div class="grid-ruler__item"></div>
          <div class="grid-ruler__item"></div>
          <div class="grid-ruler__item"></div>
          <div class="grid-ruler__item"></div>
          <div class="grid-ruler__item"></div>
          <div class="grid-ruler__item"></div>
          <div class="grid-ruler__item"></div>
          <div class="grid-ruler__item"></div>
          <div class="grid-ruler__item"></div>
          <div class="grid-ruler__item"></div>
          <div class="grid-ruler__item"></div>
          <div class="grid-ruler__item"></div>
      </div> -->
      <div class="grid-container">
          <div class="grid-item clock-container">
              <div class="content">
                  <Clock />
              </div>
          </div>
          <div class="grid-item user-worktime-container">
              <div class="content">
                  <user-worktime :userId="userId"></user-worktime>
              </div>
              <!-- <user-worktime :userId="userId"></user-worktime> -->
          </div>

      </div>
  </div>
</template>


<script>
import UserWorktime from "../components/Workingtime";
import Clock from "../components/Clock.vue";

export default {
  name: "HomePage",
  data() {
    return {
      userId: "b6d4-r4bf..."
    };
  },
  components: {
    UserWorktime,
    Clock
  }
};
</script>

<style lang="scss">
@import "../styles/index.scss";

.home {
  padding: 16px;
  height: 100vh;
  box-sizing: border-box;
  position: relative;
}

.grid-container {
  display: flex;
  margin: -8px;
}

.grid-item {
  padding: 8px;
  /* flex-grow: 1; */
  flex-shrink: 1;
  flex-grow: 0;
}

.content {
  padding: 16px;
  border-radius: 4px;
  background-color: rgb(63 81 181 / 40%);
  box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.25);
}

.user-worktime-container {
  @include tablet {
    flex-basis: calc((100% / 3) * 2);
  }
  @include laptop-s {
    flex-basis: 50%;
  }
  @include laptop-m {
    /* flex-basis: calc(100% / 3); */
    flex-basis: 50%;
  }
  @include laptop-l {
    flex-basis: 50%;
  }
}

.clock-container {
  @include tablet {
    flex-basis: calc(100% / 3);
  }
  @include laptop-s {
    flex-basis: 50%;
  }
  @include laptop-m {
    /* flex-basis: calc(100% / 3); */
    flex-basis: 50%;
  }
  @include laptop-l {
    flex-basis: 50%;
  }
}

.grid-ruler {
  display: grid;
  grid-gap: 16px;
  grid-template-columns: repeat(12, 1fr);
  /* box-sizing: border-box; */
  position: absolute;
  right: 0;
  bottom: 0;
  padding: 16px;
  width: 100%;
  height: 100vh;

  &__item {
    background-color: rgba(0, 0, 0, 0.25);
    box-sizing: border-box;
  }
}
</style>