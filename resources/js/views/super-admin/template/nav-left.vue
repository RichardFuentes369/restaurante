<template>
	<div>
		<div :class="`navbar-expand-lg ${this.diseno.clases}`" :style="`${this.diseno.estilos}`">
			<div class="justify-content-center text-center mx-auto" id="navbarNav">
				<ul class="navbar-nav">		
					<li class="nav-item active">
						<router-link to="/sa/index" class="nav-link">index</router-link>
					</li>			
					<li class="nav-item active">
						<router-link to="/sa/administradores" class="nav-link">administradores</router-link>
					</li>
					<li class="nav-item active">
						<router-link to="/sa/restaurantes" class="nav-link">restaurantes</router-link>
					</li>  	
					<li class="nav-item active">
						<router-link to="/sa/jum" class="nav-link">jum</router-link>
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