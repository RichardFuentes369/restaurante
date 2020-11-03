<template>
  <div class="contenido"> 
    <div class="row">
      <h2 class="title mb-3">
        Promociónes
      </h2> 
      <button
        type="button" 
        class="bg-success border-0 text-white btnadd ml-3 mt-1" 
        title="Crear" 
        @click="abrirModal" 
      >
        <i class="fa fa-plus" />
      </button>
    </div>
    <loading 
      :time="200" 
      @mostrar="loading" 
    />
    <div 
      v-show="!hidden"
      class="justify-content-center table-responsive"
    >
      <table 
        class="table table-striped"
      >
        <thead>
          <tr>
            <th scope="col">
              #
            </th>
            <th 
              scope="col" 
              class="text-center"
            >
              Nombre
            </th>
            <th 
              scope="col" 
              class="text-center"
            >
              Descripción
            </th>
            <th 
              scope="col" 
              class="text-center"
            >
              Porcentaje (%)
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
            v-for="(promocion, key) in promociones"
            :key="key"
          >
            <th scope="row">
              {{ key + 1 }}
            </th>
            <td>
              <el-tooltip 
                class="item" 
                effect="dark" 
                content="Click para editar" 
                placement="top"
              >
                <el-input 
                  v-model="promocion.description"
                  @change="actualizar(promocion)"
                />
              </el-tooltip>
            </td>
            <td>
              <el-tooltip 
                class="item" 
                effect="dark" 
                content="Click para editar" 
                placement="top"
              >
                <el-input   
                  v-model="promocion.name"
                  @change="actualizar(promocion)"
                />
              </el-tooltip>
            </td>
            <td>
              <el-tooltip 
                class="item" 
                effect="dark" 
                content="Click para editar" 
                placement="top"
              >
                <el-input 
                  v-model="promocion.porcentage"
                  type="number"
                  min="0"
                  max="100"
                  @change="actualizar(promocion)"
                >
                  <template slot="append">
                    %
                  </template>
                </el-input>
              </el-tooltip>
            </td>
            <td class="text-center">
              <button 
                type="button" 
                class="bg-danger border-0 text-white m-0 btnadd btn-position-accion" 
                title="Eliminar" 
                @click="eliminar(promocion)"
              >
                <i class="fa fa-trash" />
              </button>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    <!-- Modal -->
    <div 
      id="registerDiscount" 
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
                {{ model.title }}
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
              <div class="col-sm-12">
                <div class="row">
                  <el-input 
                    v-model="model.name"
                    class="mt-2"
                    placeholder="Please input" 
                    maxlength="50" 
                    show-word-limit
                  >
                    <template slot="prepend">
                      Nombre
                    </template>
                  </el-input>
                  <el-input
                    v-model="model.description"
                    class="mt-2"
                    type="textarea"
                    :autosize="{ minRows: 7, maxRows: 7}"
                    placeholder="Please input"
                    resize="none"
                    maxlength="50" 
                  >
                    <template slot="prepend">
                      Descripcion
                    </template>
                  </el-input>
                  <div class="col-sm-12">
                    <el-slider
                      v-model="model.porcentaje"
                      show-input
                    />
                  </div>
                </div>
              </div>
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
                @click="guardarPromocion"
              >
                {{ model.boton }}
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
      route: window.location.origin+'/api/discounts/',
      promociones: [],
      model: {
        title: '',
        boton: '',
        name: '',
        description: '',
        porcentaje: 0
      }
    };
  },
  mounted() {
    this.listarPromociones()
  },
  methods: {   
    loading(algo){
      this.hidden = algo
    },
    limpiar(){
      this.model = {
        title: '',
        boton: '',
        name: '',
        description: '',
        porcentaje: 0
      }
    },
    listarPromociones(){
      axios.get(`${this.route}discounts-list`).then(res=>{
        this.promociones = res.data
      })
    },
    abrirModal(){
      this.limpiar()
      this.model = {
        title: 'Crear promoción',
        boton: 'Guardar',
        name: '',
        description: '',
        porcentaje: 0
      }
      this.openModal('#registerDiscount')  
    },
    async guardarPromocion(){
      if(this.model.name != '' && this.model.description != '' && this.model.porcentaje >= 0){
        await axios.post(`${this.route}discounts-register`, this.model)
        this.closeModal('#registerDiscount')
        await this.listarPromociones()
        this.notify(1,'Success', 'Promoción creada exitosamente', 'success')
      }else{
        this.notify(2,'','Algunos campos no pueden ir vacios', '')
      }
    },
    async actualizar(promocion){
      if(promocion.name != '' && promocion.description != '' && promocion.porcentage >= 0 && promocion.porcentage <= 100){
        this.notify(1,'Success', 'Promoción actualizada exitosamente', 'success')
        await axios.put(`${this.route}discounts-update`, promocion)
        this.listarPromociones()
      }else{
        this.notify(2, '', 'Algunos campos no pueden ir vacios', '')
        this.listarPromociones()
      }
    },
    eliminar(promocion){
      this.$confirm('Esta seguro que desea eliminar esta promoción?', 'Warning', {
        confirmButtonText: 'Eliminar',
        cancelButtonText: 'Cancelar',
        type: 'warning'
      }).then(async () => {
        await axios.delete(`${this.route}${promocion.id}/discounts-delete`)
        this.notify(2, '', 'Se elimino la categoria con exito', '')
        await this.listarPromociones()
      }).catch(() => {
        this.message(1, 'Eliminación cancelada', 'info')         
      });
    }
  }
};
</script>
<style>

</style>