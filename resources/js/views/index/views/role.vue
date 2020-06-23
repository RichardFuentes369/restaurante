<template>
	<div>
		<div :class="`navbar-expand-lg ${this.diseno.clases}`" :style="`${this.diseno.estilos}`">
			<div class="justify-content-center text-center mx-auto" id="navbarNav">
				<ul class="navbar-nav">					
					<li class="nav-item active">
						<router-link to="" class="nav-link disabled">{{this.usuario_logeado.name}}</router-link>
					</li>  
					<li class="nav-item active">
						<router-link to="/logout" class="nav-link">salir</router-link>
					</li>  
				</ul>
			</div>
		</div>
		<hr>
		<div class="col-sm-12 row mt-3 justify-content-center">
			<h3>Seleccióna el rol con el que deseas ingresar</h3>
		</div>
		<div class="text-center">
			<div class="col-sm-12 row mt-2">
				<div class="col-sm-2">	
					<button v-model="this.boton" class="btn btn-success" @click="option">Go to</button>
					<el-popover	placement="bottom" width="200"	trigger="hover" content="Click 'Go To' for see the profiles" class="informacion ml-2 mt-1">
						<el-button slot="reference" circle class="p-0">
							<i class="el-icon-info" />
						</el-button>
					</el-popover>
				</div>
				<div class="col-sm text-left">
					<el-select v-show="this.boton == true" v-model="rol_selection" placeholder="Select"
					class="form-control-file" @change="goTo">
					<el-option
					v-for="item in roles"
					:key="item.value"
					:label="item.label"
					:value="item.value" />
				</el-select>
			</div>
		</div>
	</div>
</div>
</div>
</template>
<script>
import { userMixins } from '../../../mixins/getuser.js'
export default {
	data() {
		return {
			usuario_logeado: '',
			boton: false,
			roles: [],
			rol_selection: '',
			diseno: {
				calses: '',
				estilos: '',
			}
		};
	},
	async mounted() {
		await this.barra_estilos()
		await this.getUser()
	},
	methods: {
		option() {
			this.roles = []
			this.boton = true
			this.usuario_logeado.isAdmin == 1 ? this.roles.push({'label': 'Admin' , 'value': 'administrador'}) : ''
			this.usuario_logeado.isAtm == 1 ? this.roles.push({'label': 'Atm' , 'value': 'cajero'}) : ''
			this.usuario_logeado.isChef == 1 ? this.roles.push({'label': 'Chef' , 'value': ''}) : ''
			this.usuario_logeado.isClient == 1 ? this.roles.push({'label': 'Client' , 'value': ''}) : ''
			this.usuario_logeado.isSuperAdmin == 1 ? this.roles.push({'label': 'SuperAdmin' , 'value': 'super-administrador'}) : ''
			this.usuario_logeado.isWaiter == 1 ? this.roles.push({'label': 'Waiter' , 'value': 'mesero'}) : ''
		},
		barra_estilos() {
			this.diseno.clases = "navbar-light";
			this.diseno.estilos = "background-color: #e3f2fd";
		},
		goTo() {
			this.$router.push({ name: this.rol_selection })
			this.rol_selection = ''
		}
	},
	mixins: [userMixins]
};
</script>