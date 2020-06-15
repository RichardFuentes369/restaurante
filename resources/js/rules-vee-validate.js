import Vue from 'vue'

/*VeeValidate*/
Vue.component('ValidationProvider', ValidationProvider);

import { ValidationProvider, extend } from 'vee-validate'
import { required, email  } from 'vee-validate/dist/rules'

extend('required', {
	...required,
	message: 'This field is required'
});

extend('email',{
	...email,
	message: 'Email is not valid. '
});