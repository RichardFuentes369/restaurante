require('./bootstrap')

import Vue from 'vue'
import App from './views/App'
import router from './routes'
import validate from './vee-validate'
import rules from './rules-vee-validate'
import element from './element'
import vuechart from './vue-chart'
import component from './registercomponent'
import store from './store'

router.beforeEach((to, from, next) => {
	if (to.matched.some(record => record.meta.requiresAuth)) {
      // this route requires auth, check if logged in
      // if not, redirect to login page.
      if (!store.getters.loggedIn) {
      	next({
      		name: 'login',
      	})
      } else {
      	next()
      }
  } else {
      next() // make sure to always call next()!
  }
})

const app = new Vue({
	el: '#app',
	components: { App },
	router,
	store
});