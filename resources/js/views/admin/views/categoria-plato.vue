<template>
	<div class="contenido">
		<div class="row">
			<h2 class="title mb-3">Categoria de platos</h2> 
			<button type="button" class="btn btn-success btnadd ml-3 mt-1" data-toggle="modal" data-target=".bd-example-modal-xl" circle>
				<i class="fa fa-plus"></i>
			</button>
		</div>
		<div class="row justify-content-center">
			<div class="card my-2 mx-4" :style="`background-image: url(${restaurante.logo});background-position-x: center; background-position-y: center; background-size: ${restaurante.size}; background-repeat: no-repeat; width: 18rem; height: 15rem`" v-for="restaurante in restaurantes" title="click">
				<div class="card-tittle text-center text-capitalize mt-2">
					<input class="form-control border-0 text-center" :style="`text-decoration: underline overline wavy ${restaurante.color}; 
					font-family: cursive;`" v-model="restaurante.nombre">
				</div>
				<div class="card-body">
					<el-input
					type="textarea"
					:autosize="{ minRows: 7, maxRows: 7}"
					placeholder="Please input"
					resize="none"
					v-model="restaurante.descripcion" />
				</div>
				<button type="button" class="btn btn-danger btnadd" data-toggle="modal" data-target=".bd-example-modal-xl">
					<i class="fa fa-trash"></i>
				</button>
			</div>
		</div>

		<!-- Modal -->
		<div class="modal fade bd-example-modal-xl" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-xl" role="document">
				<div class="modal-content">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Añadir Categoria de Platos</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="col-sm-12">
							<div class="row">
								<div class="col-sm-12">
									<div class="mt-3">
										<el-input placeholder="Please input" maxlength="50" show-word-limit>
											<template slot="prepend">Name</template>
										</el-input>
									</div>
								</div>
								<div class="col-sm-12 mt-2">
									<div class="row">
										<div class="col-sm-6 text-center" v-show="model.show != false">
											<uploadImage />
										</div>
										<div class="col-sm-6 text-center">
											<el-color-picker v-model="model.color" />
										</div>
									</div>
								</div>
								<div class="col-sm-12">
									<el-input
									type="textarea"
									:autosize="{ minRows: 7, maxRows: 7}"
									placeholder="Please input"
									resize="none"/>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
										<button type="button" class="btn btn-primary">Save changes</button>
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
			model: {
				show: true,
				color: '#DD2929'
			},
			restaurantes: [
			{

				'nombre': 'Afrodiciacós',
				'descripcion': 'esta es una descripcion de la empresa que se va a generar por la pandemia del covid 19 es por ello y mucho mas que se puede percibir cosas coherentes como los que no podemos vover, arturo calle es una empresa de las cuales somos parte todos los colombianos es por ellos que los componentes de la chingada masdre es por ello que frank no me va a dar trabajo eso es por confiar en gente estupida y relativamente idiota',
				'imagen': '',
				'color': '#F16868'
			},
			{
				'nombre': 'Cremas',
				'descripcion': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestiae, recusandae similique eveniet quis. Quibusdam mollitia fugit officiis repellat, vel voluptates eaque possimus, nostrum dolore quaerat error modi soluta, perferendis! Molestiae.it. Molestiae, recusandae similique eveniet quis. Quibusdam mollitia fugit officiis repellat, vel voluptates eaque possimus, nostrum dolore quaerat error modi soluta, perferendis! Molestiae.',
				'imagen': '',
				'color': '#1D22F9'
			},
			{
				'nombre': 'Ensaladas',
				'descripcion': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestiae, recusandae similique eveniet quis. Quibusdam mollitia fugit officiis repellat, vel voluptates eaque possimus, nostrum dolore quaerat error modi soluta, perferendis! Molestiae.',
				'imagen': '',
				'color': '#AFD722'
			},
			{
				'nombre': 'Guisos',
				'descripcion': '',
				'imagen': '',
				'color': '#F16868'
			},
			{
				'nombre': 'Carnes',
				'descripcion': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestiae, recusandae similique eveniet quis. Quibusdam mollitia fugit officiis repellat, vel voluptates eaque possimus, nostrum dolore quaerat error modi soluta, perferendis! Molestiae.',
				'imagen': '',
				'color': '#F16868'
			},
			{
				'nombre': 'Aperitivos',
				'descripcion': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestiae, recusandae similique eveniet quis. Quibusdam mollitia fugit officiis repellat, vel voluptates eaque possimus, nostrum dolore quaerat error modi soluta, perferendis! Molestiae.',
				'imagen': '',
				'color': '#F16868'
			},
			{
				'nombre': 'Embutidos',
				'descripcion': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestiae, recusandae similique eveniet quis. Quibusdam mollitia fugit officiis repellat, vel voluptates eaque possimus, nostrum dolore quaerat error modi soluta, perferendis! Molestiae.',
				'imagen': '',
				'color': '#F16868'
			},
			]
		};
	},
	mounted() {
	},
	methods: {
	}
};
</script>
<style>

</style>