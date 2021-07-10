<template>
  <div id="update-brewery-blurb-form">
    <p id="update-brewery-blurb">Update your brewery's information</p>
    <form id="update-brewery-form" v-on:submit.prevent="updateBrewery()">
      <div class="update-brewery-item">
        <label class="hidden-label" for="update-brewery-name"
          >Brewery Name</label
        >
        <input
          id="update-brewery-name"
          type="text"
          placeholder="Brewery Name"
          v-model="breweryToUpdate.breweryName"
        />
      </div>

      <div class="update-brewery-item">
        <label class="hidden-label" for="update-brewer-id">BrewerID</label>
        <input
          id="update-brewer-id"
          type="text"
          placeholder="Brewer ID"
          v-model="breweryToUpdate.brewerId"
        />
      </div>

      <div class="update-brewery-item">
        <label class="hidden-label" for="update-brewery-address">
          Address</label
        >
        <input
          id="update-brewery-address"
          type="text"
          placeholder="Street Address"
          v-model="breweryToUpdate.breweryStreetAddress"
        />
      </div>

      <div class="update-brewery-item" id="update-city-state-zip">
        <label class="hidden-label" for="update-brewery-city"> City</label>
        <input
          id="update-brewery-city"
          class="update-city-state-zip-input"
          type="text"
          placeholder="City"
          v-model="breweryToUpdate.breweryCity"
        />

        <label class="hidden-label" for="update-brewery-state"> State</label>
        <input
          id="update-brewery-state"
          class="update-city-state-zip-input"
          type="text"
          placeholder="State"
          v-model="breweryToUpdate.breweryState"
        />

        <label class="hidden-label" for="update-brewery-zip">Zip</label>
        <input
          id="update-brewery-zip"
          class="update-city-state-zip-input"
          type="text"
          placeholder="Zipcode"
          v-model="breweryToUpdate.breweryZipCode"
        />
      </div>

      <div class="update-brewery-item">
        <label class="hidden-label" for="update-brewery-website"
          >Website
        </label>
        <input
          id="update-brewery-website"
          type="text"
          placeholder="Website"
          v-model="breweryToUpdate.breweryWebsite"
        />
      </div>

      <div id="update-brewery-submission-bar">
        <button type="submit">Update Brewery</button>
        <button type="button" v-on:click.prevent="hideForm()">Cancel</button>
        <button type="button" v-on:click.prevent="deactivate()">Delete</button>
      </div>
    </form>
  </div>
</template>

<script>
import breweryService from "@/services/BreweryService";

export default {
  props: { brewery: Object },
  data() {
    return {
      breweryToUpdate: {
        breweryName: this.brewery.breweryName,
        brewerId: this.brewery.brewerId,
        breweryStreetAddress: this.brewery.breweryStreetAddress,
        breweryCity: this.brewery.breweryCity,
        breweryState: this.brewery.breweryState,
        breweryZipCode: this.brewery.breweryZipCode,
        breweryWebsite: this.brewery.breweryWebsite,
        active: this.brewery.active,
      },
    };
  },
  methods: {
    updateBrewery() {
      breweryService
        .update(this.breweryToUpdate, this.brewery.id)
        .then((response) => {
          if (response.status === 200) {
            this.$router.go();
          }
        });
    },
    hideForm() {
      this.$emit("hideForm");
    },
    deactivate() {
      if (confirm("Are you sure you want to permanently delete this brewery?"))
        breweryService.delete(this.breweryNumber).then((response) => {
          if (response.status === 200) {
            this.$router.push({ name: "home" });
          }
        });
    },
  },
};
</script>

<style>
#update-brewery-blurb-form {
  padding: 5% 20%;
}

#update-brewery-form {
  display: flex;
  flex-direction: column;

  padding: 0% 5%;
}

.update-brewery-item {
  display: flex;
  flex-direction: column;
  padding-bottom: 3%;
}

#update-city-state-zip {
  flex-direction: row;
  flex-wrap: wrap;
  justify-content: space-between;
}

.update-city-state-zip-input {
  flex-grow: 1;
}

#update-brewery-submission-bar {
  display: flex;
  justify-content: space-around;
  flex-wrap: wrap;
}
</style>