<template>
	<div>
		<div class="col-sm-12 border p-5">
			<h5>Registrarme</h5>
			<div class="col-sm-12">
				<div class="row">
					<div class="col-sm-6">
						<div class="mt-3">
							<el-input placeholder="Please input" v-model="model.nombre" maxlength="50" show-word-limit>
								<template slot="prepend">Nombres</template>
							</el-input>
						</div>
						<div class="mt-3">
							<el-input placeholder="Please input" v-model="model.apellido" maxlength="50" show-word-limit>
								<template slot="prepend">Apellidos</template>
							</el-input>
						</div>
						<div class="mt-3">
							tipo de documento
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
					</div>
					<div class="col-sm-6">
						<div class="mt-3">
							sexo
							<el-select v-model="model.sexo" placeholder="Select">
								<el-option
								v-for="item in sexo"
								:key="item.value"
								:label="item.label"
								:value="item.value" />
							</el-select>
						</div>
						<div class="mt-3">
							<el-input placeholder="Please input" v-model="model.email" maxlength="50" show-word-limit>
								<template slot="prepend">Correo</template>
							</el-input>
						</div>
						<div class="mt-3">
							<el-input placeholder="Please input" v-model="model.direccion" maxlength="80" show-word-limit>
								<template slot="prepend">Dirección</template>
							</el-input>
						</div>
						<div class="mt-3">
							<el-input placeholder="Please input" v-model="model.contrasena" minlength="8" maxlength="50" show-word-limit>
								<template slot="prepend">Contraseña</template>
							</el-input>
						</div>
						<div class="mt-3">
							<div class="col-sm-12">
								<div class="row">
									<div class="col-sm-2">
										<el-tooltip class="item" effect="dark" content="Tengo un jefe" placement="left">
											<el-switch
											v-model="model.acargo"
											active-color="#13ce66"
											inactive-color="#ff4949" />
										</el-tooltip>
									</div>
									<div class="col-sm">
										<el-input v-show="model.acargo == true" placeholder="Please input" size="medium" v-model="model.email_padre" maxlength="50" show-word-limit>
											<template slot="prepend">A cargo de</template>
										</el-input>
									</div>
								</div>
							</div>
						</div>
					</div>
					<button class="btn btn-success btn-block mt-3" @click="CrearUsuario">Registrarme</button>
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
					nombre: '',
					apellido: '',
					td: '',
					dni: '',
					sexo: '',
					email: '',
					direccion: '',
					contrasena: '',
					acargo: false,
					email_padre: ''
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
			// this.listarUsuarios()
		},
		methods: {
			limpiar() {
				this.model = {
					nombre: '',
					apellido: '',
					td: '',
					dni: '',
					sexo: '',
					email: '',
					direccion: '',
					contrasena: '',
					acargo: false,
					email_padre: ''
				}
			},
			listarUsuarios() {
				axios.get(`${this.route}lista-usuario`).then(res => {
					this.usuarios = res.data
				})
			},
			async CrearUsuario(){
				if (this.usuarios.find( o => o.email == this.model.email) != undefined) {
					this.$notify.error({
						message: 'Ese correo ya existe',
					});
				} else {
					if(this.model.acargo == true){
						if (this.usuarios.find( o => o.email == this.model.email_padre) == undefined) {
							this.$notify.error({
								message: 'El correo del encargado no existe',
							});
						} else {
							if (this.model.email != '' && this.model.dni != '' && this.model.contrasena != '') {
								await axios.post(`${this.route}crear-usuario`, this.model)
								this.$notify({
									title: 'Success',
									message: 'Usuario creado exitosamente',
									type: 'success'
								});
								this.limpiar()
								this.listarUsuarios()
							} else {
								this.$notify.error({
									message: 'Algunos campos no pueden ir vacios',
								});
							}
						}
					} else {
						if (this.model.email != '' && this.model.dni != '' && this.model.contrasena != '') {
							await axios.post(`${this.route}crear-usuario`, this.model)
							this.$notify({
								title: 'Success',
								message: 'Usuario creado exitosamente',
								type: 'success'
							});
							this.limpiar()
							this.listarUsuarios()
						} else {
							this.$notify.error({
								message: 'Algunos campos no pueden ir vacios',
							});
						}
					}
				}
			},
		},
	};
</script>