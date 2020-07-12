import Vue from 'vue'

/*Globales*/
Vue.component('loading', require('./views/globales/loading.vue').default);
Vue.component('uploadImage', require('./views/globales/uploadImage.vue').default);

/*Index*/
Vue.component('Informacion', require('./views/index/components/informacion.vue').default);
Vue.component('Login', require('./views/index/components/login.vue').default);

/*super admin*/
