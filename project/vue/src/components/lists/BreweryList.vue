<template>
  <div id="brewery-list">
    <div class="list-title-bar">
      <h1 id="list-title" class="list-title">Breweries:</h1>
      <button
        id="toggle-new-brewery-button"
        class="list-title-button"
        type="button"
        v-if="
          $store.state.token != '' &&
          $store.state.user.accountType == 'Administrator'
        "
        v-on:click="toggleAddBrewery()"
      >
        {{ showAddBrewery ? "-" : "+" }}
      </button>
    </div>

    <div id="new-brewery-form-box" v-if="showAddBrewery">
      <new-brewery-form v-on:hideForm="toggleAddBrewery" />
    </div>

    <div id="list-breweries-scroll" v-else>
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
  width: 60vw;
}

#new-brewery-form-box {
  display: flex;
  padding: 1%;
  background-color: var(--color-three);
}

#list-breweries-scroll {
  overflow: scroll;
}

.search-bar {
  display: flex;
  justify-content: space-around;
  position: sticky;
  top: 0px;

  margin-bottom: 2%;
  padding: 1.5%;

  background-color: var(--color-seven);
  color: white;
}
</style>