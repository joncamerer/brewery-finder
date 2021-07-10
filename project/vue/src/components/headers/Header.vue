<template>
  <div id="header">
    <div id="logo-title">
      <div id="header-logo-box">
        <router-link id="header-logo-link" v-bind:to="{ name: 'home' }">
          <img id="header-logo" src="@/images/logo.png" />
        </router-link>
      </div>
      <h1 id="header-title">Brewery Finder</h1>
    </div>
    <div v-if="displayLogin">
      <header-login v-if="$store.state.token == ''" />
      <header-user v-else />
    </div>
  </div>
</template>

<script>
import HeaderLogin from "@/components/headers/HeaderLogin.vue";
import HeaderUser from "@/components/headers/HeaderUser.vue";

export default {
  components: { HeaderLogin, HeaderUser },
  computed: {
    displayLogin() {
      return this.$route.name !== "register";
    },
  },
};
</script>

<style>
#header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  max-width: 100%;
  min-width: 0;

  padding: 0% 3%;
  height: 170px;
}

#logo-title {
  display: flex;
  align-items: flex-end;
  min-width: 0;
  padding: 1% 0%;
}

#header-logo-box {
  display: flex;
  justify-content: center;
  width: 120px;
  height: 110px;
  border: 3px solid transparent;
  border-radius: 50%;
  overflow: hidden;
}

#header-logo-box:hover {
  border: 3px solid var(--color-seven);
}

#header-logo {
  max-height: 110px;
}

#header-title {
  font-size: var(--main-header-text);
  color: var(--color-six);
  margin: 0;

  white-space: nowrap;
}
</style>
