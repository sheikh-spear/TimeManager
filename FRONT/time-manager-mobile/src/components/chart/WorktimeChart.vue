<template>
    <component v-bind:is="barComponent" :date="date" :chart-data="chartData" :chartOptions="options"></component>
</template>

<script>
import BarChart from './BarChart'
import HorizontalBarChart from './HorizontalBarChart'

const weekday=[
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
];

export default {
    name: "WorktimeChart",
    props: ['worktimes', 'date', 'mode'],
    components: {BarChart,HorizontalBarChart},
    data: function(){
        return {
            barComponent: "bar-chart",
            chartData: {},
            options: {}
        }
    },
    mounted(){
        this.showWorkingTime()
    },
    watch: {
        mode(){
            this.showWorkingTime()
        },
        date(){
            this.showWorkingTime()
        }
    },
    methods: {
        showWorkingTime(){
            let worktimes = this.worktimes;
            if(worktimes && worktimes.length > 0){
                let labels = [];
                let data = [];
                let title;
                
                if(this.mode == "weekly"){
                    /**
                     * @type {Date}
                     */
                    let mondayDate = new Date(this.date.getTime() - this.date.getDay() * 24*60*60*1000);
                        mondayDate.setHours(0)
                        mondayDate.setMinutes(0)
                        mondayDate.setSeconds(0)
                        mondayDate.setMilliseconds(0)
                    let sundayDate = new Date(this.date.getTime() + (6 - this.date.getDay()) * 24*60*60*1000)
                        sundayDate.setHours(23)
                        sundayDate.setMinutes(59)
                        sundayDate.setSeconds(59)
                        sundayDate.setMilliseconds(999)

                    worktimes = worktimes.filter(
                      /**
                       * @param wt {{start: Date, end: Date}} */  
                      (wt)=>{
                        let dateOk=wt.start.getMonth() == this.date.getMonth();
                        let yearOk=wt.start.getFullYear() == this.date.getFullYear()
                        return dateOk
                            && yearOk
                            && wt.start.getTime()>=mondayDate.getTime()
                            && wt.start.getTime()<=sundayDate.getTime()
                    })

                    let daysHours = new Map()
                    
                    worktimes.forEach( dt=>{
                    let day = dt.start.getDay()
                    
                    let hours = ( dt.end.getTime() -  dt.start.getTime() ) / 1000/60/60
                    let totalHours = daysHours.get(day)?daysHours.get(day)+hours:hours
                    daysHours.set(day,totalHours);
                    });
            
                    for(let i=0; i<7;i++){
                        let hours = ( daysHours.get(i)?daysHours.get(i):0 ).toPrecision(3);
                        
                        labels.push( weekday[i] )
                        data.push(hours)
                    }
                    
                    title = "Worktime from ";
                    title += (mondayDate.getDate()>10?"":"0")+mondayDate.getDate()+"/"
                    title += (mondayDate.getMonth()>10?"":"0")+mondayDate.getMonth()+"/"
                    title += mondayDate.getFullYear() + " to "
                    title += (sundayDate.getDate()>10?"":"0")+sundayDate.getDate()+"/"
                    title += (sundayDate.getMonth()>10?"":"0")+sundayDate.getMonth()+"/"
                    title += sundayDate.getFullYear()
                    
                    this.barComponent = "horizontal-bar-chart"
                }else{
                    worktimes = worktimes.filter( (dt)=> dt.start.getDay() == this.date.getDay() && dt.start.getMonth() == this.date.getMonth() && dt.start.getFullYear() == this.date.getFullYear())
                    
                    title = "Worktime of the "
                    title += (this.date.getDate()>10?"":"0")+this.date.getDate()+"/"
                    title += (this.date.getMonth()>10?"":"0")+this.date.getMonth()+"/"
                    title += this.date.getFullYear()

                    console.log("title:",title,"worktimes:",worktimes)
                    
                    worktimes.forEach( dt=>{
                        let hours = ( ( dt.end.getTime() -  dt.start.getTime() )/1000/60/60).toPrecision(3);
                        //Format to HH:mm
                        labels.push(`${dt.start.getHours()<10?"0":""}${dt.start.getHours()}h${dt.start.getMinutes()<10?"0":""}${dt.start.getMinutes()}`)
                        data.push(hours);
                    });
                    this.barComponent = "bar-chart"
                }
                
                this.chartData = {
                    labels: labels,
                    datasets: [
                        {
                        label: "hours",
                        backgroundColor: '#f87979',
                        data: data
                        }
                    ]
                }
        
                this.options = {
                    title: {
                        display: true,
                        text: title
                    },
                    legend: {
                        display: false
                    },
                    scales: {
                        yAxes: [{
                            ticks: {
                                beginAtZero: true
                            }
                        }]
                    }
                }
            }

            //To force the rerender
            this.renderKey++;
        }
    }
}
</script>