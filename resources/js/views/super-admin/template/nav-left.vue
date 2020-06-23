<template>
	<div>

		<div class="fixed-top mt-5">
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
			<div class="col-sm-12 row">
				<div class="col-xl-10 col-lg-10 col-sm-8 col-md-9"></div>
				<div class="col-sm col-md col-lg col-xl mt-xl-n4 mt-sm-n4 mt-n4"><span class="nametag text-right">{{this.usuario_logeado.name}}</span></div>
			</div>
		</div>

		<div>
			<router-view></router-view>
		</div>
	</div>
</template>

<script>
import { userMixins } from '../../../mixins/getuser.js'
export default {
	data() {
		return {
			usuario_logeado: '',
			diseno: {
				calses: '',
				estilos: '',
			}
		};
	},
	async mounted(){
		this.barra_estilos()
		await this.getUser()
	},
	methods: {
		barra_estilos() {
			this.diseno.clases = "navbar-light";
			this.diseno.estilos = "background-color: #e3f2fd";
		}
	},
	mixins: [userMixins]
};
</script>
<style>
.nametag{
	background-color: blue;
	color: white;
	border-radius: 35%;
}
</style>