<template>
	<div class="contenido" :style="`height: ${this.alto}px; width: 100%; overflow-y: auto; overflow-x: hidden;`"> 
		<div class="row">
			<h2 class="title">Promociónes</h2> 
			<button type="button" class="btn btn-success btnadd ml-3 mt-1" data-toggle="modal" data-target=".bd-example-modal-xl" circle>
				<i class="fa fa-plus"></i>
			</button>
		</div>
		<div class="row justify-content-center">
			<div class="card mt-3 mx-2" style="width: 18rem;" v-for="(restaurante, key) in restaurantes">
				<div class="card-header">
					<h5 class="card-title">{{restaurante.nombre}}</h5>
				</div>
				<div class="card-body">
					<p class="card-text">{{restaurante.descripcion}}</p>
					<div class="row justify-content-center">
						<button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-xl">
							<i class="fa fa-pen"></i>
						</button>
						<a href="#" class="btn btn-danger ml-3">
							<i class="fa fa-trash"></i>
						</a>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Modal -->
		<div class="modal fade bd-example-modal-xl" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-xl" role="document">
				<div class="modal-content">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Añadir Restaurante</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<label for="">Razón Social</label>
							<input type="text" class="form-control">
							<label for="">Descrpción</label>
							<textarea class="form-control" style="resize:none"/>
							<label for="">Slogan</label>
							<input type="text" class="form-control">
							<label for="">Administrador</label>			
							<select name="" id="" class="form-control">
								<option value="">--Seleccione--</option>
								<option value="">Juan De Dios</option>
								<option value="">Rodrigo Beleño</option>
							</select>
							<hr>
							<label for="">Header</label>
							<br>
							<label for="">Footer</label>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">Save changes</button>
						</div>
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
			alto: '',
			restaurantes: [
			{
				'nombre': 'Promoción a',
				'descripcion': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestiae, recusandae similique eveniet quis. Quibusdam mollitia fugit officiis repellat, vel voluptates eaque possimus, nostrum dolore quaerat error modi soluta, perferendis! Molestiae.',
				'imagen': '',
			},
			{
				'nombre': 'Promoción b',
				'descripcion': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestiae, recusandae similique eveniet quis. Quibusdam mollitia fugit officiis repellat, vel voluptates eaque possimus, nostrum dolore quaerat error modi soluta, perferendis! Molestiae.',
				'imagen': '',
			},
			{
				'nombre': 'Promoción c',
				'descripcion': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestiae, recusandae similique eveniet quis. Quibusdam mollitia fugit officiis repellat, vel voluptates eaque possimus, nostrum dolore quaerat error modi soluta, perferendis! Molestiae.',
				'imagen': '',
			},
			{
				'nombre': 'Promoción d',
				'descripcion': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestiae, recusandae similique eveniet quis. Quibusdam mollitia fugit officiis repellat, vel voluptates eaque possimus, nostrum dolore quaerat error modi soluta, perferendis! Molestiae.',
				'imagen': '',
			},
			{
				'nombre': 'Promoción e',
				'descripcion': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestiae, recusandae similique eveniet quis. Quibusdam mollitia fugit officiis repellat, vel voluptates eaque possimus, nostrum dolore quaerat error modi soluta, perferendis! Molestiae.',
				'imagen': '',
			},
			{
				'nombre': 'Promoción f',
				'descripcion': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestiae, recusandae similique eveniet quis. Quibusdam mollitia fugit officiis repellat, vel voluptates eaque possimus, nostrum dolore quaerat error modi soluta, perferendis! Molestiae.',
				'imagen': '',
			},
			{
				'nombre': 'Promoción g',
				'descripcion': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestiae, recusandae similique eveniet quis. Quibusdam mollitia fugit officiis repellat, vel voluptates eaque possimus, nostrum dolore quaerat error modi soluta, perferendis! Molestiae.',
				'imagen': '',
			},
			{
				'nombre': 'Promoción h',
				'descripcion': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestiae, recusandae similique eveniet quis. Quibusdam mollitia fugit officiis repellat, vel voluptates eaque possimus, nostrum dolore quaerat error modi soluta, perferendis! Molestiae.',
				'imagen': '',
			},
			{
				'nombre': 'Promoción i',
				'descripcion': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestiae, recusandae similique eveniet quis. Quibusdam mollitia fugit officiis repellat, vel voluptates eaque possimus, nostrum dolore quaerat error modi soluta, perferendis! Molestiae.',
				'imagen': '',
			},
			{
				'nombre': 'Promoción j',
				'descripcion': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestiae, recusandae similique eveniet quis. Quibusdam mollitia fugit officiis repellat, vel voluptates eaque possimus, nostrum dolore quaerat error modi soluta, perferendis! Molestiae.',
				'imagen': '',
			},
			{
				'nombre': 'Promoción k',
				'descripcion': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestiae, recusandae similique eveniet quis. Quibusdam mollitia fugit officiis repellat, vel voluptates eaque possimus, nostrum dolore quaerat error modi soluta, perferendis! Molestiae.',
				'imagen': '',
			},
			]
		};
	},
	mounted() {
		this.resolution();
	},
	methods: {
		resolution (){
			this.alto = screen.height - 280
		}
	}
};
</script>
<style>

</style>