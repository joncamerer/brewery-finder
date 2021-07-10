<template>
  <div id="brewery-contact">
    <div class="list-title-bar">
      <h1 id="brewery-contact-list-title" class="list-title">Contact Info</h1>
      <button
        id="toggle-update-brewery-button"
        class="list-title-button"
        type="button"
        v-if="$store.state.user.id == brewery.brewerId"
        v-on:click="toggleUpdateBrewery()"
      >
        {{ showUpdateBrewery ? "-" : "+" }}
      </button>
    </div>

    <div id="update-brewery-form-box" v-if="showUpdateBrewery">
      <update-brewery-form
        v-bind:brewery="this.brewery"
        v-on:hideForm="toggleUpdateBrewery()"
      />
    </div>

    <div id="brewery-contact-info" v-else>
      <h1 class="summary-title">{{ brewery.breweryName }}</h1>
      <p class="summary-text">{{ brewery.breweryStreetAddress }}</p>
      <div id="brewery-contact-city-state-zip" class="summary-text">
        <p>{{ brewery.breweryCity }}</p>
        <p class="summary-list-item">{{ brewery.breweryState }}</p>
        <p class="summary-list-item">{{ brewery.breweryZipCode }}</p>
      </div>
      <a
        id="brewery-website-link"
        class="summary-text"
        v-bind:href="brewery.breweryWebsite"
        target="_Blank"
        >Website</a
      >
    </div>
  </div>
</template>

<script>
import UpdateBreweryForm from "@/components/forms/UpdateBreweryForm.vue";

export default {
  components: { UpdateBreweryForm },
  props: {
    brewery: Object,
  },
  data() {
    return {
      showUpdateBrewery: false,
    };
  },
  methods: {
    toggleUpdateBrewery() {
      this.showUpdateBrewery = !this.showUpdateBrewery;
    },
  },
};
</script>

<style>
#update-brewery-form-box {
  display: flex;
  padding: 1%;
  background-color: var(--color-three);
  flex-direction: column;
  align-items: stretch;
}

#brewery-contact-info {
  padding-left: 3%;
  background-color: #fff;
}

#brewery-contact-city-state-zip {
  display: flex;
}

#brewery-website-link {
  text-decoration: none;
}
</style>