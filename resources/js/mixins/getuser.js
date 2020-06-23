export const userMixins = {
	methods: {
		async getUser() {
			this.$store
			.dispatch("userauthenticate")
			.then(res => {
				if(res != undefined) {
					this.usuario_logeado = res.data
				}
			})
			.catch(error => {
				this.error = error.res.data;
			});
		}
	}
}