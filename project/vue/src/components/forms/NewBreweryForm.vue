<template>
  <div>
    <p id="new-brewery-blurb">
      Welcome to Brewery Finder! We're comitted to helping thirsty people find a
      good brew. Fill out this form to add your brewery to our list
    </p>
    <form id="new-brewery-form" v-on:submit.prevent="addBrewery()">
      <div class="new-brewery-item">
        <input
          id="new-brewery-name"
          class="new-brewery-input"
          type="text"
          placeholder="Brewery Name"
          v-model="newBrewery.breweryName"
        />
      </div>

      <div class="new-brewery-item">
        <input
          id="new-brewery-address"
          class="new-brewery-input"
          type="text"
          placeholder="Street Address"
          v-model="newBrewery.breweryStreetAddress"
        />
      </div>

      <div class="new-brewery-item">
        <input
          id="new-brewery-city"
          class="new-brewery-input"
          type="text"
          placeholder="City"
          v-model="newBrewery.breweryCity"
        />
      </div>

      <div class="new-brewery-item">
        <input
          id="new-brewery-state"
          class="new-brewery-input"
          type="text"
          placeholder="State"
          v-model="newBrewery.breweryState"
        />
      </div>

      <div class="new-brewery-item">
        <input
          id="new-brewery-zip"
          class="new-brewery-input"
          type="text"
          placeholder="Zip Code"
          v-model="newBrewery.breweryZipCode"
        />
      </div>

      <div class="new-brewery-item">
        <input
          id="new-brewery-website"
          class="new-brewery-input"
          type="text"
          placeholder="Website"
          v-model="newBrewery.breweryWebsite"
        />
      </div>
      <div class="new-brewery-item">
        <button id="new-brewery-submission" type="submit">Save Brewery</button>
      </div>
    </form>
  </div>
</template>

<script>
import breweryService from "@/services/BreweryService";

export default {
  data() {
    return {
      newBrewery: {
        brewerId: this.$store.state.user.id,
      },
    };
  },
  methods: {
    addBrewery() {
      breweryService.create(this.newBrewery).then((response) => {
        if (response.status === 201) {
          this.newBrewery = {};
          this.$router.go();
        }
      });
    },
  },
};
</script>

<style>
#new-brewery-form {
  display: flex;
  flex-direction: column;

  font-size: 17px;
}

.new-brewery-input {
  flex-grow: 1;
}
</style>