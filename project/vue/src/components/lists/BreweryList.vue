<template>
  <div id="brewery-list">
    <div id="brewery-list-title-form" ref="titleForm">
      <h1 id="brewery-list-title" class="list-title">Breweries:</h1>
      <button
        id="show-add-brewery"
        v-if="
          $store.state.token != '' &&
          $store.state.user.accountType == 'Administrator'
        "
        v-on:click="showAddBrewery = !showAddBrewery"
      >
        {{ showAddBrewery ? "-" : "+" }}
      </button>
    </div>

    <new-brewery-form v-if="showAddBrewery" />

    <div v-else class="search-bar" ref="search">
      <label for="search-name">Search: </label>
      <input
        id="search-name"
        type="text"
        placeholder="Brewery Name"
        v-model="filter.breweryName"
      />
      <input
        id="search-city"
        type="text"
        placeholder="City"
        v-model="filter.breweryCity"
      />
      <input
        id="search-state"
        type="text"
        placeholder="State"
        v-model="filter.breweryState"
      />
    </div>

    <div id="brewery-card-scrollbox">
      <brewery-summary
        v-for="brewery in filteredBreweries"
        v-bind:key="brewery.id"
        v-bind:brewery="brewery"
      />
    </div>
  </div>
</template>

<script>
import BrewerySummary from "@/components/summaries/BrewerySummary";
import NewBreweryForm from "@/components/forms/NewBreweryForm.vue";
import BreweryService from "@/services/BreweryService";

export default {
  components: { BrewerySummary, NewBreweryForm },

  data() {
    return {
      breweries: [],
      filter: {
        breweryName: "",
        breweryCity: "",
        breweryState: "",
      },
      showAddBrewery: false,
    };
  },
  created() {
    BreweryService.list().then((response) => {
      this.$store.commit("SET_BREWERIES", response.data);
      this.breweries = this.$store.state.breweries;
    });
  },
  computed: {
    filteredBreweries() {
      return this.breweries.filter((brewery) => {
        let nameMatch = brewery.breweryName
          .toLowerCase()
          .includes(this.filter.breweryName.toLowerCase());
        let cityMatch = brewery.breweryCity
          .toLowerCase()
          .includes(this.filter.breweryCity.toLowerCase());
        let stateMatch = brewery.breweryState
          .toLowerCase()
          .includes(this.filter.breweryState.toLowerCase());

        if (
          (!this.filter.breweryName || nameMatch) &&
          (!this.filter.breweryCity || cityMatch) &&
          (!this.filter.breweryState || stateMatch)
        ) {
          return brewery;
        }
      });
    },
  },
};
</script>

<style>
#brewery-list {
  display: flex;
  flex-direction: column;

  height: max-content;
}

#brewery-list-title-form {
  display: flex;
  justify-content: space-between;
}

#brewery-list-title {
  flex-grow: 1;
}

#show-add-brewery {
  font-size: var(--section-header-text);

  margin-bottom: 0.67em;
}

.search-bar {
  display: flex;
  justify-content: space-around;
  margin-bottom: 2%;
  padding: 1.5%;

  background-color: rgb(153, 119, 8);
  color: white;
}

#brewery-card-scrollbox {
  display: flex;
  flex-direction: column;

  overflow-y: scroll;
  max-height: 55vh;
}
</style>