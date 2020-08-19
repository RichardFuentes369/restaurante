import { Line } from 'vue-chartjs'

export default {
  extends: Line,
  data: () => ({
    chartdata: {
      labels: ['January', 'February', 'March'],
      datasets: [
      {
        label: 'Line Chart',
        data: [600,  1150,  342,  6050,  2522,  3241,  1259,  157,  1545, 9841],
        fill: false,
        borderColor: '#2554FF',
        backgroundColor: '#2554FF',
        borderWidth: 1
      },
      {
        label: 'Line Chart',
        data: [100 ,  200,  300,  400,  500],
        fill: false,
        borderColor: '#FF252A',
        backgroundColor: '#FF2525',
        borderWidth: 1
      }
      ]
    },
    options: {
      scales: {
        yAxes: [{
          ticks: {
            beginAtZero: true
          },
          gridLines: {
            display: true
          }
        }],
        xAxes: [ {
          gridLines: {
            display: false
          }
        }]
      },
      legend: {
        display: true
      },
      responsive: true,
      maintainAspectRatio: false
    }
  }),

  mounted () {
    this.renderChart(this.chartdata, this.options)
  }
}