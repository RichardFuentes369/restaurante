<template>
	<div>
		<div :class="`navbar-expand-lg ${this.diseno.clases}`" :style="`${this.diseno.estilos}`">
			<div class="justify-content-center text-center mx-auto" id="navbarNav">
				<ul class="navbar-nav">		
					<li class="nav-item active">
						<router-link to="/a/index" class="nav-link">index</router-link>
					</li>			
					<li class="nav-item active">
						<router-link to="/a/menus" class="nav-link">menus</router-link>
					</li>	
					<li class="nav-item active">
						<router-link to="/a/platos" class="nav-link">platos</router-link>
					</li>
					<li class="nav-item active">
						<router-link to="/a/promociones" class="nav-link">promociones</router-link>
					</li>  					
					<li class="nav-item active">
						<router-link to="/a/cajeros" class="nav-link">cajeros</router-link>
					</li>  	
					<li class="nav-item active">
						<router-link to="/a/cocineros" class="nav-link">cocineros</router-link>
					</li>  		
					<li class="nav-item active">
						<router-link to="/a/meseros" class="nav-link">meseros</router-link>
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