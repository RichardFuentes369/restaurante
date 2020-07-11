export const funciones = {
	methods: {
		closeModal(nameModal) {
			$(nameModal).modal('hide')
		},
		notify(id, title, message, type){
			if(id == '1'){
				this.$notify({
					title: title,
					message: message,
					type: type
				});
			}else if(id == '2'){
				this.$notify.error({
					message: message,
				});
			}
		},
		message(id, message, type){
			if(id == '1'){
				this.$message({
					message: message,
					type: type
				});
			}else if(id == '2'){
				this.$message.error({
					message: message,
				});
			}
		}
	}
}