<template>
  <div class="contenido"> 
    <div class="row">
      <h2 class="title mb-3">
        Estadisticas
      </h2> 
    </div>
    <div class="justify-content-center table-responsive">
      <gralinea />
      <grabarras />
      <grapie />
      <graradar />
    </div>
  </div>
</template>
<script>
import { funciones } from '../../../functions/funciones_principales'
export default {
  mixins: [funciones],
  data() {
    return {
    };
  },
  mounted() {
  },
  methods: {
  }
};
</script>
<style>
</style>