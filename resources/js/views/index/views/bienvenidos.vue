<template>
  <div>
    <div class="col-sm-12 row">
      <div class="col-sm-8">
        <Informacion />
      </div>
      <div class="col-sm-4">
        <Login />
      </div>


      <botman-tinker api-endpoint="/botman" user-id="my-custom-user-id" style="background-color: gray;border-color: blue;border-radius: 1rem;padding: 1%;" />
    </div>
  </div>
</template>
<script>
  import { funciones } from '../../../functions/funciones_principales'
  export default {
    mixins: [funciones],

  };
</script>