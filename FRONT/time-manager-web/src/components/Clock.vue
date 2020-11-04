<template>
    <div class="clock">
        <h2 class="clock__title">Bonjour !</h2>
        <p class="clock__date">Lundi 3 novembre</p>
        <p class="clock__time">14:15</p>
        <div class="button-group">
            <button v-on:click="startClock" class="btn btn-default">Arrivée</button>
            <button v-on:click="stopClock" class="btn btn-primary">Départ</button>
        </div>
    </div>
</template>

<script>
export default {
  data() {
    return {};
  },
  methods: {
    startClock: () => {
      console.log("start clock");
    },
    stopClock: () => {
      console.log("stop clock");
    }
  }
};
</script>

<style lang="scss">
@import "../styles/index.scss";

.clock {
  font-family: "Poppins", sans-serif;
  text-align: center;
  background-color: #fff;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
  border-radius: 8px;
  padding: 30px 10px;
  width: 100%;

  &__title {
    margin: 30px 0;
  }

  &__date {
    font-weight: 500;
    font-size: 18px;
  }

  &__time {
    font-weight: bold;
    font-size: 50px;
  }
}

.button-group {
  display: flex;
  justify-content: space-around;
  align-items: center;

  button {
    flex-basis: 30%;
  }
}
</style>


