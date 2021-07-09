<template>
  <div
    id="brewery-summary"
    @mouseover="showButtons = true"
    @mouseleave="showButtons = false"
  >
    <div id="brewery-summary-info">
      <h1 class="summary-title">{{ brewery.breweryName }}</h1>
      <div id="brewery-summary-city-state" class="summary-text">
        <p>{{ brewery.breweryCity }}</p>
        <p class="summary-list-item">{{ brewery.breweryState }}</p>
      </div>
    </div>

    <div id="view-brewery-details-holder" v-show="!showButtons"></div>
    <div id="view-brewery-details-button" v-show="showButtons">
      <router-link
        id="bs-link"
        :to="{ name: 'breweryDetails', params: { id } }"
        v-if="$store.state.token != ''"
      >
        <button id="brewery-details-button">View Details</button>
      </router-link>
      <button v-on:click="redirectLogin()" v-else>
        Log in to View Details
      </button>
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
      id: this.brewery.id,
    };
  },
  methods: {
    redirectLogin() {
      console.log("do focus, emit to home view use refs to access?");
    },
  },
};
</script>

<style>
#brewery-summary {
  display: flex;
  justify-content: space-between;
  align-items: stretch;

  background-color: #fff;
  margin-bottom: 3%;
}

#brewery-summary-info {
  display: flex;
  flex-grow: 1;
  flex-direction: column;
  padding-left: 3%;
}

#brewery-summary-city-state {
  display: flex;
}

#view-brewery-details-button {
  display: flex;
}

#view-brewery-details-button button {
  width: 90px;
}

#view-brewery-details-holder {
  width: 90px;
}

#bs-link {
  display: flex;
  text-decoration: none;
}

#brewery-details-button {
  white-space: nowrap;
}
</style>