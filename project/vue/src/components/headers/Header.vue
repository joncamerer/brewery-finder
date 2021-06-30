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

    <header-login v-if="$store.state.token == ''" />
    <user-card v-else />
  </div>
</template>

<script>
import HeaderLogin from "@/components/headers/HeaderLogin.vue";
import UserCard from "@/components/UserCard.vue";

export default {
  components: { HeaderLogin, UserCard },
};
</script>

<style>
#header {
  background: red;
  display: flex;
  justify-content: space-around;
  align-items: center;
}

#logo-title {
  display: flex;
  align-items: center;
}

#header-title {
  font: bold;
  font-size: 50px;
  background-size: cover;
  color: black;
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
