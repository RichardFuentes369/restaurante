import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter);

import App from './views/App'

import Bienvenidos from './views/index/views/bienvenidos'
import Noticias from './views/index/views/noticias'
import NotFound from './views/index/views/not-found'
import Login from './views/index/components/login'
import Register from './views/index/components/register'
import Logout from './views/index/views/logout'

import Role from './views/index/views/role'

import SAtemplate from './views/super-admin/template/nav-left'
import SAindex from './views/super-admin/views/index.vue'
import SAadministradores from './views/super-admin/views/administradores.vue'
import SArestaurantes from './views/super-admin/views/restaurantes.vue'
import SAjum from './views/super-admin/views/jum.vue'

import Atemplate from './views/admin/template/nav-left'
import Aindex from './views/admin/views/index.vue'
import Amenus from './views/admin/views/menus.vue'
import Aplatos from './views/admin/views/platos.vue'
import Apromociones from './views/admin/views/promociones.vue'
import Acajeros from './views/admin/views/cajeros.vue'
import Acocineros from './views/admin/views/cocineros.vue'
import Ameseros from './views/admin/views/meseros.vue'

import Ctemplate from './views/cajero/template/nav-left'
import Cindex  from './views/cajero/views/index.vue'
import Ccobrar from './views/cajero/views/cobrar.vue'
import Cdevolucion from './views/cajero/views/devolucion.vue'

import Mtemplate from './views/mesero/template/nav-left'
import Mindex from './views/mesero/views/index'
import Mpedido from './views/mesero/views/pedidos'
import Mcarta from './views/mesero/views/carta'

export default new VueRouter({
	routes: [
	{
		path: '/',
		name: 'bienvenidos',
		component: Bienvenidos,
	},	
	{
		path: '/noticias',
		name: 'noticias',
		component: Noticias
	},
	{
		path: '/login',
		name: 'login',
		component: Login,
		meta: {
			requiresAuth: false,
		}
	},	
	{
		path: '/register',
		name: 'register',
		component: Register,
		meta: {
			requiresAuth: false,
		}
	},
	{ 
		path: '/404', 
		name: '404', 
		component: NotFound,
	},
	{ 
		path: '*', 
		redirect: '/404', 
	},
	{
		path: '/logout',
		name: 'logout',
		component: Logout,
		meta: {
			requiresAuth: true,
		}
	},
	{
		path: '/role',
		name: 'role',
		component: Role,
		meta: {
			requiresAuth: true,
		}
	},
	{
		path: '/sa',
		name: 'super-administrador',
		component: SAtemplate,
		default: SAindex,
		meta: {
			requiresAuth: true,
		},
		children: [
		{
			path: 'index',
			name: 'index',
			component: SAindex,
		},
		{
			path: 'administradores',
			name: 'administradores',
			component: SAadministradores,
		},
		{
			path: 'restaurantes',
			name: 'restaurantes',
			component: SArestaurantes
		},
		{
			path: 'jum',
			name: 'jum',
			component: SAjum
		}
		]
	},	
	{
		path: '/a',
		name: 'administrador',
		component: Atemplate,
		default: Aindex,
		meta: {
			requiresAuth: true,
		},
		children: [
		{
			path: 'index',
			name: 'index',
			component: Aindex,
		},
		{
			path: 'menus',
			name: 'menus',
			component: Amenus,
		},	
		{
			path: 'platos',
			name: 'platos',
			component: Aplatos,
		},
		{
			path: 'promociones',
			name: 'promociones',
			component: Apromociones
		},
		{
			path: 'cajeros',
			name: 'cajeros',
			component: Acajeros
		},
		{
			path: 'cocineros',
			name: 'cocineros',
			component: Acocineros
		},
		{
			path: 'meseros',
			name: 'meseros',
			component: Ameseros
		}
		]
	},
	{
		path: '/c',
		name: 'cajero',
		component: Ctemplate,
		default: Cindex,
		meta: {
			requiresAuth: true,
		},
		children: [
		{
			path: 'index',
			name: 'index',
			component: Cindex,
		},
		{
			path: 'cobrar',
			name: 'cobrar',
			component: Ccobrar,
		},	
		{
			path: 'devolucion',
			name: 'devolucion',
			component: Cdevolucion,
		}
		]
	},
	{
		path: '/m',
		name: 'mesero',
		component: Mtemplate,
		default: Mindex,
		meta: {
			requiresAuth: true,
		},
		children: [
		{
			path: 'index',
			name: 'index',
			component: Mindex,
		},
		{
			path: 'tomar-predido',
			name: 'tomar-predido',
			component: Mpedido,
		},	
		{
			path: 'carta',
			name: 'carta',
			component: Mcarta,
		}
		]
	},
	],
	mode: 'history',
	linkActiveClass: 'is-active'
});
