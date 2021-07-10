<template>
  <div id="beer-summary">
    <div id="beer-summary-info-box" v-on:click="toggleHidden()">
      <div id="beer-summary-image-box">
        <img id="beer-summary-image" :src="beer.beerImage" />
      </div>
      <div id="brewery-summary-info">
        <h1 class="summary-title">{{ beer.beerName }}</h1>
        <div id="beer-summary-style-abv" class="summary-text">
          <p>{{ beer.beerStyle }}</p>
          <p class="summary-list-item">{{ beer.beerAbv + "%" }}</p>
        </div>
      </div>
    </div>

    <beer-detail
      v-show="!isHidden"
      v-bind:beer="beer"
      v-bind:brewerId="brewerId"
    />

    <button class="btn" v-show="!isHidden" v-on:click.prevent="toggleHidden()">
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
      isHidden: true,
    };
  },
  props: {
    beer: Object,
    brewerId: Number,
  },
  methods: {
    toggleHidden() {
      this.isHidden = !this.isHidden;
    },
  },
};
</script>

<style >
#beer-summary-info-box {
  display: flex;
  justify-content: flex-start;
  align-items: center;
  padding-left: 3%;
  margin-bottom: 2%;
  background-color: white;
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

#brewery-summary-info {
  padding-left: 3%;
}

#beer-summary-style-abv {
  display: flex;
}
</style>