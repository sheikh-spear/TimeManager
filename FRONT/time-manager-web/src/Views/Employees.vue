<template>
    <div class="employees-container">
        <h2 class="employees-title">Employees</h2>
        <!-- <ul>
            <li v-for="user in users" v-bind:key="user.mail">
                <p>{{user.mail}}</p>
            </li>
        </ul> -->
<hr>
        <div class="employees-list">
            <ul>
                <li v-for="user in users" :key="user.email">
                    <div class="list-item">
                        <div class="user-details">
                            <p class="email">{{user.email}}</p>
                            <p class="role" v-if="user.is_manager">manager</p>
                            <p class="role" v-if="!user.is_manager">user</p>
                        </div>
                        <button v-on:click="() => addUser(user)" class="btn btn-primary">Add</button>
                        <!-- <button v-on:click="() => deleteUser(employee)" class="btn btn-danger">Delete</button> -->
                    </div>
                </li>
            </ul>
        </div>
    </div>

</template>

<script>
const axios = require("axios");

export default {
  name: "Employees",
  data() {
    return {
      employees: null,
      team: null
    };
  },
  created() {
    this.getUsersList();
    this.getTeamList();
  },
  computed: {
    users: function() {
      if (this.employees && this.team) {
        const users = this.employees.filter(employee => {
          for (let user of this.team) {
            // console.log(user.email);
            if (employee.email === user.email) return false;
          }

          return true;
        });

        return users;
      }
    }
  },
  methods: {
    getUsersList: function() {
      var config = {
        method: "get",
        url: "manager/list_users",
        headers: {
          "X-Requested-With": "XMLHttpRequest",
          "Content-Type": "application/json"
        }
      };

      axios(config)
        .then(response => {
          this.employees = response.data.data;
        })
        .catch(function(error) {
          console.log(error);
        });
    },
    getTeamList: function() {
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
          this.team = response.data.data;
        })
        .catch(function(error) {
          console.log(error);
        });
    },
    addUser: function(user) {
      var data = JSON.stringify({ email: user.email });

      var config = {
        method: "post",
        url: "manager/add_user_to_team",
        headers: {
          "X-Requested-With": "XMLHttpRequest",
          "Content-Type": "application/json"
        },
        data
      };

      axios(config)
        .then(response => {
          console.log(response);
        })
        .catch(function(error) {
          console.log(error);
        });
    }
    // deleteUser: function(user) {
    //   console.log(user);
    // }
  }
};
</script>

<style lang="scss">
@import "../styles/index.scss";
.employees-container {
  overflow-y: scroll;
  height: 100vh;
  box-sizing: border-box;
  padding: 30px;
}

.employees-title {
  font-size: 40px;
  text-align: center;
  margin: 20px 0;
}
.employees-list {
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


