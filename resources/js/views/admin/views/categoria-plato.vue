<template>
  <div class="contenido">
    <div class="row">
      <h2 class="title mb-3">Categoria de platos</h2> 
      <button 
        type="button" 
        class="btn btn-success btnadd ml-3 mt-1" 
        data-toggle="modal" 
        data-target=".bd-example-modal-xl" 
        circle 
        @click="abrirModal"
      >
        <i class="fa fa-plus" />
      </button>
    </div>
    <div class="row justify-content-center">
      <div 
        v-for="categoria in categoria_platos" 
        :key="categoria.id"
        title="click"
        class="card my-2 mx-4" 
        :style="`background-image: url(${categoria.photo});background-position-x: center; background-position-y: center; background-repeat: no-repeat; width: 18rem; height: 15rem`"
      >
        <div class="card-tittle text-center text-capitalize mt-2">
          <input
            v-model="categoria.name"
            class="form-control border-0 text-center" 
            :style="`text-decoration: underline overline wavy ${categoria.color}; font-family: cursive;`"
          >
        </div>
        <div class="card-body">
          <el-input
            v-model="categoria.description" 
            type="textarea"
            :autosize="{ minRows: 7, maxRows: 7}"
            placeholder="Please input"
            resize="none"
          />
        </div>
        <button 
          type="button" 
          class="btn btn-danger btnadd" 
          title="Eliminar" 
          @click="eliminar(categoria)"
        >
          <i class="fa fa-trash" />
        </button>
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
                Añadir Categoria de Platos
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
                  <div class="text-center">
                    <el-switch v-model="model.show" />
                  </div>
                  <div class="row">
                    <div 
                      v-show="model.show != false" 
                      class="col-sm-6 text-center"
                    >
                      <uploadImage />
                    </div>
                    <div class="col-sm-6 text-center">
                      <el-color-picker v-model="model.color" />
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
                      type="button" 
                      class="btn btn-primary" 
                      @click="guardarCategoria"
                    >
                      Guardar
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
export default {
  data() {
    return {
      route: window.location.origin+'/api/dishes_category/',
      model: {
        show: true,
        photo: '',
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
    abrirModal(){
      $('#registerDishesCategory').modal('show')
    },
    listDishesCategory(){
      this.categoria_platos = []
      axios.get(`${this.route}dishes-category-list`).then(res => {
        this.categoria_platos = res.data
      })
    },
    async guardarCategoria(){
      if (this.model.name != '' && this.model.description != ''){
        await axios.post(`${this.route}dishes-category-register`, this.model)
        $('#registerDishesCategory').modal('hide')
        this.listDishesCategory()
        this.$notify({
          title: 'Success',
          message: 'Categoria de plato creada exitosamente',
          type: 'success'
        });
      } else {
        this.$notify.error({
          message: 'Algunos campos no pueden ir vacios',
        });
      }
    },
    eliminar(categoria){
      this.$confirm('Esta seguro que desea eliminar esta categoria?', 'Warning', {
        confirmButtonText: 'Eliminar',
        cancelButtonText: 'Cancelar',
        type: 'warning'
      }).then(() => {
        axios.delete(`${this.route}${categoria.id}/dishes-category-delete`)
        this.$message({
          type: 'success',
          message: 'Eliminación completada'
        });
        this.listDishesCategory()
      }).catch(() => {
        this.$message({
          type: 'info',
          message: 'Eliminación cancelada'
        });          
      });
    }
  }
};
</script>
<style>

</style>