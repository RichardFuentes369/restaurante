<template>
  <div>
    <div class="col-sm-12 row">
      <div class="col-sm-8">
        <Informacion />
      </div>
      <div class="col-sm-4">
        <Login />
      </div>
      <div class="fixed-bottom d-flex flex-row-reverse bd-highlight">
        <div class="p-2 p-2 bd-highlight">
          <botman />
        </div>
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