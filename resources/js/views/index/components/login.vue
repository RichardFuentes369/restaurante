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
                <input 
                  v-model="password"
                  type="password" 
                  class="form-control"
                >
              </div>
            </div>
            <button 
              type="submit" 
              class="btn btn-block btn-success mt-3"
            >
              Sign in
            </button>
          </form>
          <router-link 
            :to="{ name: 'register'}" 
            class="mt-2 btn btn-primary btn-block"
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
      username: 'hertha19@example.org',
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