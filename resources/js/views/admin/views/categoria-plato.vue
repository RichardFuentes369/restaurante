<template>
  <div class="contenido">
    <div class="row">
      <h2 class="title mb-3">
        Categoria de platos
      </h2> 
      <button 
        type="button" 
        class="bg-success border-0 text-white btnadd ml-3 mt-1" 
        title="Crear" 
        @click="abrirModal(1)"
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
      class="row justify-content-center"
    >
      <div 
        v-for="categoria in categoria_platos" 
        :key="categoria.id"
        class="card my-2 mx-4" 
      >
        <div class="card-header p-0">
          <div class="card-tittle text-center text-capitalize mt-2">
            <el-tooltip 
              class="item" 
              effect="dark" 
              content="Click para editar" 
              placement="top"
            >
              <input
                v-model="categoria.name"
                class="form-control border-0 text-center bg-transparent" 
                :style="`text-decoration: underline overline wavy ${categoria.color}; font-family: cursive;`"
                @change="actualizar(categoria)"
              >
            </el-tooltip>
          </div>
        </div>
        <div
          v-if="categoria.photo != null"
          class="card-body"
          :style="`background-image: url(/images/dishesCategory/${categoria.photo});background-position-x: center; background-position-y: center; background-repeat: no-repeat; width: 18rem; height: 15rem;`" 
        > 
          <button 
            type="button" 
            class="bg-warning border-0 text-white mt-4 btnadd btn-position-accion" 
            title="Actualizar" 
            @click="abrirModal(categoria)"
          >
            <i class="fa fa-pen" />
          </button>  
          <button 
            type="button" 
            class="bg-danger border-0 text-white mt-4 btnadd btn-position-accion" 
            title="Eliminar" 
            @click="eliminar(categoria)"
          >
            <i class="fa fa-trash" />
          </button>
        </div>       
        <div
          v-else=""
          class="card-body"
          :style="`background-image: url(/images/noImagen/nodisponible.png);background-position-x: center; background-position-y: center; background-repeat: no-repeat; width: 18rem; height: 15rem`" 
        > 
          <button 
            type="button" 
            class="bg-warning border-0 text-white mt-4 btnadd btn-position-accion" 
            title="Actualizar" 
            @click="abrirModal(categoria)"
          >
            <i class="fa fa-pen" />
          </button>      
          <button 
            type="button" 
            class="bg-danger border-0 text-white mt-4 btnadd btn-position-accion" 
            title="Eliminar" 
            @click="eliminar(categoria)"
          >
            <i class="fa fa-trash" />
          </button>
        </div>
        <div class="card-footer">
          <el-input
            v-model="categoria.description" 
            type="textarea"
            :autosize="{ minRows: 1, maxRows: 3}"
            placeholder="Please input"
            resize="none"
            @change="actualizar(categoria)"
          />
        </div>
      </div>
    </div>

    <!-- Modal -->
    <div 
      id="registerDishesCategory" 
      class="modal fade bd-example-modal-xl" 
      tabindex="-1" 
      role="dialog" 
      aria-labelledby="myExtraLargeModalLabel" 
      aria-hidden="true"
    >
      <div 
        class="modal-dialog modal-dialog-scrollable modal-xl" 
        role="document"
      >
        <div class="modal-content">
          <div class="modal-content">
            <div class="modal-header">
              <h5
                id="exampleModalLabel" 
                class="modal-title"
              >
                {{
                  model.titulo
                }}
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
            <div class="col-sm-12">
              <div class="row">
                <div class="col-sm-12 row">
                  <div class="mt-3 col-sm-11">
                    <el-input 
                      v-model="model.name"
                      placeholder="Please input" 
                      maxlength="50" 
                      show-word-limit
                    >
                      <template slot="prepend">
                        Name
                      </template>
                    </el-input>
                  </div>
                  <div class="mt-3 col-sm-1 text-center">
                    <el-color-picker v-model="model.color" />
                  </div>
                </div>
                <div class="col-sm-12 mt-2 mb-2">
                  <div class="text-center mb-2">
                    <el-switch 
                      v-model="model.show"
                      class="text-center" 
                    />
                  </div>
                  <div class="text-center">
                    <div 
                      v-if="model.show != false" 
                      class="text-center"
                    >
                      <uploadImage 
                        v-if="model.photo != null"
                        :alto="200" 
                        :ancho="200" 
                        :imagen="`/images/dishesCategory/${model.photo}`"
                        @cargarImagen="imagen" 
                      />
                      <uploadImage 
                        v-else
                        :alto="200" 
                        :ancho="200" 
                        @cargarImagen="imagen" 
                      />
                    </div>
                  </div>
                </div>
                <div class="col-sm-12">
                  <el-input
                    v-model="model.description"
                    type="textarea"
                    :autosize="{ minRows: 7, maxRows: 7}"
                    placeholder="Please input"
                    resize="none"
                  />
                  <div class="modal-footer">
                    <button 
                      type="button"
                      class="btn btn-secondary" 
                      data-dismiss="modal"
                    >
                      Close
                    </button>
                    <button 
                      v-if="model.boton == 'Crear' "
                      type="button" 
                      class="btn btn-primary" 
                      @click="guardarCategoria"
                    >
                      {{
                        model.boton
                      }}
                    </button>
                    <button 
                      v-else
                      type="button" 
                      class="btn btn-primary" 
                      @click="actualizarpomodal"
                    >
                      {{
                        model.boton
                      }}
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<style>
.btn-danger {
  margin-left: 17rem;
  margin-bottom: 6rem
}
</style>
<script>
import { funciones } from '../../../functions/funciones_principales'
export default {
  mixins: [funciones],
  data() {
    return {
      route: window.location.origin+'/api/dishes_category/',
      hidden: true,
      model: {
        titulo: '',
        boton: '',
        id: '',
        photo: '/images/noImagen/nodisponible.png',
        name: '',
        description: '',
        color: '#DD2929'
      },
      categoria_platos: []
    };
  },
  mounted() {
    this.listDishesCategory()
  },
  methods: {
    loading(algo){
      this.hidden = algo
    },
    limpiar(){
      this.model = {
        titulo: '',
        boton: '',
        id: '',
        show: false,
        photo: '/images/noImagen/nodisponible.png',
        name: '',
        description: '',
        color: '#DD2929'
      }
    },
    abrirModal(categoria){
      this.limpiar()
      console.log(categoria)
      if(categoria != 1){
        this.model = {
          titulo: 'Editando la categoria',
          boton: 'Editar',
          id: categoria.id,
          show: categoria.photo != null ? true : false,
          name: categoria.name,
          description: categoria.description,
          photo: categoria.photo,
          color: categoria.color
        }
      } else {
        this.model = {
          titulo: 'Creando una nueva categoria',
          boton: 'Crear',
          show: false,
          color: '#DD2929',
          id: '', 
          name: '',
          description: ''
        }
      }
      this.openModal('#registerDishesCategory')  
    },
    listDishesCategory(){
      this.charge(200)
      this.categoria_platos = []
      axios.get(`${this.route}dishes-category-list`).then(res => {
        this.categoria_platos = res.data
      })
    },
    imagen(image){
      if(image != undefined){
        this.model.photo = image
      } else {
        this.model.photo = ''        
      }
    },
    async guardarCategoria(){
      if (this.model.name != '' && this.model.description != ''){
        await axios.post(`${this.route}dishes-category-register`, this.model)
        this.closeModal('#registerDishesCategory')
        await this.listDishesCategory()
        this.notify(1, 'Success', 'Categoria de plato creada exitosamente', 'success')
      } else {
        this.notify(2, '', 'Algunos campos no pueden ir vacios', '')
      }
    },
    async actualizar(categoria) {
      if (categoria.name != '' && categoria.description != ''){
        await axios.put(`${this.route}dishes-category-update`, categoria)
        await this.listDishesCategory()
        this.notify(1, 'Success', 'Categoria de plato actualizada exitosamente', 'success')
      } else {
        await this.listDishesCategory()
        this.notify(2, '', 'Algunos campos no pueden ir vacios', '')
      }
    },    
    async actualizarpomodal() {
      if (this.model.name != '' && this.model.description != ''){
        await axios.put(`${this.route}dishes-category-update`, this.model)
        this.closeModal('#registerDishesCategory')
        await this.listDishesCategory()
        this.notify(1, 'Success', 'Categoria de plato actualizada exitosamente', 'success')
      } else {
        this.notify(2, '', 'Algunos campos no pueden ir vacios', '')
      }
    },
    eliminar(categoria){
      this.$confirm('Esta seguro que desea eliminar esta categoria?', 'Warning', {
        confirmButtonText: 'Eliminar',
        cancelButtonText: 'Cancelar',
        type: 'warning'
      }).then(async () => {
        await axios.delete(`${this.route}${categoria.id}/dishes-category-delete`)
        this.notify(2, '', 'Se elimino la categoria con exito', '')
        await this.listDishesCategory()
      }).catch(() => {
        this.message(1, 'Eliminación cancelada', 'info')         
      });
    }
  }
};
</script>
<style>

</style>