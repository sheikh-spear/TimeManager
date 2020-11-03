<script>
  import { HorizontalBar, mixins } from 'vue-chartjs'

  export default {
    extends: HorizontalBar,
    mixins: [mixins.reactiveProp],
    props: ['chartOptions'],
    mounted () {
      this.renderChart(this.chartData, this.chartOptions)
    },
    watch: {
      chartOptions(oldVal,newVal){
        if(oldVal.title.text != newVal.title.text) this.renderChart(this.chartData, this.chartOptions)
      }
    }
  }
</script>