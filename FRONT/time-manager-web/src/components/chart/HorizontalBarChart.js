import { HorizontalBar, mixins } from 'vue-chartjs'
const { reactiveProp } = mixins

export default {
  extends: HorizontalBar,
  mixins: [reactiveProp],
  props: ['chartOptions'],
  mounted () {
    this.renderChart(this.chartData, this.chartOptions)
  }
}