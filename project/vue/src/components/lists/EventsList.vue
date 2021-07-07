<template>
  <div id="events-list">
    <h1 class="list-title">Upcoming Events:</h1>
    <div class="sidebar-scrollbox">
      <events-summary
        v-for="event in allEvents"
        v-bind:key="event.id"
        v-bind:event="event"
      />
    </div>
  </div>
</template>

<script>
import EventService from "@/services/EventService";
import EventsSummary from "../EventsSummary.vue";

export default {
  components: { EventsSummary },
  data() {
    return {
      allEvents: [],
    };
  },
  created() {
    EventService.listUpComing().then((response) => {
      if (response.status === 200) {
        this.allEvents = response.data;
      }
    });
  },
};
</script>

<style>
#events-list {
  height: max-content;
}

#events-scrollbox {
  overflow-y: scroll;
  height: 20vh;
}
</style>