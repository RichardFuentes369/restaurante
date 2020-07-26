<template>
  <div class="contenido">
    <div class="row">
      <h2 class="title mb-3">
        Menú del Día
      </h2> 
      <button 
        type="button" 
        class="btn btn-success btnadd ml-3 mt-1" 
        title="Crear" 
        circle
        @click="abrirModal"
      >
        <i class="fa fa-plus" />
      </button>
    </div>
    <loading 
      :time="200"
      @mostrar="loading"
    />

    <div class="container">
      <el-collapse 
        v-for="(cat, key) in category"
        :key="key"
        v-model="collapse" 
      >
        <el-collapse-item 
          :title="`${cat.name}`" 
          :name="`${cat.id}`"
        >
          <div
            v-for="(plat, key2) in cat.misplatos"
            :key="key2"
          >
            {{ plat.name }} .... {{ plat.price }}
          </div>
        </el-collapse-item>
      </el-collapse>
    </div>

    <!-- Modal -->
    <div 
      id="registerMenu" 
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
              <div class="col-sm-12">
                <div class="row">
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
                <div class="row mt-3">
                  <div class="text-center container">
                    <div class="col-sm-12 row justify-content-center">
                      <div class="col-sm-10"> 
                        <el-select 
                          v-model="model.categoria_seleccionada" 
                          placeholder="Select" 
                          class="form-control-file"
                          @change="changeCategory"
                        >
                          <el-option
                            v-for="(cat, key1) in category"
                            :key="key1"
                            :label="cat.name"
                            :value="cat.id"
                          />
                        </el-select>                     
                      </div>
                      <div class="col-sm-2 justify-content-center">
                        <button 
                          type="button" 
                          class="btn btn-success btnadd ml-3 mt-1" 
                          data-target=".bd-example-modal-xl" 
                          circle
                          @click="addMenu"
                        >
                          <i class="fa fa-plus" />
                        </button>                    
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="modal-body">
              <div class="container">
                <el-collapse 
                  v-for="(men, key) in menu"
                  :key="key"
                  v-model="collapse" 
                >
                  <el-collapse-item 
                    :title="`${men.name}`" 
                    :name="`${men.id}`"
                  >
                    <template slot="title">
                      {{ men.name }}
                      <!--aca es donde debo controlar el open close del popovber--> 
                      <el-popover
                        placement="right"
                        :title="`Agregar plato para ${men.name}`"
                        width="500"
                        trigger="manual"
                        v-model="men.popover"
                        content="this is content, this is content, this is content"
                        @show="cleanList"
                      >
                        <el-select 
                          v-model="model.plato_seleccionado" 
                          placeholder="Select" 
                          class="form-control-file"
                          @change="changeCategory"
                        >
                          <el-option
                            v-for="(plato, key2) in men.misplatos"
                            :key="key2"
                            :label="plato.name"
                            :value="plato.id"
                          />
                        </el-select>  
                        <el-button 
                          type="secondary" 
                          size="mini" 
                          class="mt-2"
                          @click="addDishe(0, men)"
                        >
                          cancel
                        </el-button>
                        <el-button 
                          type="primary" 
                          size="mini" 
                          class="mt-2"
                          @click="addDishe(1, men)"
                        >
                          confirm
                        </el-button>
                        <el-button 
                          slot="reference" 
                          size="mini"
                          icon="el-icon-circle-plus" 
                          circle 
                          class="ml-2"
                          @click="men.popover = !men.popover"
                        />
                      </el-popover>
                    </template>
                    <ul 
                      v-for="(x, key2) in x"
                      :key="key2"
                    >
                      <li style="list-style:none">{{x.name}} ............................... {{x.price}}</li>
                    </ul>
                  </el-collapse-item>
                </el-collapse>
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
                Save changes
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
      route: window.location.origin+'/api/menu/',
      collapse: [], 
      model: {
        categoria_seleccionada: '',
        plato_seleccionado: ''
      },
      value1: '',
      category: [],
      menu: [],
      menuseleccionado: [],
      x: [
        {
          'name': 'subcate1.1',
          'price': 2500
        },
        {
          'name': 'subcate1.21',
          'price': 2500
        }
      ]     
    };
  },
  mounted() {
    this.listdishes()
  },
  methods: {
    loading(algo){
      this.hidden = algo
    },
    abrirModal(){
      this.openModal('#registerMenu')  
    },
    listdishes(){
      axios.get(`${this.route}dishes-list`).then(res => {
        this.category = res.data
      })
    },
    changeCategory(){
      // this.dishes = []
      // this.model.plato_seleccionado = ''
      // if(this.model.categoria_seleccionada != ''){
      //   this.dishes = this.category.find(o => o.id === this.model.categoria_seleccionada).misplatos 
      // } 
    },
    cleanList(){
      this.model.plato_seleccionado = ''
    },
    addMenu(){
      this.menu.push(this.category.find(o => o.id === this.model.categoria_seleccionada))
      this.menu.map(function(obj){
        return obj['popover'] = false
      })
    },
    addDishe(opcion, men){
      if(opcion === 1){
        console.log('accion de pushear a la lista')
      }
      let statusPopover = this.menu.find(obj => obj.id === men.id)
      statusPopover.popover = false
      this.collapse = []
    }
  }
};
</script>
<style>
  .inputdown{
    margin-left: 10rem !important;
    margin-top: 6rem !important;
  }
</style>