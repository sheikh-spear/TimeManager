<template>
    <div id="user-worktime" class="working-time">

        <div v-if="worktimes!=null" class="small">
            <worktime-chart :worktimes="worktimes" :date="date" :mode="mode"></worktime-chart>
        </div>
        <div class="working-time__options">
            <div class="working-time__input-group">
            <label class="working-time__date-label" for="date">Date to check:</label>
            <input class="working-time__date-input" id="date" type="date" value="2020-10-25" v-on:change="date = new Date($event.target.value)">
        </div>
        <toggle-button :value="mode=='weekly'"
                :labels="{checked: 'Weekly', unchecked: 'Daily'}" :width="110" :height="35" :font-size="20"
                :switch-color="{checked: '#FFF', unchecked: '#FFF'}"
                :color="{checked: 'royalblue', unchecked: 'rgb(63 81 181 / 40%)', disabled: '#CCCCCC'}"
            @change="toggleMode"/>
        </div>

    </div>
</template>

<script>
import Axios from "axios";
import WorktimeChart from "../components/chart/WorktimeChart";
export default {
  data() {
    return {
      dailyDataRetrived: false,
      dailyData: null,
      weeklyDataRetrived: false,
      weeklyData: null,
      mode: "daily",
      date: new Date("2020-10-25"),
      worktimes: null
    };
  },
  props: {
    userId: String
  },
  async mounted() {
    this.setDaily();
    this.getUserWorkingtime(this.userId).then(result => {
      this.worktimes = result;
    });
  },
  components: {
    WorktimeChart
  },
  methods: {
    toggleMode(data) {
      if (data.value) {
        this.setWeekly();
      } else {
        this.setDaily();
      }
    },
    setDaily() {
      if (this.dailyDataRetrived) {
        this.datacollection = this.dailyData;
      } else {
        //TODO retrive data
        //service.getUserWorktime.get(1)
        this.dailyData = {};

        this.dailyDataRetrived = true;
        this.datacollection = this.dailyData;
      }
      this.mode = "daily";
    },
    setWeekly() {
      if (this.weeklyDataRetrived) {
        this.datacollection = this.weeklyData;
      } else {
        //TODO retrive data
        this.weeklyData = {};

        this.weeklyDataRetrived = true;
        this.datacollection = this.weeklyData;
      }
      this.mode = "weekly";
    },
    async getUserWorkingtime(userId) {
      return await new Promise(resolve =>
        Axios.get(`/api/workingtime/${userId}`).then(response => {
          console.log("response", response);
          let workingtimes = [];
          response.data.data.forEach(dateString => {
            workingtimes.push({
              start: new Date(dateString.start),
              end: new Date(dateString.end)
            });
          });
          resolve(workingtimes);
        })
      );
    }
  }
};
</script>

<style lang="scss">
.working-time {
  font-family: "Poppins", sans-serif;
  background-color: #fff;
  margin: 20px;
  width: 50%;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
  border-radius: 8px;
  padding: 30px 10px;

  &__options {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 20px;
  }

  &__date-input {
    display: block;
    padding: 15px 12px;
    color: #333333;
    border: 1px solid #333333;
    box-sizing: border-box;
    border-radius: 12px;
  }

  &__date-label {
    display: inline-block;
    padding-left: 5px;
    display: none;
  }
}
</style>