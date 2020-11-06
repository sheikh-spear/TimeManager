<template>
    <div class="team-container">
    <div class="message" v-if="users && !users.length">
        <h3>There is no employee in your team</h3>
    </div>
    <div class="users-list" v-if="users && users.length">
            <h3 class="team-title">Users in your team:</h3>
            <ul>
                <li v-for="user in users" :key="user.email">
                    <div class="list-item">
                        <div class="user-details">
                            <p class="email">{{user.email}}</p>
                            <p class="role" v-if="user.is_manager">manager</p>
                            <p class="role" v-if="!user.is_manager">user</p>
                        </div>
                        <!-- <button v-on:click="() => addUser(user)" class="btn btn-primary">Add</button> -->
                        <button v-on:click="() => deleteUser(user)" class="btn btn-danger">Delete</button>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      users: null
    };
  },
  created() {
    this.getUsersList();
  },
  methods: {
    getUsersList: function() {
      var config = {
        method: "get",
        url: "manager/list_users_from_team",
        headers: {
          "X-Requested-With": "XMLHttpRequest",
          "Content-Type": "application/json"
        }
      };

      axios(config)
        .then(response => {
          console.log(response);
          this.users = response.data.data;
        })
        .catch(function(error) {
          console.log(error);
        });
    },
    deleteUser: function(user) {
      var data = JSON.stringify({ email: user.email });

      var config = {
        method: "post",
        url: "manager/remove_user_from_team",
        headers: {
          "X-Requested-With": "XMLHttpRequest",
          "Content-Type": "application/json"
        },
        data
      };

      console.log(config);

      axios(config)
        .then(response => {
          console.log(response);
        })
        .catch(function(error) {
          console.log(error);
        });
    }
  }
};
</script>

<style lang="scss">
@import "../styles/index.scss";

.message {
  text-align: center;
}

.team-container {
  overflow-y: scroll;
  height: 100vh;
  box-sizing: border-box;
  padding: 30px;
}

.team-title {
  font-size: 40px;
  text-align: center;
  margin: 20px 0;
}

.users-list {
  width: 50%;
  margin: 0 auto;
  ul {
    padding: 0;
    list-style: none;
  }
}
.list-item {
  box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
  background-color: #fff;
  padding: 30px 20px;
  margin-bottom: 20px;
  border-radius: 8px;

  display: flex;
  justify-content: flex-end;
  align-items: center;

  .btn {
    margin-left: 20px;
    height: max-content;
    margin-top: auto;
  }
}

.user-details {
  margin-right: auto;
}

.email {
  margin: 3px 0;

  @include tablet {
    font-size: 12px;
    font-weight: 600;
  }

  @include laptop-s {
    font-weight: 600;
    font-size: 16px;
  }

  @include laptop-m {
    font-weight: 600;
    font-size: 18px;
  }
}

.role {
  margin: 3px 0;
  text-transform: capitalize;
  display: inline-block;
  padding: 5px 10px;
  text-transform: uppercase;
  border: 1px solid #2c3e50;
  border-radius: 4px;
  font-weight: 600;
  margin-top: 10px;

  @include tablet {
    font-size: 12px;
  }

  @include laptop-s {
    font-weight: 400;
    font-size: 14px;
  }
}
</style>





