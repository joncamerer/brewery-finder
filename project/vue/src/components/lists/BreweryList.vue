<template>
  <div id="brewery-list">
    <div id="brewery-list-title-bar">
      <h1 id="brewery-list-title" class="list-title">Breweries:</h1>
      <button
        id="toggle-new-brewery-button"
        class="list-title-button"
        v-if="
          $store.state.token != '' &&
          $store.state.user.accountType == 'Administrator'
        "
        v-on:click="toggleAddBrewery"
      >
        {{ showAddBrewery ? "-" : "+" }}
      </button>
    </div>

    <div id="new-brewery-form-box" v-if="showAddBrewery">
      <new-brewery-form v-on:hideForm="toggleAddBrewery" />
    </div>

    <div id="list-breweries-box" v-else>
      <div ref="searchBar">
        <div class="search-bar">
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
      </div>

      <div id="brewery-card-scrollbox">
        <brewery-summary
          v-for="brewery in filteredBreweries"
          v-bind:key="brewery.id"
          v-bind:brewery="brewery"
        />
      </div>
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
  methods: {
    toggleAddBrewery() {
      this.showAddBrewery = !this.showAddBrewery;
    },
  },
};
</script>

<style>
#brewery-list {
  display: flex;
  flex-direction: column;
  height: calc(100vh - (170px + 2%));
}

#brewery-list-title-bar {
  display: flex;
  justify-content: space-between;
}

#brewery-list-title {
  flex-grow: 1;
}

#toggle-new-brewery-button {
  min-width: 40px;
}

#new-brewery-form-box {
  display: flex;
  padding: 1%;
  background-color: var(--color-three);
}

#list-breweries-box {
  height: calc(100vh - (170px + 2%));
}

.search-bar {
  display: flex;
  justify-content: space-around;
  margin-bottom: 2%;
  padding: 1.5%;

  background-color: var(--color-seven);
  color: white;
}

#brewery-card-scrollbox {
  display: flex;
  flex-direction: column;

  overflow-y: scroll;
  max-height: calc(100vh - (200px + 51.75px + 41.75px));
}
</style>