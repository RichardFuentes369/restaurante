<template>
	<div>
		<div class="col-sm-12 border p-5">
			<h5>Register</h5>
			<div class="col-sm-12">
				<div class="row">
					<div class="col-sm-6">
						<div class="mt-3">
							<el-input placeholder="Please input" v-model="model.name" maxlength="50" show-word-limit>
								<template slot="prepend">Name</template>
							</el-input>
						</div>
						<div class="mt-3">
							<el-input placeholder="Please input" v-model="model.lastname" maxlength="50" show-word-limit>
								<template slot="prepend">Lastname</template>
							</el-input>
						</div>
						<div class="mt-3">
							Document type
							<el-select v-model="model.td" placeholder="Select">
								<el-option
								v-for="item in td"
								:key="item.value"
								:label="item.label"
								:value="item.value" />
							</el-select>
						</div>
						<div class="mt-3">
							<el-input placeholder="Please input" v-model="model.dni" maxlength="30" show-word-limit>
								<template slot="prepend">DNI</template>
							</el-input>
						</div>
						<div class="mt-3">
							<el-input placeholder="Please input" v-model="model.phone" maxlength="30" show-word-limit>
								<template slot="prepend">Phone</template>
							</el-input>
						</div>
						<div class="mt-3">
							<el-input placeholder="Please input" v-model="model.cellphone" maxlength="30" show-word-limit>
								<template slot="prepend">Cellphone</template>
							</el-input>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="mt-3">
							Sexo
							<el-select v-model="model.sexo" placeholder="Select">
								<el-option
								v-for="item in sexo"
								:key="item.value"
								:label="item.label"
								:value="item.value" />
							</el-select>
						</div>
						<div class="mt-3">
							<ValidationProvider name="Email" :rules="{ required: true, email: true }" v-slot="{ errors }">
								<el-input placeholder="Please input" v-model="model.email" maxlength="50" show-word-limit>
									<template slot="prepend">Email</template>
								</el-input>
								<span class="text-danger">{{ errors[0] }}</span>
							</ValidationProvider>
						</div>
						<div class="mt-3">
							<el-input placeholder="Please input" v-model="model.password" minlength="8" maxlength="50" show-word-limit>
								<template slot="prepend">Password</template>
							</el-input>
						</div>
						<div class="mt-3">
							<el-input placeholder="Please input" v-model="model.address" maxlength="80" show-word-limit>
								<template slot="prepend">Address</template>
							</el-input>
						</div>	
						<div class="mt-3">
							To selection
							<el-checkbox-group v-model="model.checkCargo">
								<el-checkbox label="isSuperAdmin" />
								<el-checkbox label="isAdmin" />
								<el-checkbox label="isAtm" />
								<el-checkbox label="isWaiter" />
								<el-checkbox label="isChef" />
							</el-checkbox-group>
						</div>		
					</div>
					<button class="btn btn-success btn-block mt-3" @click="createUser">Registrarme</button>
					<router-link :to="{ name: 'bienvenidos'}" class="mt-2 btn btn-primary btn-block">Volver</router-link>
				</div>
			</div>
		</div>
	</div>
</div>
</template>
<script>
export default {
	data() {
		return {
			route: 'api/usuario/',
			usuarios: [],
			model: {
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
				checkCargo: []      
			},
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
		}
	},
	mounted() {
	},
	methods: {
		clear(){
			this.model = {
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
				checkCargo: []
			}
		},
		async createUser(){
			if (this.model.td != '' && this.model.dni != '' && this.model.sexo != '' && this.model.email != '' && this.model.password != '' && this.model.address != '' && this.model.checkCargo != ''){
				await axios.post(`${this.route}crear-usuario`, this.model)
				this.$notify({
					title: 'Success',
					message: 'Usuario creado exitosamente',
					type: 'success'
				});
			} else {
				this.$notify.error({
					message: 'Algunos campos no pueden ir vacios',
				});
			}
		}
	}
};
</script>

