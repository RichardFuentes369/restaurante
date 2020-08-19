<template>
  <div class="small">
    <bar :chart-data="datacollection" />
  </div>
</template>

<script>
import Bar from '../../../charts/Bar.js'
export default {
  components: {
    Bar
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
        labels: ['January', 'February', 'March'],
        datasets: [
        {
          label: 'Data One',
          backgroundColor: '#f87979',
          data: [4, 20, 30]
        },        {
          label: 'Data two',
          backgroundColor: '#938A8A',
          data: [4, 20, 30]
        },        {
          label: 'Data Three',
          backgroundColor: '#230E0E',
          data: [4, 20, 30]
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