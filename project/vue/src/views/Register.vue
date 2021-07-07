<template>
  <div id="registration-body">
    <Header />

    <div id="register">
      <form id="registration-form" @submit.prevent="register">
        <h1>Create Account</h1>
        <div role="alert" v-if="registrationErrors">
          {{ registrationErrorMsg }}
        </div>
        <div class="registration-item">
          <label for="username">Username:</label>
          <input
            type="text"
            id="username"
            placeholder="Username"
            v-model="user.username"
            required
            autofocus
          />
        </div>
        <div class="registration-item">
          <label for="password">Password:</label>
          <div>
            <input
              type="password"
              id="password"
              placeholder="Password"
              v-model="user.password"
              required
            />
            <input
              type="password"
              id="confirmPassword"
              placeholder="Confirm Password"
              v-model="user.confirmPassword"
              required
            />
          </div>
        </div>
        <div class="registration-item">
          <label for="account-type">Account Type:</label>
          <select name="account-type" v-model="user.accountType">
            <option value="">--Please select a role</option>
            <option value="Beer Lover">Beer Lover</option>
            <option value="Brewer">Brewer</option>
            <option value="Administrator">Administrator</option>
          </select>
        </div>
        <div class="registration-item">
          <label for="user-location">Location:</label>
          <input name="user-location" type="text" v-model="user.userLocation" />
        </div>
        <div class="registration-item">
          <router-link :to="{ name: 'home' }">Have an account?</router-link>
          <button type="submit">Create Account</button>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import Header from "../components/headers/Header.vue";
import authService from "../services/AuthService";

export default {
  components: { Header },
  name: "register",
  data() {
    return {
      user: {
        username: "",
        password: "",
        confirmPassword: "",
        role: "user",
        accountType: "",
        userLocation: "",
      },
      registrationErrors: false,
      registrationErrorMsg: "There were problems registering this user.",
    };
  },
  methods: {
    register() {
      if (this.user.password != this.user.confirmPassword) {
        this.registrationErrors = true;
        this.registrationErrorMsg = "Password & Confirm Password do not match.";
      } else {
        if (
          this.user.accountType === "Administrator" ||
          this.user.accountType === "Brewer"
        ) {
          this.user.role = "admin";
        }

        authService
          .register(this.user)
          .then((response) => {
            if (response.status == 201) {
              this.$router.push({
                path: "/",
                query: { registration: "success" },
              });
            }
          })
          .catch((error) => {
            const response = error.response;
            this.registrationErrors = true;
            if (response.status === 400) {
              this.registrationErrorMsg = "Bad Request: Validation Errors";
            }
          });
      }
    },
    clearErrors() {
      this.registrationErrors = false;
      this.registrationErrorMsg = "There were problems registering this user.";
    },
  },
};
</script>

<style>
#registration-body {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
}

#register {
  grid-area: form;

  display: flex;
  flex-grow: 1;
  min-height: 100%;

  justify-content: center;
  align-items: center;
}

#registration-form {
  display: flex;
  flex-direction: column;

  background-color: rgb(247, 243, 240);
  border: 3px solid black;
  padding: 3%;
}

.registration-item {
  display: flex;
  flex-direction: column;
  padding-bottom: 3%;
}
</style>
