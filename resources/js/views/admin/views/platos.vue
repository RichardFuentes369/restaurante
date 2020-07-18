<template>
  <div class="contenido">
    <div class="row">
      <h2 class="title mb-3">
        Platos
      </h2> 
      <button 
        type="button" 
        class="btn btn-success btnadd ml-3 mt-1" 
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
    <div class="text-center mb-3">
      <el-select 
        v-model="id_dishes_categoria" 
        placeholder="Select" 
        class="form-control-file"
      >
        <el-option
          v-for="categoria in categorias"
          :key="categoria.id"
          :label="categoria.name"
          :value="categoria.id"
        />
      </el-select>          
    </div>
    <div 
      v-show="!hidden" 
      class="row justify-content-center"
    >
      <div 
        v-for="dishe in dishes" 
        :key="dishe.id"
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
                v-model="dishe.name"
                class="form-control border-0 text-center bg-transparent" 
                :style="`text-decoration: underline overline wavy ${dishe.color}; font-family: cursive;`"
                @change="actualizar(dishe)"
              >
            </el-tooltip>
          </div>
        </div>
        <div
          v-if="dishe.photo != null"
          class="card-body"
          :style="`background-image: url(/images/dishesCategory/${dishe.photo});background-position-x: center; background-position-y: center; background-repeat: no-repeat; width: 18rem; height: 15rem;`" 
        > 
          <button 
            type="button" 
            class="btn btn-warning mt-4 btnadd btn-position-accion" 
            title="Actualizar" 
            @click="abrirModal(dishe)"
          >
            <i class="fa fa-pen" />
          </button>  
          <button 
            type="button" 
            class="btn btn-danger mt-4 btnadd btn-position-accion" 
            title="Eliminar" 
            @click="eliminar(dishe)"
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
            class="btn btn-warning mt-4 btnadd btn-position-accion" 
            title="Actualizar" 
            @click="abrirModal(dishe)"
          >
            <i class="fa fa-pen" />
          </button>      
          <button 
            type="button" 
            class="btn btn-danger mt-4 btnadd btn-position-accion" 
            title="Eliminar" 
            @click="eliminar(dishe)"
          >
            <i class="fa fa-trash" />
          </button>
        </div>
        <div class="card-footer">
          <el-input
            v-model="dishe.description" 
            type="textarea"
            :autosize="{ minRows: 1, maxRows: 3}"
            placeholder="Please input"
            resize="none"
            @change="actualizar(dishe)"
          />
        </div>
      </div>
    </div>


    <!-- Modal -->
    <div 
      id="redisterDishes" 
      class="modal fade bd-example-modal-xl " 
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
                {{ model.titulo }}
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
              <div class="row">
                <div class="col-sm-12">
                  <div class="mt-3">
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
                </div>  
                <div class="col-sm-12 mt-2">
                  <div class="row">
                    <div class="col-sm-2 text-center mt-2">
                      <el-input-number 
                        v-model="model.price" 
                        placeholder="price" 
                        :min="1" 
                        :max="1000000"
                      > 
                        <template slot="prepend">
                          Price
                        </template>
                      </el-input-number>
                    </div>
                    <div class="col-sm-5 mt-2">
                      <el-tooltip class="item" effect="light" content="Category dishe" placement="bottom">
                        <el-select 
                          v-model="model.mid_dishes_categoria" 
                          placeholder="Select" 
                          class="form-control-file"
                        >
                          <el-option
                            v-for="categoria in categorias"
                            :key="categoria.id"
                            :label="categoria.name"
                            :value="categoria.id"
                          />
                        </el-select>  
                      </el-tooltip>
                    </div>
                    <div class="col-sm-5 mt-2">
                      <el-tooltip class="item" effect="light" content="Size" placement="bottom">
                        <el-select 
                          v-model="model.size" 
                          placeholder="Select" 
                          class="form-control-file"
                        >
                          <el-option
                            v-for="item in sizes"
                            :key="item.value"
                            :label="item.label"
                            :value="item.value"
                          />
                        </el-select>  
                      </el-tooltip>
                    </div>
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
                        :alto="200" 
                        :ancho="200" 
                        @cargarImagen="imagen" 
                      />
                    </div>
                  </div>
                </div>
                <div class="col-sm-12 mt-2">
                  <el-input
                    v-model="model.description"
                    type="textarea"
                    :autosize="{ minRows: 7, maxRows: 7}"
                    placeholder="Please input"
                    resize="none"
                  />
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
                @click="guardarPlato"
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
      hidden: true,
      route: window.location.origin+'/api/dishes/',
      id_dishes_categoria: '',
      model: {
        show: false,
        mid_dishes_categoria: '',
        photo: '',
        name: '',
        size: '',
        description: '',
        price: ''
      }, 
      sizes:[
        {
          'label': 'Big',
          'value': 'big'
        },
        {
          'label': 'Median',
          'value': 'median' 
        },
        {

          'label': 'Samll',
          'value': 'small'
        }
      ],
      categorias: [],
      dishes: [],
      clon: []
    };
  },
  watch: {
    id_dishes_categoria: function (val) {
      if(this.clon != ''){   
        this.dishes = this.clon
        let filtro = this.dishes.filter(obj => obj.id_dishes_category === val) 
        this.dishes = []     
        for (const fil of filtro) {
          this.dishes.push(fil)
        }    
      }else{   
        this.clon = [...this.dishes]
        let filtro = this.dishes.filter(obj => obj.id_dishes_category === val) 
        this.dishes = []     
        for (const fil of filtro) {
          this.dishes.push(fil)
        }   
      }
    }
  },
  mounted() {
    this.listdishes()
  },
  methods: {
    loading(algo){
      this.hidden = algo
    },
    limpiar(){'',
      this.model = {
        show: false,
        mid_dishes_categoria: '',
        photo: '/images/noImagen/nodisponible.png',
        name: '',
        size: '',
        description: '',
        price: ''
      }
    },
    abrirModal(plato){
      this.limpiar()
      if(plato != 1){
        this.model = {
          titulo: 'Editando el plato',
          boton: 'Editar',
          id: plato.id,
          show: plato.photo != null ? true : false,
          name: plato.name,
          description: plato.description,
          photo: plato.photo
        }
      } else {
        this.model = {
          titulo: 'Creando un nuevo plato',
          boton: 'Crear',
          show: false,
          id: '', 
          name: '',
          description: ''
        }
      }
      this.openModal('#redisterDishes')  
    },
    imagen(image){
      if(image != undefined){
        this.model.photo = image
      } else {
        this.model.photo = ''        
      }
    },
    listdishes(){
      this.charge(200)
      this.categorias = []
      axios.get(`${this.route}dishes-list`).then(res => {
        this.categorias = res.data
        for (var i = 0 ; i < this.categorias.length; i++) {
          let platos = this.categorias[i].misplatos
          for (const plato of platos) {
            this.dishes.push(plato)
          }
        }
      })
    },
    async guardarPlato(){
      if (this.model.mid_dishes_categoria != '' && this.model.name != '' && this.model.description != ''){
        await axios.post(`${this.route}dishes-register`, this.model)
        this.closeModal('#redisterDishes')
        await this.listdishes()
        this.notify(1, 'Success', 'Plato creado exitosamente', 'success')
      } else {
        this.notify(2, '', 'Algunos campos no pueden ir vacios', '')
      }
    }
  }
};
</script>
<style>

</style>