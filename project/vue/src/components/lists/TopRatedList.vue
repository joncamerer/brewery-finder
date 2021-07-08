<template>
  <div id="top-rated-list">
    <h1 class="list-title">Top Rated Beers:</h1>
    <div id="top-rated-scrollbox">
      <top-rated-summary v-for="beer in beers" :key="beer.id" :beer="beer" />
    </div>
  </div>
</template>

<script>
import beerService from "@/services/BeerService";
import TopRatedSummary from "@/components/summaries/TopRatedSummary.vue";

export default {
  components: { TopRatedSummary },
  data() {
    return {
      beers: [],
    };
  },
  created() {
    beerService.listTopRated().then((response) => {
      if (response.status === 200) {
        this.beers = response.data;
      }
    });
  },
};
</script>

<style>
#top-rated-scrollbox {
  overflow-y: scroll;
  height: 30vh;
}
</style>