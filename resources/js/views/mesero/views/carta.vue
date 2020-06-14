<template>
	<div class="contenido" :style="`height: ${this.alto}px; width: 100%; overflow-y: auto;`"> 
		<h2>Carta</h2>
		
	</div>
</div>
</template>
<script>
export default {
	data() {
		return {
			alto: '',
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