<template>
  <div id="brewery-details-grid">
    <Header />
    <brewery-contact v-bind:brewery="brewery" />
    <beer-list v-bind:brewery="brewery" />
  </div>
</template>

<script>
import Header from "@/components/headers/Header.vue";
import BreweryContact from "@/components/summaries/BreweryContact.vue";
import BeerList from "@/components/lists/BeerList.vue";

import BreweryService from "@/services/BreweryService";

export default {
  components: {
    Header,
    BreweryContact,
    BeerList,
  },
  data() {
    return {
      breweryId: parseInt(this.$route.params.id),
      brewery: {},
    };
  },
  created() {
    BreweryService.get(this.breweryId).then((response) => {
      if (response.status === 200) {
        this.brewery = response.data;
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