<template>
  <div>
    <nav 
      :class="`navbar-expand-lg ${diseno.clases} fixed-top mt-5`" 
      :style="`${diseno.estilos}`"
    >
      <button 
        class="navbar-toggler" 
        type="button" 
        data-toggle="collapse" 
        data-target="#navbarTogglerDemo03" 
        aria-controls="navbarTogglerDemo03" 
        aria-expanded="false" 
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon" />
      </button>
      <div 
        id="navbarTogglerDemo03" 
        class="collapse navbar-collapse"
      >
        <div 
          :class="`navbar-expand-lg 
          ${diseno.clases}`" 
          :style="`${diseno.estilos}`"
        >
          <div 
            id="navbarNav" 
            class="justify-content-center text-center mx-auto"
          >
            <ul class="navbar-nav">           
              <li class="nav-item active">
                <router-link 
                  class="nav-link" 
                  to="/a/index"
                >
                  index
                </router-link>
              </li>     
              <li class="nav-item active">
                <router-link 
                  to="/a/categoria-plato" 
                  class="nav-link"
                >
                  categoria platos
                </router-link>
              </li> 
              <li class="nav-item active">
                <router-link 
                  to="/a/platos" 
                  class="nav-link"
                >
                  platos
                </router-link>
              </li>
              <li class="nav-item active">
                <router-link 
                  to="/a/menu" 
                  class="nav-link"
                >
                  menu
                </router-link>
              </li>
              <li class="nav-item active">
                <router-link 
                  to="/a/promociones" 
                  class="nav-link"
                >
                  promociones
                </router-link>
              </li>         
              <li class="nav-item active">
                <router-link 
                  to="/a/mesas" 
                  class="nav-link"
                >
                  mesas
                </router-link>
              </li>   
              <li class="nav-item active">
                <router-link 
                  to="/a/cajeros" 
                  class="nav-link"
                >
                  cajeros
                </router-link>
              </li>   
              <li class="nav-item active">
                <router-link 
                  to="/a/cocineros" 
                  class="nav-link"
                >
                  cocineros
                </router-link>
              </li>         
              <li class="nav-item active">
                <router-link 
                  to="/a/meseros" 
                  class="nav-link"
                >
                  meseros
                </router-link>
              </li>  
              <li class="nav-item active">
                <router-link 
                  to="/logout" 
                  class="nav-link"
                >
                  salir
                </router-link>
              </li> 
            </ul>
          </div>
        </div>
      </div>
    </nav>
    <hr class="line-hr fixed-top mt-5">
    <div class="col-sm-12 row boxnametag fixed-top">
      <div class="col-xl-10 col-lg-10 col-sm-8 col-md-9" />
      <div class="col-sm col-md col-lg col-xl mt-xl-n4 mt-sm-n4 mt-n4">
        <span class="nametag text-right">
          {{ usuario_logeado.name }}
        </span>
      </div>
    </div>
    <div>
      <router-view />
    </div>
    <div class="fixed-bottom d-flex flex-row-reverse bd-highlight">
      <div class="p-2 p-2 bd-highlight">
        <botman />
      </div>
    </div>
  </div>
</template>
<style>
</style>
<script>
import { userMixins } from '../../../mixins/getuser.js'
export default {
  mixins: [userMixins],
  data() {
    return {
      usuario_logeado: '',
      diseno: {
        calses: '',
        estilos: '',
      }
    };
  },
  async mounted(){
    this.barra_estilos()
    await this.getUser()
  },
  methods: {
    barra_estilos() {
      this.diseno.clases = "navbar-light";
      this.diseno.estilos = "background-color: #e3f2fd";
    }
  }
};
</script>