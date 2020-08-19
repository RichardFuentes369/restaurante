import Vue from 'vue'

/*Globales*/
Vue.component('uploadImage', require('./views/globales/uploadImage.vue').default);
Vue.component('loading', require('./views/globales/loading.vue').default);
Vue.component('gralinea', require('./views/globales/charts/linea.vue').default);
Vue.component('grabarras', require('./views/globales/charts/barras.vue').default);
Vue.component('grapie', require('./views/globales/charts/pie.vue').default);
Vue.component('graradar', require('./views/globales/charts/radar.vue').default);

/*Index*/
Vue.component('Informacion', require('./views/index/components/informacion.vue').default);
Vue.component('Login', require('./views/index/components/login.vue').default);

/*super admin*/
