<template>
  <div class="contenido">
    <div class="row">
      <h2 class="title mb-3">
        Mesas
      </h2> 
      <button 
        type="button" 
        class="btn btn-success btnadd ml-3 mt-1" 
        title="Crear" 
        @click="abrirModal"
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
            <th 
              scope="col" 
              class="text-center"
            >
              #
            </th>
            <th 
              scope="col" 
              class="text-center"
            >
              Nro_mesa
            </th>
            <th 
              scope="col" 
              class="text-center"
            >
              Nro_sillas
            </th>
            <th 
              scope="col" 
              class="text-center"
            >
              Eliminar
            </th>
          </tr>
        </thead>
        <tbody>
          <tr 
            v-for="(mesa, key) in mesas"
            :key="key"
          >
            <th 
              scope="row" 
              class="text-center"
            >
              {{ key+1 }}
            </th>
            <td class="text-center">
              {{ mesa.nro_table }}
            </td>
            <td class="text-center">
              <el-tooltip 
                class="item" 
                effect="dark" 
                content="Click para editar" 
                placement="top"
              >
                <input 
                  class="text-center form-control form-control-plaintext alert-link"
                  :value="`${mesa.nro_chair}`"
                  @change="actualizarMesa(mesa)"
                />
              </el-tooltip>
            </td>
            <td class="text-center">
              <button class="btn btnadd btn-danger m-0" @click="eliminarMesa(mesa)">
                <i class="fa fa-trash" />
              </button>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    
    <!-- Modal -->
    <div 
      id="resgisterTable" 
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
                v-model="model.nro_chair"
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
                @click="guardarMesa"
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
          nro_chair: ''
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
      limpiar(){
        this.model.nro_silla = ''
      },
      abrirModal(){
        this.limpiar()
        this.openModal('#resgisterTable')  
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
      },
      async guardarMesa(){
        await axios.post(`${this.route}table-register`, this.model)
        this.closeModal('#resgisterTable')  
        this.notify(1, 'Success', 'Mesa creada con exito', 'success')
        this.listTables()
      },
      async actualizarMesa(mesa){
        console.log(this.model)
        await axios.put(`${this.route}table-update`, this.model)
        this.notify(1, 'Success', 'Mesa actualizada con exito', 'success')
        this.listTables()
      },
      async eliminarMesa(mesa){
        this.$confirm('Esta seguro que desea eliminar esta mesa?', 'Warning', {
          confirmButtonText: 'Eliminar',
          cancelButtonText: 'Cancelar',
          type: 'warning'
        }).then(async () => {
          await axios.delete(`${this.route}${mesa.id}/table-delete`)
          this.notify(2, '', 'Se elimino la mesa con exito', '')
          await this.listTables()
        }).catch(() => {
          this.message(1, 'Eliminación cancelada', 'info')         
        });
      }
    }
  };
  </script>
  <style>

  </style>