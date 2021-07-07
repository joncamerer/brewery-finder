<template>
  <div id="header">
    <div id="logo-title">
      <router-link v-bind:to="{ name: 'home' }">
        <div>
          <img id="header-logo" src="@/images/logo.png" />
        </div>
      </router-link>
      <div id="header-title">Brewery Finder</div>
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

#header-title {
  font-size: var(--main-header-text);
  color: var(--color-six);

  white-space: nowrap;
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
