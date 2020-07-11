<template>
  <div>
    <div class="col-sm-12 row">
      <div class="col-sm-8">
        <Informacion />
      </div>
      <div class="col-sm-4">
        <Login />
      </div>
    </div>
  </div>
</template>
<script>
import { funciones } from '../../../functions/funciones_principales'
export default {
  mixins: [funciones],

};
</script>