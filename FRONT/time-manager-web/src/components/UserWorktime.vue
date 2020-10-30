<template>
    <div id="user-worktime">
        <div>Display mode : 
            <toggle-button :value="mode=='weekly'"
                :labels="{checked: 'Weekly', unchecked: 'Daily'}" :width="110" :height="35" :font-size="20"
                :switch-color="{checked: 'linear-gradient(lightgray, white)', unchecked: 'linear-gradient(lightgray, white)'}"
                @change="toggleMode"/>
        </div>

        <div class="small">
            <worktime-chart :worktimes="worktimes" :date="date" :mode="mode"></worktime-chart>
        </div>
    </div>
</template>

<script>
import WorktimeChart from "../components/chart/WorktimeChart"
export default {
    data () {
        return {
            dailyDataRetrived: false,
            dailyData: null,
            weeklyDataRetrived: false,
            weeklyData: null,
            mode: "daily",
            date: new Date("2020-10-25"),
            worktimes: [
                {start: new Date("2020-10-23 09:05:00"), end: new Date("2020-10-23 14:02:00")},
                {start: new Date("2020-10-23 10:02:00"), end: new Date("2020-10-23 12:02:00")},
                {start: new Date("2020-10-24 09:02:00"), end: new Date("2020-10-24 14:02:00")},
                {start: new Date("2020-10-24 15:06:02"), end: new Date("2020-10-24 18:15:00")},
                {start: new Date("2020-10-25 09:02:00"), end: new Date("2020-10-25 14:02:00")},
                {start: new Date("2020-10-25 10:02:00"), end: new Date("2020-10-25 12:02:00")}
            ]
        }
    },
    props: {
        userId: String
    },
    async mounted () {
        this.setDaily()
    },
    components: {
        WorktimeChart
    },
    methods: {
        toggleMode(data){
            if(data.value){
            this.setWeekly();
        }else{
            this.setDaily();
        }
    },
    setDaily() {
        if(this.dailyDataRetrived){
            this.datacollection = this.dailyData
        }else{
          //TODO retrive data
          // service.getUserWorktime
          this.dailyData = { }

          this.dailyDataRetrived=true
          this.datacollection = this.dailyData
        }
        this.mode = "daily"
    },
    setWeekly(){
        if(this.weeklyDataRetrived){
          this.datacollection = this.weeklyData
        }else{
          //TODO retrive data
          this.weeklyData = { }

          this.weeklyDataRetrived=true
          this.datacollection = this.weeklyData
        }
        this.mode = "weekly"
      }
  }
}
</script>