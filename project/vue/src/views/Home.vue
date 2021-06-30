<template>
  <div id="home-grid">
    <Header />
    <events-list />
    <brewery-list />
    <top-rated />
  </div>
</template>

<script>
import Header from "@/components/headers/Header.vue";
import BreweryList from "@/components/lists/BreweryList.vue";
import TopRated from "@/components/lists/TopRatedList.vue";
import EventsList from "@/components/lists/EventsList.vue";

export default {
  components: { Header, BreweryList, EventsList, TopRated },
  name: "home",
};
</script>

<style>
#header {
  grid-area: header;
}

#brewery-list {
  grid-area: breweries;
}

#top-rated-list {
  grid-area: top-rated;
}

#events-list {
  grid-area: events;
}

#home-grid {
  max-height: 100%;
  display: grid;
  grid-gap: 3%;

  grid-template-columns: 3fr 2fr;
  grid-template-areas:
    "header header"
    "breweries top-rated"
    "breweries events";
}

.list-title {
  font-size: 25px;
  color: white;
  background-color: rgb(92, 76, 43);
  border-radius: 20px;
  padding: 1%;
}
</style>