<template>
  <div>
    <div class="container">
      <div class="column is-4 is-offset-4">
        <div class="box">
          <h1 class="title text-center">Login</h1>
          <div class="notification is-danger" v-if="error">
            <p>{{error}}</p>
          </div>
          <form autocomplete="off" @submit.prevent="login" method="post">
            <div class="field mt-3">
              <div class="control">
                <label for="">Email</label>
                <input type="email" class="form-control" placeholder="user@example.com" v-model="username" />
              </div>
            </div>
            <div class="field mt-3">
              <div class="control">
                <label for="">Password</label>
                <input type="password" class="form-control" v-model="password" />
              </div>
            </div>
            <button type="submit" class="btn btn-block btn-success mt-3">Sign in</button>
          </form>
          <router-link :to="{ name: 'register'}" class="mt-2 btn btn-primary btn-block">Register</router-link>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      username: null,
      password: null,
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
          console.log(response)
          this.$router.push({ name: "dashboard" });
        })
        .catch(error => {
          this.error = error.response.data;
        });
    }
  }
};
</script>