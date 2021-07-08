<template>
  <div id="login">
    <form class="form-signin" @submit.prevent="login">
      <h1 id="login-title" class="login-item">Sign In</h1>

      <div
        class="login-item login-alert"
        role="alert"
        v-if="invalidCredentials"
      >
        Invalid username or password!
      </div>

      <div
        class="login-item login-alert"
        role="alert"
        v-if="this.$route.query.registration"
      >
        Thank you for registering, please sign in.
      </div>

      <input
        id="login-username"
        ref="login-username"
        class="login-item"
        type="text"
        placeholder="Username"
        v-model="user.username"
        required
        autofocus
      />

      <input
        id="login-password"
        class="login-item"
        type="password"
        placeholder="Password"
        v-model="user.password"
        required
      />

      <div id="signin-bar">
        <button type="submit" id="login-submit">Sign in</button>
        <router-link id="login-register" :to="{ name: 'register' }"
          ><button type="button">Register</button></router-link
        >
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
.form-signin {
  display: flex;
  flex-direction: column;
  min-width: 0%;

  background-color: white;

  padding: 6% 15px 6% 90px;
  margin: 1% 0%;
}

#login-title {
  font-size: var(--section-header-text);
  margin: 1%;
}

.login-alert {
  font-weight: bold;
  font-size: var(--body-text);
}

.login-item {
  margin-bottom: 2%;
}

#signin-bar {
  display: flex;
  justify-content: space-around;
}

#login-register {
  text-decoration: none;
}
</style>