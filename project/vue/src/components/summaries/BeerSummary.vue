<template>
  <div
    id="beer-summary"
    v-on:mouseover="showButtons = true"
    v-on:mouseleave="showButtons = false"
  >
    <div id="beer-summary-info-box">
      <div id="beer-summary-image-box">
        <img id="beer-summary-image" :src="beer.beerImage" />
      </div>

      <div id="beer-summary-info">
        <h1 class="summary-title">{{ beer.beerName }}</h1>
        <div id="beer-summary-style-abv" class="summary-text">
          <p>{{ beer.beerStyle }}</p>
          <p class="summary-list-item">{{ beer.beerAbv + "%" }}</p>
        </div>
      </div>

      <div class="button-size" v-show="!showButtons"></div>
      <div id="view-beer-details-button" v-show="showButtons && !showDetails">
        <button type="button" v-on:click="toggleDetails()">View Details</button>
      </div>
    </div>

    <div id="beer-summary-description-reviews" v-show="showDetails">
      <beer-description v-bind:beer="beer" v-bind:brewerId="brewerId" />
      <review-list v-bind:beer="beer" />
    </div>

    <div id="beer-summary-bottom-button" v-show="showDetails">
      <div class="button-size"></div>
      <button class="button-size" type="button" v-on:click="toggleDetails()">
        Hide Details
      </button>
    </div>
  </div>
</template>

<script>
import BeerDescription from "@/components/summaries/BeerDescription.vue";
import ReviewList from "@/components/lists/ReviewList.vue";

export default {
  components: { BeerDescription, ReviewList },
  data() {
    return {
      showDetails: false,
      showButtons: false,
    };
  },
  props: {
    beer: Object,
    brewerId: Number,
  },
  methods: {
    toggleDetails() {
      this.showDetails = !this.showDetails;
    },
  },
};
</script>

<style >
#beer-summary {
  margin-bottom: 2%;
  padding-left: 3%;
  background-color: white;
}

#beer-summary-info-box {
  display: flex;
  justify-content: flex-start;
  align-items: stretch;
}

#beer-summary-image-box {
  display: flex;
  justify-content: center;
  width: 120px;
  height: 110px;
  border-radius: 50%;
  border: 3px solid black;
  overflow: hidden;
}

#beer-summary-image {
  max-height: 110px;
}

#beer-summary-info {
  padding-left: 3%;
  flex-grow: 1;
}

#beer-summary-style-abv {
  display: flex;
}

.view-beer-details-holder {
  width: 90px;
}

#view-beer-details-button {
  display: flex;
}

#view-beer-details-button button {
  min-width: 90px;
}

#beer-summary-description-reviews {
  display: flex;
}

#review-list {
  flex-grow: 1;
}

#hide-beer-details-button {
  height: 116px;
  width: 90px;
}

.button-size {
  height: 116px;
  width: 90px;
}

#beer-summary-bottom-button {
  display: flex;
  justify-content: space-between;
}
</style>