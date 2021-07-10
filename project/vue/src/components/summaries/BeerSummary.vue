<template>
  <div id="beer-summary">
    <div id="beer-summary-info" v-on:click="toggleHidden()">
      <div id="beer-summary-image-box">
        <img id="beer-summary-image" :src="beer.beerImage" />
      </div>
      <h1 class="beer-name">{{ beer.beerName }}</h1>
      <p class="beer-style">{{ beer.beerStyle }}</p>
      <p class="beer-abv">{{ beer.beerAbv + "%" }}</p>
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
#beer-summary-info {
  display: flex;
  justify-content: space-between;
  align-items: center;
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
</style>