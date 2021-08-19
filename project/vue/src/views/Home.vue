<template>
  <div id="home-box">
    <Header />
    <div id="home-body-box">
      <brewery-list />
      <div id="home-sidebar">
        <top-rated />
        <events-list />
      </div>
    </div>
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
  width: 60vw;
  margin-right: 10px;
}

#top-rated-list {
  grid-area: top-rated;
}

#events-list {
  grid-area: events;
}

#home-box {
  display: flex;
  flex-direction: column;
}

#home-body-box {
  display: flex;
}

#home-sidebar {
  display: flex;
  flex-direction: column;
}
</style>