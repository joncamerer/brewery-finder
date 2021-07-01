<template>
  <div id="login">
    <form class="form-signin" @submit.prevent="login">
      <h1 id="login-title">Sign In</h1>
      <div class="alert alert-danger" role="alert" v-if="invalidCredentials">
        Invalid username and password!
      </div>
      <div
        class="alert alert-success"
        role="alert"
        v-if="this.$route.query.registration"
      >
        Thank you for registering, please sign in.
      </div>

      <div class="login-item">
        <label for="username" class="login-label">User: </label>
        <input
          type="text"
          id="username"
          class="login-input"
          placeholder="Username"
          v-model="user.username"
          required
          autofocus
        />
      </div>

      <div class="login-item">
        <label for="password" class="login-label">Password: </label>
        <input
          type="password"
          id="password"
          class="login-input"
          placeholder="Password"
          v-model="user.password"
          required
        />
      </div>

      <div id="signin-bar">
        <router-link id="login-register" :to="{ name: 'register' }"
          >Register</router-link
        >
        <button type="submit" id="login-submit">Sign in</button>
      </div>
    </form>
  </div>
</template>

<script>
import authService from "@/services/AuthService";

export default {
  name: "login",
  components: {},
  data() {
    return {
      user: {
        username: "",
        password: "",
      },
      invalidCredentials: false,
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then((response) => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
          }
        })
        .catch((error) => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    },
  },
};
</script>

<style>
#login {
  display: flex;
}

.form-signin {
  min-width: 0%;

  background-color: rgb(247, 243, 240);
  border: 3px solid black;

  padding: 3%;
  margin: 1% 0%;

  opacity: 90%;
}

.form-signin:hover {
  opacity: 100%;
}

#login-title {
  font-size: var(--section-header-text);
}

.login-item {
  display: flex;
  justify-content: space-between;
  align-items: flex-end;
}

.login-label {
  font-size: var(--body-text);
}

.login-input {
  min-width: 0%;
  margin-left: 2%;
}

#signin-bar {
  display: flex;
  justify-content: space-around;
}
</style>