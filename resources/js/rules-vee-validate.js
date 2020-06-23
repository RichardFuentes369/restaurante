import Vue from 'vue'

/*VeeValidate*/
Vue.component('ValidationProvider', ValidationProvider);
Vue.component('ValidationObserver', ValidationObserver);

import { ValidationProvider, extend } from 'vee-validate'
import { ValidationObserver } from 'vee-validate'
import { required, email, regex, min  } from 'vee-validate/dist/rules'

extend('required', {
	...required,
	message: 'This field is required'
});

extend('email',{
	...email,
	message: 'Email is not valid. '
});

extend('regex',{
	...regex,
	message: 'Regular expression is not valid. '
});

extend('min',{
	...min,
	message: 'You must enter more characters. '
});