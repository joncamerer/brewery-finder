<template>
  <div id="beer-info">
    <div class="list-title-bar">
      <h1 class="list-title">Description</h1>
      <button
        class="list-title-button"
        type="button"
        v-if="$store.state.user.id == brewerId"
        v-on:click="toggleUpdateBeer()"
      >
        {{ showUpdateDetails ? "-" : "+" }}
      </button>
    </div>

    <div v-if="showUpdateDetails">
      <update-beer-form v-bind:beer="beer" v-on:hideForm="toggleUpdateBeer()" />
    </div>

    <p v-else class="summary-text">{{ beer.beerDescription }}</p>
  </div>
</template>

<script>
import UpdateBeerForm from "@/components/forms/UpdateBeerForm.vue";

import beerService from "@/services/BeerService";
import reviewService from "@/services/ReviewService";

export default {
  components: {
    UpdateBeerForm,
  },
  props: {
    beer: Object,
    brewerId: Number,
  },
  data() {
    return {
      showUpdateDetails: false,
      reviews: [],
    };
  },
  created() {
    reviewService.listByBeerId(this.beer.id).then((response) => {
      if (response.status == 200) {
        this.reviews = response.data;
      }
    });
  },
  methods: {
    deleteBeer() {
      if (confirm("Are you sure you want to permanently delete this beer?"))
        beerService.delete(this.beer.id).then((response) => {
          if (response.status == 200) {
            this.$router.go();
          }
        });
    },
    toggleUpdateBeer() {
      this.showUpdateDetails = !this.showUpdateDetails;
    },
  },
};
</script>

<style>
</style>