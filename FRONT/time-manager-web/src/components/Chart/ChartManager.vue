<script>
import { Bar } from 'vue-chartjs'

export default {
  extends: Bar,
  name: "ChartManager",
  data: () => ({
    chartdata: {
      labels: ['January', 'February'],
      datasets: [
        {
          label: 'Data One',
          backgroundColor: '#f87979',
          data: [60, 20]
        }
      ]
    },
  }),
  mounted () {
    this.renderChart(this.data)
  }
}
</script>