<template>
  <div class="small">
    <pie :chart-data="datacollection" />
  </div>
</template>

<script>
  import Pie from '../../../charts/Pie.js'
  export default {
    components: {
      Pie
    },
    data () {
      return {
        datacollection: null
      }
    },
    mounted () {
      this.fillData()
    },
    methods: {
      fillData () {
        this.datacollection = {
          labels: [this.getRandomInt(), this.getRandomInt()],
          datasets: [
            {
              label: 'Data One',
              backgroundColor: '#3FFB14',
              data: [this.getRandomInt(), this.getRandomInt()]
            }, {
              label: 'Data two',
              backgroundColor: '#2607E5',
              data: [this.getRandomInt(), this.getRandomInt()]
            }
          ]
        }
      },
      getRandomInt () {
        return Math.floor(Math.random() * (50 - 5 + 1)) + 5
      }
    }
  };
</script>

<style>
  .small {
    max-width: 600px;
    margin:  150px auto;
  }
</style>