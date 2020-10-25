<template>
  <div>
    <div class="container">
      <div class="column is-4 is-offset-4">
        <div class="box">
          <h1 class="title text-center">Login</h1>
          <div 
            v-if="error"
            class="notification text-danger" 
          >
            <p>
              {{ error }}
            </p>
          </div>
          <form 
            method="post"
            autocomplete="off" 
            @submit.prevent="login" 
          >
            <div class="field mt-3">
              <div class="control">
                <label for="">Email</label>
                <input 
                  v-model="username"
                  type="email" 
                  class="form-control" 
                  placeholder="user@example.com"
                >
              </div>
            </div>
            <div class="field mt-3">
              <div class="control">
                <label for="">Password</label>
                <el-input 
                  v-model="password"
                  placeholder="Please input password" 
                  show-password
                />                
              </div>
            </div>
            <button 
              type="submit" 
              class="btn btn-block bg-success text-white mt-3"
            >
              Sign in
            </button>
          </form>
          <router-link 
            :to="{ name: 'register'}" 
            class="mt-2 btn bg-primary text-white btn-block"
          >
            Register
          </router-link>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      username: 'roberts.virgie@example.net',
      password: 'password',
      error: null
    };
  },
  methods: {
    login() {
      this.$store
        .dispatch("retrieveToken", {
          username: this.username,
          password: this.password
        })
        .then(response => {
          this.$router.push({ name: "role" });
        })
        .catch(error => {
          this.error = error.response.data;
        });
    }
  }
};
</script>