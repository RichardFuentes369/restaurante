<template>
	<div>
		<div :class="`navbar-expand-lg ${this.diseno.clases}`" :style="`${this.diseno.estilos}`">
			<div class="justify-content-center text-center mx-auto" id="navbarNav">
				<ul class="navbar-nav">		
					<li class="nav-item active">
						<router-link to="/m/index" class="nav-link">index</router-link>
					</li>			
					<li class="nav-item active">
						<router-link to="/m/tomar-predido" class="nav-link">tomar pedido</router-link>
					</li>	
					<li class="nav-item active">
						<router-link to="/m/carta" class="nav-link">carta</router-link>
					</li>	
					<li class="nav-item active">
						<router-link to="/logout" class="nav-link">salir</router-link>
					</li> 
				</ul>
			</div>
		</div>
		<hr>
		<router-view></router-view>
	</div>
</template>

<script>
export default {
	data() {
		return {
			diseno: {
				calses: '',
				estilos: '',
			}
		};
	},
	mounted(){
		this.barra_estilos()
	},
	methods: {
		barra_estilos() {
			this.diseno.clases = "navbar-light";
			this.diseno.estilos = "background-color: #e3f2fd";
		}
	}
};
</script>
<style>
</style>