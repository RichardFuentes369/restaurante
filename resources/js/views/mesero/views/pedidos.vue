<template>
	<div class="contenido"> 
	<div class="row">
		<h2 class="title mb-3">Pedidos</h2> 
		<button type="button" class="btn btn-success btnadd ml-1 mt-1" data-toggle="modal" data-target=".bd-example-modal-xl" circle>
			<i class="fa fa-plus"></i>
		</button>
	</div>

	<div class="modal fade bd-example-modal-xl" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl" role="document">
			<div class="modal-content">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Tomar Pedido</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body contenido">
						<label for="">Mesa</label>
						<select name="" id="" class="form-control">
							<option value="">--Seleccione--</option>
							<option value="">Masculino</option>
							<option value="">Femenino</option>
						</select>
						<label for="">Plato</label>
						<select name="" id="" class="form-control">
							<option value="">--Seleccione--</option>
							<option value="">Masculino</option>
							<option value="">Femenino</option>
						</select>				
						<label for="">Cantidad</label>
						<input type="number" class="form-control" minlength="0"> 
					</select>
					<button class="btn btn-block btn-primary mt-2">Agregar</button>
					<div class="table-responsive">
						<!-- Que se inserten en orden desc o un scroll a la tabla -->
						<table class="table">
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col">Plato</th>
									<th scope="col">Cantidad</th>
									<th scope="col">Precio uni</th>
									<th scope="col">Precio tot</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row">1</th>
									<td>Mark</td>
									<td>Otto</td>
									<td>@mdo</td>
									<td>2500</td>
								</tr>
								<tr>
									<th scope="row">2</th>
									<td>Jacob</td>
									<td>Thornton</td>
									<td>@fat</td>
									<td>2500</td>
								</tr>			
								<tr>
									<th scope="row">2</th>
									<td>Jacob</td>
									<td>Thornton</td>
									<td>@fat</td>
									<td>2500</td>
								</tr>			
								<tr>
									<th scope="row">2</th>
									<td>Jacob</td>
									<td>Thornton</td>
									<td>@fat</td>
									<td>2500</td>
								</tr>				
								<tr>
									<th scope="row">2</th>
									<td>Jacob</td>
									<td>Thornton</td>
									<td>@fat</td>
									<td>2500</td>
								</tr>					
								<tr>
									<th scope="row">2</th>
									<td>Jacob</td>
									<td>Thornton</td>
									<td>@fat</td>
									<td>2500</td>
								</tr>
								<tr>
									<th scope="row">3</th>
									<td>Larry</td>
									<td>the Bird</td>
									<td>@twitter</td>
									<td>2500</td>
								</tr>
							</tbody>
						</table>
					</div>
					<label for="">Precio Total</label>
					<input type="number" class="form-control" value="2500" readonly>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Hacer Pedido</button>
				</div>
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