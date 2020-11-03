<template>
  <div class="contenido">
    <div class="row">
      <h2 class="title mb-3">
        Cocinero
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
            class="bg-warning border-0 text-white mt-4 btnadd btn-position-accion" 
            title="Actualizar" 
            @click="abrirModal(atm)"
          >
            <i class="fa fa-pen" />
          </button>  
          <button 
            type="button" 
            class="bg-danger border-0 text-white mt-4 btnadd btn-position-accion" 
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
            class="bg-warning border-0 text-white mt-4 btnadd btn-position-accion" 
            title="Actualizar" 
            @click="abrirModal(atm)"
          >
            <i class="fa fa-pen" />
          </button>      
          <button 
            type="button" 
            class="bg-danger border-0 text-white mt-4 btnadd btn-position-accion" 
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
          <div class="container my-3">
            <el-tabs v-model="activeName" type="border-card">
              <el-tab-pane label="Cajero" name="first">
                <h5 class="text-center">{{ model.boton }} Cajero</h5>
                <ValidationObserver 
                  v-slot="{ invalid }" 
                  ref="registeradmin"
                >
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
                      class="btn btn-success" 
                      @click="crearCajero(1)"
                    >
                      {{ model.boton }}
                    </button>
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
              </el-tab-pane>
              <el-tab-pane label="Asignar rol" :disabled="model.disabled" name="second">
                <h5 class="text-center">Asignar el rol Cajero</h5>
                <el-select class="form-control-file" v-model="model.userSelected" placeholder="Select" @change="llenarDatos()">
                  <el-option
                    v-for="user in users"
                    :key="user.value"
                    :label="user.name"
                    :value="user.email"
                  >
                    <span style="float: left">{{ user.name }}</span>
                    <span style="float: right; color: #116FF6;" v-if="user.sexo == 'M'" class="p-0 text-center">{{ user.sexo }}</span>
                    <span style="float: right; color: #DA11EC;" v-else class="p-0 text-center">{{ user.sexo }}</span>
                  </el-option>
                </el-select>
                <ValidationObserver 
                  v-slot="{ invalid }" 
                  ref="registeradmin"
                >
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
                      class="btn btn-success" 
                      @click="crearCajero(2)"
                    >
                      {{ model.boton }}
                    </button>
                    <button 
                      type="button" 
                      class="btn btn-secondary" 
                      data-dismiss="modal"
                    >
                      Close
                    </button>
                  </div>
                </ValidationObserver>
              </el-tab-pane>
            </el-tabs>
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
      activeName: '',
      model: {
        show: false,
        disabled: false,
        titulo: '',
        boton: '',
        userSelected: '', //sirve para el editar
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
        isAtm: '',
        isWaiter: '',
        isClient: ''
      },      
      rol: [
      {'label': 'isAtm'},
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
      users: [],
      value: '',
      checkCargo: [],
      atms: []
    };
  },
  watch:{
    activeName: function (val){
      if(val == 'first'){
        return this.limpiar();
      }
    }
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
        titulo: 'Crear-Asignar Cajero',
        boton: 'Crear',
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
    async abrirModal(atm){
      this.activeName = 'first'
      let lop = (typeof(atm) == "number") ?  true : false
      await this.limpiar()
      if(lop == true){
        this.model = {
          titulo: 'Crear-Asignar Cajero',
          boton: 'Crear',
          disabled: false,
          show: false,
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
          isWaiter: ''
        }
      }
      if(lop == false){
        this.model.isAtm = (atm.isAtm === 1) ? this.checkCargo.push("isAtm") : ''
        this.model.isWaiter = (atm.isWaiter === 1) ? this.checkCargo.push("isWaiter") : ''
        this.model = {
          titulo: 'Editandar Cajero',
          boton: 'Editar',
          disabled: true,
          show: false,
          // photo: '/images/noImagen/nodisponible.png',
          name: atm.name,
          lastname: atm.lastname,
          td: atm.td,
          dni: atm.dni,
          phone: atm.phone,
          cellphone: atm.cellphone,
          sexo: atm.sexo,
          email: atm.email,
          sexo: atm.sexo,
          // password: '',
          address: atm.address,
          // contract_date: '',
          isAtm: atm.isAtm,
          isWaiter: atm.isWaiter,
          // isClient: ''
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
    async listCajeros(){
      this.charge(200)
      await axios.get(`${this.route}get-users`).then(res => {
        this.users = res.data
      })     
      await axios.get(`${this.route}atm-list`).then(res => {
        this.atms = res.data
      })
    },
    llenarDatos(){
      let usuarioCajero = this.users.find(obj => obj.email === this.model.userSelected)
      this.model.isAtm = (usuarioCajero.isAtm === 1) ? this.checkCargo.push("isAtm") : ''
      this.model.isWaiter = (usuarioCajero.isWaiter === 1) ? this.checkCargo.push("isWaiter") : ''
      this.model = {
        show: false,
        titulo: 'Editandar-Asignanar Cajero',
        boton: 'Crear',
        photo: '/images/noImagen/nodisponible.png',
        name: usuarioCajero.name,
        lastname: usuarioCajero.lastname,
        td: usuarioCajero.td,
        dni: usuarioCajero.dni,
        phone: usuarioCajero.phone,
        cellphone: usuarioCajero.cellphone,
        sexo: usuarioCajero.sexo,
        email: usuarioCajero.email,
        password: usuarioCajero.password,
        address: usuarioCajero.address,
        contract_date: '',
        isAtm: usuarioCajero.isAtm,
        isWaiter: usuarioCajero.isWaiter,
        isClient: usuarioCajero.isClient
      }
    },
    async crearCajero(opcion){ 
      console.log(opcion, this.model)
      /*La opcion 1 es crear editar, la opcion 2 es asignar rol*/
      if(opcion == 1){
        /*crear cajero y editar cajero*/
        if(this.model.boton == "Crear"){
          console.log('ando creando cajero')
          await axios.post(`${this.route}atm-register`, this.model)
          this.closeModal('#registerCajeros')
          await this.listCajeros()
          this.notify(1, 'Success', 'Cajero creado exitosamente', 'success')
        }else{
          await axios.put(`${this.route}atm-update`, this.model)
          this.closeModal('#registerCajeros')
          await this.listCajeros()
          this.notify(1, 'Success', 'Cajero creado exitosamente', 'success')
          console.log('ando editando cajero')
        }
      }else{
        console.log('ando asignando rol')
      }
    },
  }
};
</script>
<style>

</style>