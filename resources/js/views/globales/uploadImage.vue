<template>
  <div>
    <!-- accept="image/jpeg,image/png"  -->
    <picture-input 
      ref="pictureInput"
      :width="`${alto}`" 
      :height="`${ancho}`" 
      margin="0" 
      accept="image/png" 
      size="25" 
      button-class="btn btn-primary"
      :hideChangeButton="true" 
      :prefill="`${imagen}`"
      :removable="true" 
      :custom-strings="{
        upload: '<h1>Bummer!</h1>',
        drag: 'Drag a 😺 GIF or GTFO'
      }"
      @change="onChange"
      @remove="onChange"
    />
  </div>
</template>
<script>
import PictureInput from 'vue-picture-input'
export default {
  components: {
    PictureInput
  },
  props: {
    alto: {
      type: Number,
      default: 100
    },
    ancho: {
      type: Number,
      default: 100
    },
    imagen: {
      type: String,
      default: ''
    }
  },
  data() {
    return {
      dialogImageUrl: '',
      dialogVisible: false
    }
  },
  methods: {
    handleRemove(file, fileList) {
      console.log(file, fileList);
    },
    handlePictureCardPreview(file) {
      this.dialogImageUrl = file.url;
      this.dialogVisible = false;
    },  
    async onChange(image){
      this.$emit('cargarImagen', image)
    },
  }
};
</script>