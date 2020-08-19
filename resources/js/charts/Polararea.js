import { PolarArea } from 'vue-chartjs'

export default {
  extends: PolarArea,
  data: () => ({
    chartdata: {
      labels: ['January', 'February', 'March'],
      datasets: [
        {
          label: 'Data One',
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