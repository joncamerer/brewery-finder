<template>
  <div class="beer-list">
    <div class="list-title-bar">
      <h1 id="beer-list-title" class="list-title">Brews</h1>
      <button
        id="toggle-new-beer-button"
        class="list-title-button"
        type="button"
        v-if="$store.state.user.id == brewery.brewerId"
        v-on:click="toggleAddBeer()"
      >
        {{ showAddBeer ? "-" : "+" }}
      </button>
    </div>

    <div id="new-beer-form-box" v-if="showAddBeer">
      <new-beer-form
        v-bind:breweryNumber="breweryId"
        v-on:hideForm="toggleAddBeer()"
      />
    </div>

    <div id="beer-list-box" v-else>
      <beer-summary
        v-for="beer in allBeers"
        v-bind:key="beer.id"
        v-bind:beer="beer"
        v-bind:brewerId="brewery.brewerId"
      />
    </div>
  </div>
</template>

<script>
import BeerSummary from "@/components/summaries/BeerSummary.vue";
import NewBeerForm from "@/components/forms/NewBeerForm.vue";

import BeerService from "@/services/BeerService";

export default {
  components: { BeerSummary, NewBeerForm },
  props: {
    brewery: Object,
  },
  data() {
    return {
      breweryId: parseInt(this.$route.params.id),
      allBeers: [],
      showAddBeer: false,
    };
  },
  created() {
    BeerService.listByBreweryId(this.breweryId).then((response) => {
      this.allBeers = response.data;
    });
  },
  methods: {
    toggleAddBeer() {
      this.showAddBeer = !this.showAddBeer;
    },
  },
};
</script>

<style>
#new-beer-form-box {
  padding: 1%;
  background-color: var(--color-three);
}
</style>
