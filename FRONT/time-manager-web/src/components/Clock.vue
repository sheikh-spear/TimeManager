<template>
    <div class="clock">
        <h2 class="clock__title">Bonjour !</h2>
        <p class="clock__date">{{day}}</p>
        <p class="clock__time">{{time}}</p>
        <div class="button-group">
            <button v-on:click="punchClock" class="btn btn-default" :disabled="status">Arrivée</button>
            <button v-on:click="punchClock" class="btn btn-primary" :disabled="!status">Départ</button>
        </div>
    </div>
</template>

<script>
import axios from "axios";
import moment from "moment";

export default {
  data() {
    return {
      status: this.user.status
    };
  },
  props: ["user"],
  computed: {
    day: function() {
      return moment()
        .locale("fr")
        .format("LL");
    },
    time: function() {
      return moment()
        .locale("fr")
        .format("LT");
    }
  },
  methods: {
    punchClock: function() {
      console.log("punch clock");
      axios.get("users/punch_clock").then(response => {
        this.status = response.data.data.status;
      });
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


