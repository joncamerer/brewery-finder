<template>
  <div
    class="brewery-summary-card"
    @mouseover="showButtons = true"
    @mouseleave="showButtons = false"
  >
    <div id="brewery-summary-info">
      <h1 id="brewery-summary-name">{{ brewery.breweryName }}</h1>
      <h1 id="brewery-summary-location">
        {{ brewery.breweryCity + ", " + brewery.breweryState }}
      </h1>
    </div>

    <div id="view-brewery-details-button" v-show="showButtons">
      <button
        id="brewery-details-button"
        v-on:click="viewDetails()"
        v-if="$store.state.token != ''"
      >
        View Details
      </button>
      <button v-else>Log in View Details</button>
    </div>
  </div>
</template>


<script>
export default {
  props: {
    brewery: Object,
  },
  emits: ["loginRedirect"],
  data() {
    return {
      showButtons: false,
    };
  },
  methods: {
    viewDetails() {
      const id = this.brewery.id;
      this.$router.push({ name: "breweryDetails", params: { id } });
    },
  },
};
</script>

<style>
.brewery-summary-card {
  display: flex;
  justify-content: space-between;
  align-items: stretch;

  background-color: #fff;
  margin-bottom: 3%;
}

#brewery-summary-info {
  display: flex;
  flex-direction: column;
  padding-left: 3%;
}

#brewery-summary-location {
  font-size: var(--card-body);
}

#view-brewery-details-button {
  display: flex;
  width: 90px;
}

#brewery-details-button {
  white-space: nowrap;
}
</style>