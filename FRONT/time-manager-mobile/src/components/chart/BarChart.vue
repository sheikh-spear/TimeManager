<script>
  import { Bar, mixins } from 'vue-chartjs'

  export default {
    extends: Bar,
    mixins: [mixins.reactiveProp],
    props: ['chartOptions'],
    mounted () {
      this.renderChart(this.chartData, this.chartOptions)
    },
    watch: {
      chartOptions(){
        this.renderChart(this.chartData, this.chartOptions)
      }
    }
  
  }
</script>