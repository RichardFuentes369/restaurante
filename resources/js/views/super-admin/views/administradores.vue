<template>
	<div class="contenido"> 
		<div class="row">
			<h2 class="title mb-3">Administradores</h2> 
			<button type="button" class="btn btn-success btnadd ml-3 mt-1" data-toggle="modal" data-target=".bd-example-modal-xl" circle>
				<i class="fa fa-plus"></i>
			</button>
		</div>
		<div class="justify-content-center table-responsive">
			<table class="table table-striped">
				<thead>
					<tr>
						<th scope="col" class="text-center">#</th>
						<th scope="col" class="text-center">Photo</th>
						<th scope="col" class="text-center">Name</th>
						<th scope="col" class="text-center">Lastname</th>
						<th scope="col" class="text-center">Sexo</th>
						<th scope="col" class="text-center">Email</th>
						<th scope="col" class="text-center">Options</th>
					</tr>
				</thead>
				<tbody>
					<tr v-for="(user, key) in users">
						<th scope="row">{{key+1}}</th>
						<td class="text-center">{{user.photo}}</td>
						<td class="text-center">{{user.name}}</td>
						<td class="text-center">{{user.lastname}}</td>
						<td class="text-center">{{user.sexo}}</td>
						<td class="text-center">{{user.email}}</td>
						<td class="text-center">
							<button class="btnadd btn btn-primary" title="Ver">
								<i class="far fa-eye" />
							</button>
							<button class="btnadd btn btn-warning" title="Editar">
								<i class="fas fa-pen" />
							</button>
							<button class="btnadd btn btn-danger" title="Eliminar">
								<i class="fa fa-trash" />
							</button>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<!-- Modal -->
		<div id="registerAdmin" class="modal fade bd-example-modal-xl" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-xl" role="document">
				<div class="modal-content">
					<div class="modal-content">
						<ValidationObserver v-slot="{ invalid }" ref="registeradmin">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Añadir Administrador</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
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
												</el-select> <br>
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
												<ValidationProvider name="Password" :rules="{ required: true, regex: /^[a-z0-9A-Z]{6,18}$/ }" v-slot="{ errors }">
													<el-input placeholder="Please input" v-model="model.password" minlength="8" maxlength="18" show-word-limit>
														<template slot="prepend">Password</template>
													</el-input>
													<span class="text-danger">{{ errors[0] }}</span>
												</ValidationProvider>
											</div>
											<div class="mt-3">
												<el-input placeholder="Please input" v-model="model.address" maxlength="80" show-word-limit>
													<template slot="prepend">Address</template>
												</el-input>
											</div>
											<div class="mt-3">
												Rol
												<ValidationProvider name="Role" :rules="{ required: true, min: 1 }" v-slot="{ errors }">
													<el-checkbox-group v-model="checkCargo">
														<el-checkbox v-for="item in rol" :label="item.label" :key="item.label" />
													</el-checkbox-group>
													<span class="text-danger">{{ errors[0] }}</span>
												</ValidationProvider>
											</div>		
										</div>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<el-popover	placement="bottom" width="200"	trigger="hover" content="Remember that the email, password and rol">
									<el-button slot="reference" circle class="p-0">
										<i class="el-icon-info" />
									</el-button>
								</el-popover>
								<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary" @click="guardarAdministrador" :disabled="invalid">Save changes</button>
							</div>
						</ValidationObserver>
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
			route: window.location.origin+'/api/super-admin/',
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
				isAdmin: 0,
				isAtm: 0    
			},
			users: [],
			checkCargo: [],
			rol: [
			{'label': 'isAdmin'},
			{'label': 'isAtm'},
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
		};
	},
	mounted() {
		this.listAdmin()
	},
	methods: {
		clear(){
			this.users = []
			this.checkCargo = []
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
				isAdmin: 0,
				isAtm: 0   
			}
			this.$refs.registeradmin.reset()
		},
		listAdmin(){
			axios.get(`${this.route}admin-list`).then(res => {
				this.users = res.data
			})
		},
		async guardarAdministrador(){
			if (this.model.name != '' && this.model.lastname != '' && this.model.td != '' && this.model.dni != '' && this.model.sexo != '' && this.model.email != '' && this.model.password != '' && this.model.address != ''){
				for (let value of this.checkCargo) {
					if(value == 'isAdmin'){
						this.model.isAdmin = 1
					}
					if(value == 'isAtm'){
						this.model.isAtm = 1
					}
				}
				await axios.post(`${this.route}admin-register`, this.model)
				$('#registerAdmin').modal('hide')
				this.clear()
				this.listAdmin()
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
<style>
.btnadd{
	border-radius: 2rem;
	height: 36px;
	width: 36px;
}
.btnadd i{
	margin-left: -2px;
}
</style>