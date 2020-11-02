<script>
  import { Bar, mixins } from 'vue-chartjs'
  const { reactiveProp } = mixins

  export default {
    extends: Bar,
    mixins: [reactiveProp],
    props: ['chartOptions'],
    mounted () {
      this.renderChart(this.chartData, this.chartOptions)
    }
  }
</script>