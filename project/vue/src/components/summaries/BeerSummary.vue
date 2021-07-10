<template>
  <div id="beer-summary">
    <div id="beer-summary-detail-box">
      <div id="beer-summary-info-box" v-on:click="toggleDetails()">
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
      </div>
      <beer-detail
        v-show="showDetails"
        v-bind:beer="beer"
        v-bind:brewerId="brewerId"
      />
    </div>

    <button
      class="btn"
      v-show="showDetails"
      v-on:click.prevent="toggleDetails()"
    >
      Minimize
    </button>
  </div>
</template>

<script>
import BeerDetail from "@/components/BeerDetail.vue";

export default {
  components: { BeerDetail },
  data() {
    return {
      showDetails: false,
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
#beer-summary-detail-box {
  margin-bottom: 2%;
  padding-left: 3%;
  background-color: white;
}

#beer-summary-info-box {
  display: flex;
  justify-content: flex-start;
  align-items: center;
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
}

#beer-summary-style-abv {
  display: flex;
}
</style>