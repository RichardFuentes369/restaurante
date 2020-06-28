<template>
	<div>
		<nav :class="`navbar-expand-lg ${this.diseno.clases} fixed-top mt-5`" :style="`${this.diseno.estilos}`">
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarTogglerDemo03">
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
								<router-link to="/sa/estadisticas" class="nav-link">estadisticas</router-link>
							</li>		
							<li class="nav-item active">
								<router-link to="/logout" class="nav-link">salir</router-link>
							</li>  
						</ul>
					</div>
				</div>
			</div>
		</nav>
		<hr class="line-hr fixed-top mt-5">
		<div class="col-sm-12 row boxnametag fixed-top">
			<div class="col-xl-10 col-lg-10 col-sm-8 col-md-9"></div>
			<div class="col-sm col-md col-lg col-xl mt-xl-n4 mt-sm-n4 mt-n4"><span class="nametag text-right">{{this.usuario_logeado.name}}</span></div>
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
</style>