<template>
  <div id="home-box">
    <Header />
    <div id="home-body-box">
      <div id="home-main">
        <brewery-list />
      </div>

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
#home-box {
  display: flex;
  flex-direction: column;
}

#header {
  height: 20%;
}

#home-body-box {
  display: flex;
  flex-direction: row;
  height: 80%;
}

#home-main {
  display: flex;
  margin-right: 10px;
}

#home-sidebar {
  display: flex;
  flex-direction: column;
}
</style>