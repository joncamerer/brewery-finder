<template>
  <div id="new-beer-blurb-form">
    <p id="new-beer-blurb">Add a new Brew to the menu!</p>
    <form id="new-beer-form" v-on:submit.prevent="addBeer()">
      <div class="new-beer-item">
        <label class="hidden-label" for="new-beer-name">Name: </label>
        <input
          id="new-beer-name"
          type="text"
          placeholder="Beer Name"
          v-model="newBeer.beerName"
        />
      </div>

      <div class="new-beer-item">
        <label class="hidden-label" for="new-beer-style">Style: </label>
        <input
          id="new-beer-style"
          type="text"
          placeholder="Style"
          v-model="newBeer.beerStyle"
        />
      </div>

      <div class="new-beer-item">
        <label class="hidden-label" for="new-beer-desc">Description: </label>
        <textarea
          id="new-beer-desc"
          placeholder="Description"
          v-model="newBeer.beerDescription"
        />
      </div>

      <div class="new-beer-item">
        <label class="hidden-label" for="new-beer-abv">ABV: </label>
        <input
          id="new-beer-abv"
          placeholder="ABV"
          v-model="newBeer.beerAbv"
          type="text"
        />
      </div>

      <div id="new-beer-submission-bar">
        <button type="submit">Save Beer</button>
        <button type="button" v-on:click.prevent="hideForm()">Cancel</button>
      </div>
    </form>
  </div>
</template>

<script>
import beerService from "@/services/BeerService";

export default {
  data() {
    return {
      newBeer: {
        breweryId: this.breweryId,
      },
    };
  },
  props: {
    breweryId: Number,
  },
  methods: {
    addBeer() {
      beerService.create(this.newBeer).then((response) => {
        if (response.status === 201) {
          this.$router.go();
        }
      });
    },
    hideForm() {
      this.$emit("hideForm");
    },
  },
};
</script>

<style>
#new-beer-blurb-form {
  padding: 5% 20%;
}

#new-beer-form {
  display: flex;
  flex-direction: column;

  padding: 0% 5%;
}

.new-beer-item {
  display: flex;
  flex-direction: column;
  padding-bottom: 3%;
}

#new-beer-submission-bar {
  display: flex;
  justify-content: space-around;
  flex-wrap: wrap;
}
</style>