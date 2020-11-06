<template>
  <div id="UserList">
    User List Page
    <br />
    <div class="row">
      <div v-for="user in users" :key="user.id" class="col">
        <div class="card mb-4">
          <img
            class="card-img-top"
            src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22286%22%20height%3D%22180%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20286%20180%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_175649fc2bf%20text%20%7B%20fill%3Argba(255%2C255%2C255%2C.75)%3Bfont-weight%3Anormal%3Bfont-family%3AHelvetica%2C%20monospace%3Bfont-size%3A14pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_175649fc2bf%22%3E%3Crect%20width%3D%22286%22%20height%3D%22180%22%20fill%3D%22%23777%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%22107.203125%22%20y%3D%2296.253125%22%3E286x180%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E"
            alt="Card image cap"
          />
          <div class="card-body">
            <h5 class="card-title">{{ user.email }}</h5>
            <p v-if="user.is_general_manager == true" class="card-text">
              General Manager
            </p>
            <p v-else-if="user.is_manager == true" class="card-text">Manager</p>
            <div v-else>
              <span class="card-text">Employee</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import UserCard from "../components/User/UserCard";

export default {
  name: "UserList",
  components: {
    UserCard
  },
  data() {
    return {
      users: [
        {
          email: "mteodor.adr117@netfacc.com",
          is_manager: true,
          is_general_manager: true,
          id: "057231ee-91a9-404f-97ea-0f1a344de529"
        },
        {
          email: "wshubhampachaurib@rze.fr",
          is_manager: false,
          is_general_manager: false,
          id: "057231ee-91a9-404f-97ea-0f1a344de526"
        },
        {
          email: "rraji@acmta.com",
          is_manager: true,
          is_general_manager: false,
          id: "057231ee-91a9-404f-97ea-0f1a344de527"
        },
        {
          email: "0karimova@shoppyhunt.com",
          is_manager: false,
          is_general_manager: false,
          id: "057231ee-91a9-404f-97ea-0f1a344de520"
        },
        {
          email: "sammar.galmi7@nhmicrosoft.com",
          is_manager: true,
          is_general_manager: false,
          id: "057231ee-91a9-404f-97ea-0f1a344de528"
        }
      ]
    };
  }
};
</script>

<style scoped></style>
