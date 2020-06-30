<template>
	<div>
		<!-- accept="image/jpeg,image/png"  -->
		<picture-input 
		ref="pictureInput"
		width="600" 
		height="600" 
		margin="0" 
		accept="image/png" 
		size="10" 
		button-class="btn btn-primary"
		:removable="true" 
		:custom-strings="{upload: '<h1>Bummer!</h1>', drag: 'Drag a 😺 GIF or GTFO'	}"
		@change="onChange" />
	</div>
</template>
<script>
import PictureInput from 'vue-picture-input'
export default {
	data() {
		return {
			route2: 'api/empleados/',
			dialogImageUrl: '',
			dialogVisible: false
		}
	},
	components: {
		PictureInput
	},
	methods: {
		handleRemove(file, fileList) {
			console.log(file, fileList);
		},
		handlePictureCardPreview(file) {
			this.dialogImageUrl = file.url;
			this.dialogVisible = true;
		},	
		async onChange(image){
			console.log(image)
			// this.model = {
			// 	imagen: image,
			// 	idEmpleado: this.idEmpleado
			// }
			// await axios.post(`${this.route2}/subirImagen`, this.model)
			// this.$notify({
			// 	title: 'Success',
			// 	message: 'Imagen subida exitosamente',
			// 	type: 'success'
			// });
			// this.$emit('listaEmpleados')
		},
	}
};
</script>