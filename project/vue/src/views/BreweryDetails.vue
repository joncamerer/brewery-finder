<template>
  <div id="brewery-details-grid">
    <Header />
    <brewery-contact v-bind:brewery="this.thisBrewery" />

    <div class="menu">
      <brewery-menu
        v-bind:breweryNumber="breweryId"
        v-bind:brewerId="thisBrewery.brewerId"
      />
    </div>
  </div>
</template>

<script>
import Header from "@/components/headers/Header.vue";
import BreweryContact from "../components/BreweryContact.vue";
import BreweryMenu from "../components/BreweryMenu.vue";

import BreweryService from "@/services/BreweryService";

export default {
  data() {
    return {
      breweryId: parseInt(this.$route.params.id),
      thisBrewery: {},
    };
  },
  components: {
    Header,
    BreweryContact,
    BreweryMenu,
  },
  created() {
    BreweryService.get(this.breweryId).then((response) => {
      if (response.status === 200) {
        this.thisBrewery = response.data;
      }
    });
  },
};
</script>

<style>
#header {
  grid-area: header;
}

#brewery-contact {
  grid-area: contact;
}
</style>