<template>
  <div id="header">
    <div id="logo-title" class="header-item">
      <router-link v-bind:to="{ name: 'home' }">
        <div>
          <img id="header-logo" src="@/images/logo.png" />
        </div>
      </router-link>
      <div id="header-title">Brewery Finder</div>
    </div>
    <div id="login-user-box" class="header-item" v-if="displayLogin">
      <header-login v-if="$store.state.token == ''" />
      <user-card v-else />
    </div>
  </div>
</template>

<script>
import HeaderLogin from "@/components/headers/HeaderLogin.vue";
import UserCard from "@/components/UserCard.vue";

export default {
  components: { HeaderLogin, UserCard },
  computed: {
    displayLogin() {
      return this.$route.name !== "register";
    },
  },
};
</script>

<style>
#header {
  background: red;

  display: flex;
  justify-content: space-between;
  padding: 0% 3%;
  align-items: center;
}

.header-item {
  padding: 1% 0%;
}

#logo-title {
  display: flex;
  align-items: flex-end;
  min-width: 44%;
}

#login-user-box {
  display: flex;
}

#header-title {
  padding-left: 2%;
  font-size: var(--main-header-text);
  color: var(--color-six);
}

#header-logo {
  width: 120px;
  height: 110px;

  border-radius: 50%;
  border: 3px solid black;
}

#header-logo:hover {
  border: 3px solid green;
}
</style>
