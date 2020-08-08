<template>
  <div class="contenido">
    <div class="row">
      <h2 class="title mb-3">
        Mesas
      </h2> 
      <button 
        type="button" 
        class="btn btn-success btnadd ml-3 mt-1" 
        data-toggle="modal" 
        data-target=".bd-example-modal-xl" 
        circle
      >
        <i class="fa fa-plus" />
      </button>
    </div>
    <loading @mostrar="loading" :time="200" />
    <div 
      v-show="!hidden"
      class="justify-content-center table-responsive"
    >
      <table class="table table-striped">
        <thead>
          <tr>
            <th scope="col">
              #
            </th>
            <th scope="col">
              Nro_mesa
            </th>
            <th scope="col">
              Nro_sillas
            </th>
          </tr>
        </thead>
        <tbody>
          <tr 
            v-for="(mesa, key) in mesas"
            :key="key"
          >
            <th scope="row">
              {{ key+1 }}
            </th>
            <td>{{ mesa.nro_table }}</td>
            <td>{{ mesa.nro_chair }}</td>
          </tr>
        </tbody>
      </table>
    </div>
    
    <!-- Modal -->
    <div 
      class="modal fade bd-example-modal-xl" 
      tabindex="-1" 
      role="dialog" 
      aria-labelledby="myExtraLargeModalLabel" 
      aria-hidden="true"
    >
      <div 
        class="modal-dialog modal-xl" 
        role="document"
      >
        <div class="modal-content">
          <div class="modal-content">
            <div class="modal-header">
              <h5 
                id="exampleModalLabel"
                class="modal-title" 
              >
                Añadir Mesa
              </h5>
              <button 
                type="button" 
                class="close" 
                data-dismiss="modal" 
                aria-label="Close"
              >
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <el-input 
                v-model="model.nro_mesa"
                placeholder="Please input" 
                maxlength="50" 
                :disabled="true"
                show-word-limit
              >
                <template slot="prepend">
                  Nro Mesa
                </template>
              </el-input>
              <el-input 
                v-model="model.nro_silla"
                placeholder="Please input" 
                maxlength="50" 
                show-word-limit
                class="mt-2"
              >
                <template slot="prepend">
                  Nro Sillas
                </template>
              </el-input>
            </div>
            <div class="modal-footer">
              <button 
                type="button" 
                class="btn btn-secondary" 
                data-dismiss="modal"
              >
                Close
              </button>
              <button 
                type="button" 
                class="btn btn-primary"
              >
                Save changes
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
  <script>
  import { funciones } from '../../../functions/funciones_principales'
  export default {
    mixins: [funciones],
    data() {
      return {
        hidden: true,
        route: window.location.origin+'/api/tables/',
        model:{
          nro_mesa: '',
          nro_silla: ''
        },
        mesas: []
      };
    },
    mounted() {
      this.listTables()
    },
    methods: {
      loading(algo){
        this.hidden = algo
      },
      async listTables(){
        await axios.get(`${this.route}tables-list`).then(res => {
          this.mesas = res.data
        })
        if(this.mesas.length != 0){
          this.model.nro_mesa = this.mesas.length + 1
        } else {
          this.model.nro_mesa = 1
        }
      }
    }
  };
  </script>
  <style>

  </style>