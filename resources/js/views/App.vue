<template>
  <div> 
    <div id="menu" class="fixed-top">  
      <span class="navbar-brand text-white" href="#">Restaurante</span>
      <ul>
        <li>
          <router-link :to="{ name: 'bienvenidos'}" class="nav-link">Inicio</router-link>
        </li>
        <li>
          <router-link :to="{ name: 'noticias'}" class="nav-link">Anuncios</router-link>
        </li>  
      </ul>
    </div>
    <div id="content" class="col-sm-12">
      <div class="container">
        <router-view></router-view>
      </div>
    </div>
  </div>
</div>
</template>
<script>
export default {
  data() {
    return {
    };
  },
  methods: {
  }
};
</script>
<style>

</style>