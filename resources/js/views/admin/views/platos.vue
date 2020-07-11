<template>
  <div class="contenido">
    <div class="row">
      <h2 class="title mb-3">
        Platos
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
    <div class="text-center mb-3">
      <el-select 
        v-model="model.id_dishes_categoria" 
        placeholder="Select" 
        class="form-control-file"
      >
        <el-option
          v-for="item in categorias"
          :key="item.nombre"
          :label="item.nombre"
          :value="item.nombre"
        />
      </el-select>          
    </div>
    <div 
      class="row justify-content-center"
    >
      <div  
        v-for="restaurante in restaurantes"
        :key="restaurante.id" 
        class="card my-2 mx-4" 
        :style="`background-image: url(${restaurante.imagen});background-position-x: center; background-position-y: center; background-size: ${restaurante.size}; background-repeat: no-repeat; width: 18rem; height: 15rem`"
        title="click"
      >
        <div class="card-tittle text-center text-capitalize mt-2">
          <input 
            v-model="restaurante.nombre"
            class="form-control border-0 text-center" 
            :style="`text-decoration: underline overline wavy ${restaurante.color}; 
          font-family: cursive;`"
          >
        </div>
        <div class="card-body">
          <el-input
            v-model="restaurante.descripcion"
            type="textarea"
            :autosize="{ minRows: 7, maxRows: 7}"
            placeholder="Please input"
            resize="none"
          />
        </div>
        <button 
          type="button" 
          class="btn btn-danger btnadd" 
          data-toggle="modal" 
          data-target=".bd-example-modal-xl"
        >
          <i class="fa fa-trash" />
        </button>
      </div>
    </div>

    <!-- Modal -->
    <div 
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
                Añadir Platos
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
                        :min="1" 
                        :max="1000000"
                      > 
                        <template slot="prepend">
                          Price
                        </template>
                      </el-input-number>
                    </div>
                    <div class="col-sm-5 mt-2">
                      <el-select 
                        v-model="model.id_dishes_categoria" 
                        placeholder="Select" 
                        class="form-control-file"
                      >
                        <el-option
                          v-for="item in categorias"
                          :key="item.nombre"
                          :label="item.nombre"
                          :value="item.nombre"
                        />
                      </el-select>  
                    </div>
                    <div class="col-sm-5 mt-2">
                      <el-select 
                        v-model="model.tamano" 
                        placeholder="Select" 
                        class="form-control-file"
                      >
                        <el-option
                          v-for="item in tamano"
                          :key="item.nombre"
                          :label="item.nombre"
                          :value="item.nombre"
                        />
                      </el-select>  
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
                      <uploadImage :alto="200" :ancho="200" @cargarImagen="imagen" />
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
              >
                Guardar
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
      route: window.location.origin+'/api/dishes/',
      model: {
        show: false,
        id_dishes_categoria: '',
        photo: '',
        name: '',
        size: '',
        description: '',
        tamano: '',
        price: ''
      },
      categorias: [
      {
        'nombre': 'Sopas',
        'descripcion': ''
      },
      {
        'nombre': 'Entradas',
        'descripcion': ''
      },
      {
        'nombre': 'Bebidas',
        'descripcion': ''
      }
      ],          
      tamano: [
      {
        'nombre': 'Big',
        'descripcion': ''
      },
      {
        'nombre': 'Medium',
        'descripcion': ''
      },
      {
        'nombre': 'small',
        'descripcion': ''
      }
      ],
      restaurantes: [
      {
        'nombre': 'Champiñon',
        'categoria': 'Cremas',
        'descripcion': 'esta es una descripcion de la empresa que se va a generar por la pandemia del covid 19 es por ello y mucho mas que se puede percibir cosas coherentes como los que no podemos vover, arturo calle es una empresa de las cuales somos parte todos los colombianos es por ellos que los componentes de la chingada masdre es por ello que frank no me va a dar trabajo eso es por confiar en gente estupida y relativamente idiota',
        'imagen': 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRkrFHybKUNuHTYXf2q-hhoYORHF1cHVXi92Q&usqp=CAU',
        'color': '#F16868'
      },
      {
        'nombre': 'Múte',
        'categoria': 'Cremas',
        'descripcion': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestiae, recusandae similique eveniet quis. Quibusdam mollitia fugit officiis repellat, vel voluptates eaque possimus, nostrum dolore quaerat error modi soluta, perferendis! Molestiae.it. Molestiae, recusandae similique eveniet quis. Quibusdam mollitia fugit officiis repellat, vel voluptates eaque possimus, nostrum dolore quaerat error modi soluta, perferendis! Molestiae.',
        'imagen': 'https://recetasdemicolombia.com/wp-content/uploads/2020/02/mute-santandereano-500x375.jpg',
        'color': '#F16868'
      },
      {
        'nombre': 'Ajiaco',
        'categoria': 'Cremas',
        'descripcion': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestiae, recusandae similique eveniet quis. Quibusdam mollitia fugit officiis repellat, vel voluptates eaque possimus, nostrum dolore quaerat error modi soluta, perferendis! Molestiae.',
        'imagen': 'https://www.canalrcn.com/nuestra-cocina/wp-content/uploads/2020/03/ajiaco-nuestra-cocina.jpg',
        'color': '#F16868'
      },
      {
        'nombre': 'Pollo',
        'categoria': 'Carnes',
        'descripcion': '',
        'imagen': 'https://t2.rg.ltmcdn.com/es/images/8/1/2/img_caldo_de_pollo_casero_37218_600_square.jpg',
        'color': '#F16868'
      },
      {
        'nombre': 'Carne',
        'categoria': 'Carnes', 

        'descripcion': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestiae, recusandae similique eveniet quis. Quibusdam mollitia fugit officiis repellat, vel voluptates eaque possimus, nostrum dolore quaerat error modi soluta, perferendis! Molestiae.',
        'imagen': 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRZvEiPqkouueweCzF1B5ALEmVq706k7-WWqA&usqp=CAU',
        'color': '#F16868'
      },
      {
        'nombre': 'Verengena',
        'categoria': 'Ensalada',
        'descripcion': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestiae, recusandae similique eveniet quis. Quibusdam mollitia fugit officiis repellat, vel voluptates eaque possimus, nostrum dolore quaerat error modi soluta, perferendis! Molestiae.',
        'imagen': 'https://i.blogs.es/de6df6/chips-vegetales-berenjena-calabacin-zanahoria-pepino-vitonica2/450_1000.jpg',
        'color': '#F16868'
      },
      {
        'nombre': 'Patacón',
        'categoria': 'Aperitivo',
        'descripcion': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestiae, recusandae similique eveniet quis. Quibusdam mollitia fugit officiis repellat, vel voluptates eaque possimus, nostrum dolore quaerat error modi soluta, perferendis! Molestiae.',
        'imagen': 'https://i.ytimg.com/vi/Wyzz3_VAfVc/maxresdefault.jpg',
        'color': '#F16868'
      },
      ]
    };
  },
  mounted() {
  },
  methods: {
    imagen(image){
      if(image != undefined){
        this.model.photo = image
      } else {
        this.model.photo = ''        
      }
    }
  }
};
</script>
<style>

</style>