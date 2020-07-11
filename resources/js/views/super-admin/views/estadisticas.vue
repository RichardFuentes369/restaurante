<template>
  <div class="contenido"> 
    <div class="row">
      <h2 class="title mb-3">
        Estadisticas
      </h2> 
    </div>
    <div class="justify-content-center table-responsive">
      cuantos usuarios hay registrados <br>
      cuantos y cuales platos hay registrados <br>
      cuantos y cuales descuentos hay registrados <br>
      cuantas facturas totalizaron <br>
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