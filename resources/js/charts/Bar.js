import { Bar } from 'vue-chartjs'

export default {
  extends: Bar,
  data: () => ({
    chartdata: {
      labels: ['January', 'February', 'March'],
      datasets: [
      {
        label: 'Seccion1',
        backgroundColor: ['#f87979','#f87979','#f87979'],
        data: [5, 10, 15]
      },
      {
        label: 'Seccion2',
        backgroundColor: ['#1C1A1A','#1C1A1A','#1C1A1A'],
        data: [10, 20, 30]
      },
      {
        label: 'Seccion3',
        backgroundColor: ['#204CCA','#204CCA','#204CCA'],
        data: [15, 25, 35]
      }
      ]
    },
    options: {
      scales: {
        yAxes: [{
          ticks: {
            beginAtZero: true
          }
        }]
      },
      responsive: true,
      maintainAspectRatio: false
    }
  }),

  mounted () {
    this.renderChart(this.chartdata, this.options)
  }
}   