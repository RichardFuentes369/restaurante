import { Pie } from 'vue-chartjs'

export default {
  extends: Pie,
  data: () => ({
    chartdata: {
      labels: ['January', 'February', 'March'],
      datasets: [
        {
          backgroundColor: ['#f87979', '#204CCA', '#1C1A1A'],
          data: [4, 20, 30]
        }
      ]
    },
    options: {
      responsive: true,
      maintainAspectRatio: false
    }
  }),

  mounted () {
    this.renderChart(this.chartdata, this.options)
  }
}