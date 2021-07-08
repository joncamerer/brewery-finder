<template>
  <div class="sidebar-summary">
    <h1 class="summary-title">{{ event.eventName }}</h1>
    <div id="event-time-brewery" class="summary-text">
      <p>{{ event.eventDate }}</p>
      <p class="summary-list-item">{{ formatTime(event.eventTime) }}</p>
      <p class="summary-list-item">
        {{ getBreweryName(event.breweryId) }} {{ breweryName }}
      </p>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      breweryName: "",
    };
  },
  props: {
    event: Object,
  },
  methods: {
    formatTime(time) {
      let hour = time.substring(0, 2);
      const min = time.substring(2, 5);
      let period = " AM";

      if (hour == 12) {
        period = " PM";
      } else if (hour == 0) {
        hour = 12;
      } else if (hour > 12) {
        hour = hour % 12;
        period = " PM";
      }

      return hour + min + period;
    },
    getBreweryName(breweryId) {
      let breweries = this.$store.state.breweries;

      breweries.forEach((brewery) => {
        if (brewery.id == breweryId) {
          this.breweryName = brewery.breweryName;
        }
      });
    },
  },
};
</script>

<style>
#event-time-brewery {
  display: flex;
}
</style>