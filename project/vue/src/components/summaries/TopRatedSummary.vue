<template>
  <div class="sidebar-summary">
    <p>{{ beer.beerName }}</p>
    <p>{{ getBreweryName(beer.breweryId) }} {{ breweryName }}</p>
    <div id="tr-style-abv">
      <p>{{ beer.beerStyle }},</p>
      <p>{{ beer.beerAbv }}% ABV</p>
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