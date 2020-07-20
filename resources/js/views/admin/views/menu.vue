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

    <div  v-for="(varcategory, key) in category"
      v-show="!hidden" class="accordion" id="accordionExample">
      <div class="card">
        <div class="card-header" id="headingOne">
          <h2 class="mb-0">
            <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" :data-target="`#${varcategory.dataTarget}`" :aria-expanded="`${varcategory.ariaExpanded}`" :aria-controls="`${varcategory.dataTarget}`">
              {{varcategory.name}}
            </button>
          </h2>
        </div>

        <div :id="`${varcategory.dataTarget}`" :class="`collapse #${varcategory.show}`" aria-labelledby="headingOne" data-parent="#accordionExample">
          <div class="card-body" v-for="(dishe, key2) in plato"
              :key="key2">
              {{dishe.name}} ... {{dishe.price}}
          </div>
        </div>
      </div>
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
                      <div class="col-sm-5"> 
                        <el-select v-model="value1" placeholder="Select" class="form-control-file">
                          <el-option
                            v-for="item in options"
                            :key="item.value"
                            :label="item.label"
                            :value="item.value"
                          />
                        </el-select>                     
                      </div>
                      <div class="col-sm-5">
                        <el-select v-model="value1" placeholder="Select" class="form-control-file">
                          <el-option
                            v-for="item in options"
                            :key="item.value"
                            :label="item.label"
                            :value="item.value"
                          />
                        </el-select>                      
                      </div>
                      <div class="col-sm-2 justify-content-center">
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
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="modal-body">
              <table class="table">
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
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <th scope="row">
                      1
                    </th>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                  </tr>
                  <tr>
                    <th scope="row">
                      2
                    </th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                  </tr>
                  <tr>
                    <th scope="row">
                      3
                    </th>
                    <td>Larry</td>
                    <td>the Bird</td>
                    <td>@twitter</td>
                  </tr>
                  <tr>
                    <th scope="row">
                      3
                    </th>
                    <td>Larry</td>
                    <td>the Bird</td>
                    <td>@twitter</td>
                  </tr>
                  <tr>
                    <th scope="row">
                      3
                    </th>
                    <td>Larry</td>
                    <td>the Bird</td>
                    <td>@twitter</td>
                  </tr>
                  <tr>
                    <th scope="row">
                      3
                    </th>
                    <td>Larry</td>
                    <td>the Bird</td>
                    <td>@twitter</td>
                  </tr>
                  <tr>
                    <th scope="row">
                      3
                    </th>
                    <td>Larry</td>
                    <td>the Bird</td>
                    <td>@twitter</td>
                  </tr>
                  <tr>
                    <th scope="row">
                      3
                    </th>
                    <td>Larry</td>
                    <td>the Bird</td>
                    <td>@twitter</td>
                  </tr>
                  <tr>
                    <th scope="row">
                      3
                    </th>
                    <td>Larry</td>
                    <td>the Bird</td>
                    <td>@twitter</td>
                  </tr>
                  <tr>
                    <th scope="row">
                      3
                    </th>
                    <td>Larry</td>
                    <td>the Bird</td>
                    <td>@twitter</td>
                  </tr>
                  <tr>
                    <th scope="row">
                      3
                    </th>
                    <td>Larry</td>
                    <td>the Bird</td>
                    <td>@twitter</td>
                  </tr>
                  <tr>
                    <th scope="row">
                      3
                    </th>
                    <td>Larry</td>
                    <td>the Bird</td>
                    <td>@twitter</td>
                  </tr>
                  <tr>
                    <th scope="row">
                      3
                    </th>
                    <td>Larry</td>
                    <td>the Bird</td>
                    <td>@twitter</td>
                  </tr>
                  <tr>
                    <th scope="row">
                      3
                    </th>
                    <td>Larry</td>
                    <td>the Bird</td>
                    <td>@twitter</td>
                  </tr>
                  <tr>
                    <th scope="row">
                      3
                    </th>
                    <td>Larry</td>
                    <td>the Bird</td>
                    <td>@twitter</td>
                  </tr>
                  <tr>
                    <th scope="row">
                      3
                    </th>
                    <td>Larry</td>
                    <td>the Bird</td>
                    <td>@twitter</td>
                  </tr>
                  <tr>
                    <th scope="row">
                      3
                    </th>
                    <td>Larry</td>
                    <td>the Bird</td>
                    <td>@twitter</td>
                  </tr>
                  <tr>
                    <th scope="row">
                      3
                    </th>
                    <td>Larry</td>
                    <td>the Bird</td>
                    <td>@twitter</td>
                  </tr>
                  <tr>
                    <th scope="row">
                      3
                    </th>
                    <td>Larry</td>
                    <td>the Bird</td>
                    <td>@twitter</td>
                  </tr>
                  <tr>
                    <th scope="row">
                      3
                    </th>
                    <td>Larry</td>
                    <td>the Bird</td>
                    <td>@twitter</td>
                  </tr>
                  <tr>
                    <th scope="row">
                      3
                    </th>
                    <td>Larry</td>
                    <td>the Bird</td>
                    <td>@twitter</td>
                  </tr>
                  <tr>
                    <th scope="row">
                      3
                    </th>
                    <td>Larry</td>
                    <td>the Bird</td>
                    <td>@twitter</td>
                  </tr>
                  <tr>
                    <th scope="row">
                      3
                    </th>
                    <td>Larry</td>
                    <td>the Bird</td>
                    <td>@twitter</td>
                  </tr>
                </tbody>
              </table>
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
      model: {
        cantidad: ''
      },
      value1: '',
      options: [{
          value: 'Option1',
          label: 'Option1'
        }, {
          value: 'Option2',
          label: 'Option2'
        }, {
          value: 'Option3',
          label: 'Option3'
        }, {
          value: 'Option4',
          label: 'Option4'
        }, {
          value: 'Option5',
          label: 'Option5'
        }],
      category: [
        {
          name: 'Principio',
          dataTarget: 'collapseOne',
          show: 'show',
          ariaExpanded: 'true',
          value: 1
        },
        {
          name: 'Sopas',
          dataTarget: 'collapseTwot',
          show: 'show',
          ariaExpanded: 'false',
          value: 2
        },
        {
          name: 'Jugo',
          dataTarget: 'collapseThree',
          show: 'show',
          ariaExpanded: 'false',
          value: 3
        },
        {
          name: 'ensaladas',
          dataTarget: 'collapseFour',
          show: 'show',
          ariaExpanded: 'false',
          value: 4
        },      
      ],
      plato: [
        {
          name: 'bbbb',
          size: '',
          price: '2500',
          id_dishes_category: 1
        },
        {
          name: 'vvvvvv',
          size: '',
          price: '2500',
          id_dishes_category: 2
        },
        {
          name: 'assa',
          size: '',
          price: '2500',
          id_dishes_category: 3
        },        
        {
          name: 'bbbb',
          size: '',
          price: '2500',
          id_dishes_category: 1
        },
        {
          name: 'vvvvvv',
          size: '',
          price: '2500',
          id_dishes_category: 2
        },
        {
          name: 'assa',
          size: '',
          price: '2500',
          id_dishes_category: 3
        }
      ],
      menu: [],     
    };
  },
  mounted() {
  },
  methods: {
    loading(algo){
      this.hidden = algo
    },
    abrirModal(){
      this.openModal('#registerMenu')  
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