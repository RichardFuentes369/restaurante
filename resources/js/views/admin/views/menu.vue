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
      <!-- <el-collapse 
        v-for="(cat, key) in category"
        :key="key"
        v-model="activeNames" 
        @change="handleChange" 
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
      </el-collapse> -->
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
                  v-model="activeNames" 
                  @change="handleChange" 
                >
                  <el-collapse-item 
                    :title="`${men.name}`" 
                    :name="`${men.id}`"
                  >
                    <template slot="title">
                      {{ men.name }} 
                      <el-popover
                        v-model="visible"
                        placement="left"
                        :title="`Agregar plato para ${men.name}`"
                        width="500"
                        trigger="click"
                        content="this is content, this is content, this is content"
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
                        <div style="text-align: right; margin: 0">
                          <el-button 
                            size="mini" 
                            type="text"
                            @click="visible = false"
                          >
                            cancel
                          </el-button>
                          <el-button 
                            type="primary" 
                            size="mini" 
                            @click="addDishe"
                          >
                            confirm
                          </el-button>
                        </div>
                        <el-button 
                          slot="reference" 
                          size="mini"
                          icon="el-icon-circle-plus" 
                          circle 
                          class="ml-2"
                        />
                      </el-popover>
                    </template>
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
      visible: false,
      activeNames: ['1'], 
      model: {
        categoria_seleccionada: '',
        plato_seleccionado: ''
      },
      value1: '',
      category: [],
      menu: [],     
    };
  },
  mounted() {
    this.listdishes()
  },
  methods: {
    loading(algo){
      this.hidden = algo
    },
    handleChange(val) {
      console.log(val);
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
    addMenu(){
      this.menu.push(this.category.find(o => o.id === this.model.categoria_seleccionada))
      this.menu.map(function(obj){
        return obj['popover'] = false
      })
    },
    addDishe(){
      console.log('añadiendo platos')
      this.visible = false
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