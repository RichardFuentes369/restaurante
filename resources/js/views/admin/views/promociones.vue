<template>
  <div class="contenido"> 
    <div class="row">
      <h2 class="title mb-3">
        Promociónes
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
    <loading 
      @mostrar="loading" 
      :time="200"
    />
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
              First
            </th>
            <th scope="col">
              Last
            </th>
            <th scope="col">
              Handle
            </th>         
            <th scope="col">
              First
            </th>
            <th scope="col">
              Last
            </th>
            <th scope="col">
              Handle
            </th>       
            <th scope="col">
              First
            </th>
            <th scope="col">
              Last
            </th>
            <th scope="col">
              Handle
            </th>
          </tr>
        </thead>
        <tbody>
          <tr 
            v-for="(promocion, key) in promociones"
            :key="key"
          >
            <th scope="row">
              1
            </th>
            <td>Mark</td>
            <td>Otto</td>
            <td>@mdo</td>
            <td>Mark</td>
            <td>Otto</td>
            <td>@mdo</td>
            <td>Mark</td>
            <td>Otto</td>
            <td>@mdo</td>
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
                Añadir Promoción
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
      route: window.location.origin+'/api/discounts/',
      promociones: [],
      model: {
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
    listarPromociones(){
      axios.get(`${this.route}discounts-list`).then(res=>{
        this.promociones = res.data
      })
    }
  }
};
</script>
<style>

</style>