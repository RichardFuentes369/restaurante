<template>
  <div class="contenido">
    <div class="row">
      <h2 class="title mb-3">
        Meseros
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
    <div 
      v-show="!hidden" 
      class="row justify-content-center"
    >
      <div 
        v-for="atm in atms" 
        :key="atm.id"
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
                v-model="atm.name"
                class="form-control border-0 text-center bg-transparent" 
                style="font-family: cursive"
                @change="actualizar(atm)"
              >
            </el-tooltip>
          </div>
        </div>
        <div
          v-if="atm.photo != null"
          class="card-body"
          :style="`background-image: url(/images/atms/${atm.photo});background-position-x: center; background-position-y: center; background-repeat: no-repeat; width: 18rem; height: 15rem;`" 
        > 
          <button 
            type="button" 
            class="btn btn-warning mt-4 btnadd btn-position-accion" 
            title="Actualizar" 
            @click="abrirModal(atm)"
          >
            <i class="fa fa-pen" />
          </button>  
          <button 
            type="button" 
            class="btn btn-danger mt-4 btnadd btn-position-accion" 
            title="Eliminar" 
            @click="eliminar(atm)"
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
            @click="abrirModal(atm)"
          >
            <i class="fa fa-pen" />
          </button>      
          <button 
            type="button" 
            class="btn btn-danger mt-4 btnadd btn-position-accion" 
            title="Eliminar" 
            @click="eliminar(atm)"
          >
            <i class="fa fa-trash" />
          </button>
        </div>
        <div class="card-footer">
          <div class="row justify-content-center">
            <el-tag 
              v-show="atm.isSuperAdmin == 1"
              class="mx-1"
              size="mini"
              style="background-color:#EC85F5; color:#FAF5F5"
            >
              IsSuperAdmin
            </el-tag>
            <el-tag 
              v-show="atm.isAdmin == 1"
              class="mx-1"
              size="mini"
              style="background-color:#FFF600; color:#020202"
            >
              IsAdmin
            </el-tag>
            <el-tag 
              v-show="atm.isAtm == 1"
              class="mx-1"
              size="mini"
              style="background-color:#04D5FB; color:#020202"
            >
              IsAtm
            </el-tag>
          </div>
          <div class="row justify-content-center my-1">
            <el-tag 
              v-show="atm.isWaiter == 1"
              class="mx-1"
              size="mini"
              style="background-color:#01FF73; color:#020202"
            >
              IsWaiter
            </el-tag>
            <el-tag 
              v-show="atm.isChef == 1"
              class="mx-1"
              size="mini"
              style="background-color:#E74134; color:#FAF5F5"
            >
              IsChef
            </el-tag>
            <el-tag 
              v-show="atm.isClient == 1"
              class="mx-1"
              size="mini"
              style="background-color:#FDB900; color:#020202"
            >
              IsClient
            </el-tag>
          </div>
        </div>
      </div>
    </div>


    <!-- Modal -->
    <div 
      id="registerCajeros" 
      class="modal fade bd-example-modal-xl" 
      tabindex="-1" 
      role="dialog" 
      aria-labelledby="exampleModalLabel" 
      aria-hidden="true"
    >
      <div 
        class="modal-dialog modal-xl" 
        role="document"
      >
        <div class="modal-content">
          <div class="modal-content">
            <ValidationObserver 
              v-slot="{ invalid }" 
              ref="registeradmin"
            >
              <div class="modal-header">
                <h5 
                  id="exampleModalLabel" 
                  class="modal-title text-dark"
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
                <div class="col-sm-12">
                  <div class="row">
                    <div class="col-sm-6">
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
                      <div class="mt-3">
                        <el-input 
                          v-model="model.lastname"
                          placeholder="Please input"
                          maxlength="50" 
                          show-word-limit
                        >
                          <template slot="prepend">
                            Lastname
                          </template>
                        </el-input>
                      </div>
                      <div class="mt-3">
                        Document type
                        <el-select 
                          v-model="model.td" 
                          placeholder="Select"
                        >
                          <el-option
                            v-for="item in td"
                            :key="item.value"
                            :label="item.label"
                            :value="item.value" 
                          />
                        </el-select> <br>
                      </div>
                      <div class="mt-3">
                        <el-input
                          v-model="model.dni" 
                          placeholder="Please input" 
                          maxlength="30" 
                          show-word-limit
                        >
                          <template slot="prepend">
                            DNI
                          </template>
                        </el-input>
                      </div>
                      <div class="mt-3">
                        <el-input 
                          v-model="model.phone"
                          placeholder="Please input" 
                          maxlength="30" 
                          show-word-limit
                        >
                          <template slot="prepend">
                            Phone
                          </template>
                        </el-input>
                      </div>
                      <div class="mt-3">
                        <el-input
                          v-model="model.cellphone"
                          placeholder="Please input" 
                          maxlength="30" 
                          show-word-limit
                        >
                          <template slot="prepend">
                            Cellphone
                          </template>
                        </el-input>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="mt-3">
                        Sexo
                        <el-select 
                          v-model="model.sexo" 
                          placeholder="Select"
                        >
                          <el-option
                            v-for="item in sexo"
                            :key="item.value"
                            :label="item.label"
                            :value="item.value"
                          />
                        </el-select>
                      </div>
                      <div class="mt-3">
                        <ValidationProvider 
                          v-slot="{ errors }"
                          name="Email" 
                          :rules="{ required: true, email: true }" 
                        >
                          <el-input
                            v-model="model.email" 
                            placeholder="Please input" 
                            maxlength="50" 
                            show-word-limit
                          >
                            <template slot="prepend">
                              Email
                            </template>
                          </el-input>
                          <span class="text-danger">{{ errors[0] }}</span>
                        </ValidationProvider>
                      </div>
                      <div 
                        v-show="model.opcion == 0"
                        class="mt-3"
                      >
                        <ValidationProvider 
                          v-slot="{ errors }"
                          name="Password" 
                          :rules="{ required: true, regex: /^[a-z0-9A-Z]{6,18}$/ }" 
                        >
                          <el-input 
                            v-model="model.password"
                            placeholder="Please input" 
                            minlength="8" 
                            maxlength="18" 
                            show-word-limit
                          >
                            <template slot="prepend">
                              Password
                            </template>
                          </el-input>
                          <span class="text-danger">{{ errors[0] }}</span>
                        </ValidationProvider>
                      </div>                      
                      <div 
                        v-show="model.opcion == 1"
                        class="mt-3"
                      >
                        <el-input 
                          v-model="model.password"
                          placeholder="Please input"
                          minlength="8" 
                          maxlength="18" 
                          show-word-limit
                        >
                          <template slot="prepend">
                            Password
                          </template>
                        </el-input>
                      </div>  
                      <div 
                        v-show="model.opcion == 2"
                        class="mt-3" 
                      >
                        <el-switch 
                          v-model="model.haspassword" 
                          class="mb-3 carousel-indicators" 
                          active-text="Actualizar contraseña" 
                          inactive-text="No actualizar contraseña" 
                        />
                        <ValidationProvider 
                          v-slot="{ errors }"
                          name="Password" 
                          :rules="{ required: true, regex: /^[a-z0-9A-Z]{6,18}$/ }"
                        >
                          <el-input 
                            v-show="model.haspassword == true"
                            v-model="model.password"
                            placeholder="Please input" 
                            minlength="8" 
                            maxlength="18" 
                            show-word-limit
                          >
                            <template slot="prepend">
                              Password 
                            </template>
                          </el-input>
                          <span class="text-danger">
                            {{ errors[0] }}
                          </span>
                        </ValidationProvider>
                      </div>      
                      <div class="mt-3">
                        <el-input 
                          v-model="model.address"
                          placeholder="Please input" 
                          maxlength="80" 
                          show-word-limit
                        >
                          <template slot="prepend">
                            Address
                          </template>
                        </el-input>
                      </div>
                      <div class="mt-3">
                        Rol
                        <ValidationProvider 
                          v-slot="{ errors }"
                          name="Role" 
                          :rules="{ required: true, min: 1 }"
                        >
                          <el-checkbox-group v-model="checkCargo">
                            <el-checkbox 
                              v-for="item in rol" 
                              :key="item.label"
                              :label="item.label" 
                            />
                          </el-checkbox-group>
                          <span class="text-danger">{{ errors[0] }}</span>
                        </ValidationProvider>
                      </div>      
                    </div>
                  </div>
                </div>
              </div>
              <div class="modal-footer">
                <el-popover 
                  placement="bottom" 
                  width="200"  
                  trigger="hover" 
                  content="Remember that the email, password and rol"
                >
                  <el-button 
                    slot="reference" 
                    circle 
                    class="p-0"
                  >
                    <i class="el-icon-info" />
                  </el-button>
                </el-popover>
                <button 
                  type="button" 
                  class="btn btn-secondary" 
                  data-dismiss="modal"
                >
                  Close
                </button>
                <button 
                  v-show="model.opcion == 0" 
                  :disabled="invalid"
                  type="button" 
                  class="btn btn-primary" 
                >
                  {{ model.nombre_boton }}
                </button>
                <button 
                  v-show="model.opcion == 2"
                  :disabled="invalid"
                  type="button"  
                  class="btn btn-primary" 
                >
                  {{ model.nombre_boton }}
                </button>
              </div>
            </ValidationObserver>
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
      route: window.location.origin+'/api/cajeros/',
      model: {
        show: false,
        titulo: '',
        boton: '',
        photo: '',
        name: '',
        lastname: '',
        td: '',
        dni: '',
        phone: '',
        cellphone: '',
        sexo: '',
        email: '',
        password: '',
        address: '',
        contract_date: '',
        isWaiter: ''
      },      
      rol: [
      {'label': 'isWaiter'}
      ],
      td: [
      {'label': 'Cedula de ciudadania', 'value': 'CC'},
      {'label': 'Tarjeta de identidad', 'value': 'TI'},
      {'label': 'Registro civil', 'value': 'RC'},
      {'label': 'Cedula de extrangeria', 'value': 'CE'},
      {'label': 'Pasaporte', 'value': 'PA'},
      ],
      sexo: [
      {'label': 'Maculino', 'value': 'M'},
      {'label': 'Femenino', 'value': 'F'}
      ],
      checkCargo: [],
      atms: []
    };
  },
  mounted() {
    this.listCajeros()
  },
  methods: {
    loading(algo){
      this.hidden = algo
    },
    limpiar(){
      this.checkCargo = [],
      this.model = {
        show: false,
        titulo: '',
        boton: '',
        photo: '/images/noImagen/nodisponible.png',
        name: '',
        lastname: '',
        td: '',
        dni: '',
        phone: '',
        cellphone: '',
        sexo: '',
        email: '',
        password: '',
        address: '',
        contract_date: '',
        isAtm: '',
        isWaiter: '',
        isClient: ''
      }
    },
    abrirModal(atm){
      this.limpiar()
      if(atm != 1){
        this.model.isWaiter = (atm.isWaiter === 1) ? this.checkCargo.push("isWaiter") : ''
        this.model = {
          titulo: 'Editando el cajero',
          boton: 'Editar',
          // id: plato.id,
          // show: plato.photo != null ? true : false,
          // name: plato.name,
          // description: plato.description,
          // photo: plato.photo,
          // price: plato.price,
          // size: plato.size,
          // mid_atms_categoria: plato.id_atms_category
        }
      } else {
        this.model.isWaiter = (atm.isWaiter === 1) ? this.checkCargo.push("isWaiter") : ''
        this.model = {
          titulo: 'Creando un nuevo cajero',
          boton: 'Crear',
          // show: false,
          // id: '', 
          // name: '',
          // description: ''
        }
      }
      this.openModal('#registerCajeros')  
    },
    imagen(image){
      if(image != undefined){
        this.model.photo = image
      } else {
        this.model.photo = ''        
      }
    },
    listCajeros(){
      this.charge(200)
      axios.get(`${this.route}atm-list`).then(res => {
        this.atms = res.data
      })
    },
    // async guardarPlato(){
    //   if (this.model.mid_atms_categoria != '' && this.model.name != '' && this.model.description != ''){
    //     await axios.post(`${this.route}atms-register`, this.model)
    //     this.closeModal('#registerCajeros')
    //     await this.listCajeros()
    //     this.notify(1, 'Success', 'Plato creado exitosamente', 'success')
    //   } else {
    //     this.notify(2, '', 'Algunos campos no pueden ir vacios', '')
    //   }
    // },    
    // async actualizar(atm) {
    //   if (atm.name != '' && atm.description != ''){
    //     await axios.put(`${this.route}atms-update`, atm)
    //     await this.listCajeros()
    //     this.notify(1, 'Success', 'Plato actualizado exitosamente', 'success')
    //   } else {
    //     await this.listCajeros()
    //     this.notify(2, '', 'Algunos campos no pueden ir vacios', '')
    //   }
    // },   
    // async actualizarpomodal() {
    //   if (this.model.name != '' && this.model.description != ''){
    //     await axios.put(`${this.route}atms-update`, this.model)
    //     this.closeModal('#registerCajeros')
    //     await this.listCajeros()
    //     this.notify(1, 'Success', 'Categoria de plato actualizada exitosamente', 'success')
    //   } else {
    //     this.notify(2, '', 'Algunos campos no pueden ir vacios', '')
    //   }
    // },
    // async eliminar(atm){
    //   this.$confirm('Esta seguro que desea eliminar este plato?', 'Warning', {
    //     confirmButtonText: 'Eliminar',
    //     cancelButtonText: 'Cancelar',
    //     type: 'warning'
    //   }).then(async () => {
    //     await axios.delete(`${this.route}${atm.id}/atms-delete`)
    //     this.id_atms_categoria = ''
    //     this.notify(2, '', 'Se elimino la categoria con exito', '')
    //     await this.listCajeros()
    //   }).catch(() => {
    //     this.message(1, 'Eliminación cancelada', 'info')         
    //   });
    // }
  }
};
</script>
<style>

</style>