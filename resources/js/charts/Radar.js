import { Radar } from 'vue-chartjs'

export default {
  extends: Radar,
  data: () => ({
    chartdata: {
      labels: ['January', 'February', 'March'],
      datasets: [
      {
        label: 'Titulo radar',
        backgroundColor: ['#f87979'],
        borderDash: ['#204CCA'],
        data: [4, 20, 30]
      },
      {
        label: 'Titulo radar',
        backgroundColor: ['#E5FE10'],
        borderDash: ['#204CCA'],
        data: [25, 15, 30]
      },
      ]
    },
    options:  {
      scale: {
        angleLines: {
          display: false
        }
      }
    }
  }),

  mounted () {
    this.renderChart(this.chartdata, this.options)
  }
}