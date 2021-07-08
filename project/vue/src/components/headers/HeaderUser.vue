<template>
  <div id="header-user">
    <h1 id="user-initial">{{ user.initial }}</h1>
    <div id="header-user-info">
      <h1 id="user-title">Welcome back,</h1>
      <div class="header-user-item">
        <p id="header-username">{{ user.username }}</p>
      </div>
      <div class="header-user-item">
        <p id="header-account-type">{{ user.accountType }}</p>
      </div>

      <button id="logout-submit" v-on:click="logout()">Logout</button>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      user: {
        username: "",
        accountType: "",
        initial: "",
      },
    };
  },
  created() {
    this.user.username = this.$store.state.user.username;
    this.user.accountType = this.$store.state.user.accountType;
    this.user.initial = this.$store.state.user.username.charAt(0).toUpperCase();
  },
  methods: {
    logout() {
      this.$store.commit("LOGOUT");
      this.$router.go();
    },
  },
};
</script>

<style>
#header-user {
  display: flex;
  align-items: center;
  justify-content: flex-end;

  background-color: white;
  border: 3px solid black;

  padding: 3% 15px 3% 30px;

  opacity: 90%;
}

#header-user-info {
  display: flex;
  flex-direction: column;
}

#user-title {
  font-size: var(--section-header-text);

  white-space: nowrap;
}

#user-initial {
  padding-right: 30px;
  font-size: var(--section-header-text);
}

.header-user-item {
  padding: 1% 0%;
  margin: 0%;
}

#header-username {
  font-size: var(--body-text);
  margin: 0%;
}

#header-account-type {
  font-size: var(--body-text);
  margin: 0%;
}

#logout-submit {
  min-width: 0%;
}
</style>