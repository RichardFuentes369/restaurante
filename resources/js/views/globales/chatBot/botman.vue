<template>
  <div>
    <button class="btn bg-primary text-white" v-show="mostrar == false" @click="abrirChat(1)">Abrir chat</button>

    <div>
      <div class="row d-flex flex-row-reverse bd-highlight">
        <div class="p-2 bd-highlight">
          <button class="btn bg-primary text-white" v-show="mostrar != false" @click="abrirChat(0)">Cerrar Chat</button>
        </div>
      </div>
      <botman-tinker v-show="mostrar == true" id="botmanWidget" api-endpoint="/botman" class="botmanSettings" />
    </div>
  </div>
</template>

<script>
  export default {
    data() {
      return {
        mostrar: false
      }
    },
    mounted() {
    },
    methods: {
      abrirChat(opcion){
        if(opcion == 1){
          this.mostrar = true
        }else{
          this.mostrar = false
        }
      }
    }
  };
</script>

<style>
.botmanSettings .ChatLog {
  max-height: 14rem;
  margin-left: 7rem !important;
  padding: 0 !important;
  overflow-y: scroll;
  background-color: seashell;
  border-radius: 1rem;
}

.botmanSettings .ChatInput {
  background-color: gainsboro;
  color: black;
}
</style>