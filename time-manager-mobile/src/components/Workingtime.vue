<template>
    <div id="user-worktime">
        <div>Display mode : 
            <toggle-button :value="mode=='weekly'"
                :labels="{checked: 'Weekly', unchecked: 'Daily'}" :width="110" :height="35" :font-size="20"
                :switch-color="{checked: 'linear-gradient(lightgray, white)', unchecked: 'linear-gradient(lightgray, white)'}"
            @change="toggleMode"/>
        </div>
        <div>
            Date to check: <input type="date" value="2020-10-25" v-on:change="date = new Date($event.target.value)">
        </div>

        <div v-if="worktimes!=null" class="small">
            <worktime-chart :worktimes="worktimes" :date="date" :mode="mode"></worktime-chart>
        </div>
    </div>
</template>

<script>
import Axios from 'axios'
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
            worktimes: null
        }
    },
    props: {
        userId: String
    },
    async mounted () {
        this.setDaily()
        this.getUserWorkingtime(this.userId).then( (result)=>{
            this.worktimes = result
        }) 
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
            //service.getUserWorktime.get(1)
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
        },
        async getUserWorkingtime(userId){
            return await new Promise( (resolve)=> Axios.get(`/api/workingtime/${userId}`).then( responce=>{
                console.log("responce",responce)
                let workingtimes = []
                responce.data.data.forEach( dateString=>{
                    workingtimes.push({ start: new Date(dateString.start), end: new Date(dateString.end)})
                })
                resolve(workingtimes);
            }));
        }
    }
}
</script>

<style lang="scss">
#user-worktime {
    margin: 20px auto;
    text-align: center;
}
</style>