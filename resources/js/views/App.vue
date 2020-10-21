<template>
  <div> 
    <div 
    id="menu" 
    class="fixed-top"
    >  
    <span 
    class="navbar-brand text-white" 
    href="#"
    >
    Restaurante
  </span>
  <ul>
    <!-- <li v-if="usuario_logeado == ''"> -->
      <li v-if="$route.meta.requiresAuth == false">
        <router-link :to="{ name: 'bienvenidos'}" class="nav-link">
          Inicio
        </router-link>
      </li>
      <li v-else>
        <router-link 
        :to="{ name: 'role'}" 
        class="nav-link"
        >
        Rol
      </router-link>
    </li>
    <li v-if="$route.meta.requiresAuth == false">
      <router-link 
      :to="{ name: 'noticias'}" 
      class="nav-link"
      >
      Anuncios
    </router-link>
  </li>  
</ul>
</div>
<div 
id="content" 
class="col-sm-12"
>
<router-view />
</div>
</div>
</template>
<script>
  import { userMixins } from '../mixins/getuser.js'
  export default {
    mixins: [userMixins],
    data() {
      return {
        usuario_logeado: ''
      };
    },
    mounted() {
      this.getUser()
    }
  };
</script>
<style>

</style>