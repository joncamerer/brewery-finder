<template>
  <div class="sidebar-summary">
    <h1 class="summary-title">{{ beer.beerName }}</h1>
    <p class="summary-text">
      {{ getBreweryName(beer.breweryId) }} {{ breweryName }}
    </p>
    <div id="tr-style-abv" class="summary-text">
      <p>{{ beer.beerStyle }}</p>
      <p class="summary-list-item">{{ beer.beerAbv }}% ABV</p>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      breweryName: "",
    };
  },
  props: {
    beer: Object,
  },
  methods: {
    getBreweryName(breweryId) {
      let breweries = this.$store.state.breweries;

      breweries.forEach((brewery) => {
        if (brewery.id == breweryId) {
          this.breweryName = brewery.breweryName;
        }
      });
    },
  },
};
</script>

<style>
#tr-style-abv {
  display: flex;
}
</style>