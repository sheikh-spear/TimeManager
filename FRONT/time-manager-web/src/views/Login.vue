<template>
    <div class="login">
        <form class="form" v-on:submit.prevent="onSubmit">
            <h2 class="form__title">Join thousand of worker from around the world</h2>
            <p class="form__text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque a dui at dui bibendum mattis. Aenean ultrices ligula vitae rutrum mattis.</p>
            <label class="form__label" for="email">Email</label>
            <input v-model="email" placeholder="Email" class="form__input" type="email" name="email" id="email" required>
            <label class="form__label" for="password">Password</label>
            <input v-model="password" placeholder="Password" class="form__input" type="password" id="password" name="password" required>
            <input class="form__button" type="submit" value="Start to work now">
            <div class="error">
                <p>{{errorMessage}}</p>
            </div>
        </form>
    </div>
</template>

<script>
// import axios from "axios";

import { loginUser } from "../utils/auth.js";

export default {
  methods: {
    getAuthenticatedToken: function() {
      loginUser();
      //Récupérer mail et password
      // var data = JSON.stringify({
      //   email: this.email,
      //   password: this.password
      // });

      // console.log(data);

      // var config = {
      //   method: "post",
      //   url: "http://yamikamisama.fr:4000/api/users/sign_in",
      //   headers: {
      //     "X-Requested-With": "XMLHttpRequest",
      //     "Content-Type": "application/json"
      //   },
      //   data: data
      // };

      // axios(config)
      //   .then(function(response) {
      //     console.log(JSON.stringify(response.data));
      //   })
      //   .catch(function(error) {
      //     console.log(error);
      //   });

      // axios.post("http://yamikamisama.fr:4000/api/users/sign_in").then(
      //   response => {
      //     //If success, redirect to /
      //     console.log(response);
      //     this.$router.push("/");
      //   },
      //   error => {
      //     //If error
      //     this.errorMessage = error.response.data.errors.detail;
      //   }
      // );
    }
  },
  data() {
    return {
      email: null,
      password: null,
      errorMessage: null,
      onSubmit: function() {
        this.getAuthenticatedToken();
      }
    };
  }
};
</script>

<style lang="scss">
.login {
  overflow: auto;
  height: 100vh;
  width: 100vw;
  display: flex;
  justify-content: center;
  align-items: center;
}

.form {
  border: 1px solid #bdbdbd;
  box-sizing: border-box;
  border-radius: 24px;
  width: 50%;
  color: #333333;
  padding: 90px 60px;

  .error {
    color: darkred;
    padding: 20px 0;
  }

  &__title {
    font-style: normal;
    font-weight: 600;
    font-size: 18px;
    line-height: 25px;
    margin-bottom: 20px;
  }

  &__text {
    font-style: normal;
    font-weight: normal;
    font-size: 16px;
    line-height: 22px;
    margin-bottom: 40px;
  }

  &__label {
    display: none;
  }

  &__input {
    padding: 16px;
    box-sizing: border-box;
    border-radius: 8px;
    border: 1px solid #bdbdbd;
    font-style: normal;
    font-weight: normal;
    font-size: 16px;
    line-height: 22px;
    margin-bottom: 14px;
    display: block;
    width: 100%;
  }

  &__button {
    background: #2f80ed;
    border-radius: 8px;
    display: block;
    font-style: normal;
    font-weight: 600;
    font-size: 16px;
    line-height: 22px;
    text-align: center;
    color: #ffffff;
    padding: 10px 120px;
    width: 100%;
    border: none;
    cursor: pointer;
    margin-top: 30px;
  }
}
</style>


