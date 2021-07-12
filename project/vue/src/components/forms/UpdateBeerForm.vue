<template>
  <div id="update-brewery-blurb-form">
    <p>Update this beer's information</p>
    <form id="update-beer-form" v-on:submit.prevent="updateBeer()">
      <div class="update-beer-item">
        <label class="hidden-label" for="update-beer-name">Beer Name</label>
        <input
          id="update-beer-name"
          type="text"
          placeholder="Beer Name"
          v-model="newBeer.beerName"
        />
      </div>

      <div class="update-beer-item">
        <label class="hidden-label" for="update-beer-abv">Beer ABV</label>
        <input
          id="update-beer-abv"
          type="text"
          placeholder="ABV"
          v-model="newBeer.beerAbv"
        />
      </div>

      <div class="update-beer-item">
        <label class="hidden-label" for="update-beer-style">Beer Style</label>
        <input
          id="update-beer-style"
          type="text"
          placeholder="Style"
          v-model="newBeer.beerStyle"
        />
      </div>

      <div class="update-beer-item">
        <label class="hidden-label" for="update-beer-descriptions"
          >Beer Description</label
        >
        <textarea
          id="update-beer-description"
          placeholder="Description"
          v-model="newBeer.beerDescription"
        />
      </div>

      <div id="update-beer-submission-bar">
        <button type="submit">Update</button>
        <button type="button" v-on:click="hideForm()">Cancel</button>
        <button type="button" v-on:click="deactivate()">Delete</button>
      </div>
    </form>
  </div>
</template>

<script>
import beerService from "@/services/BeerService";

export default {
  props: {
    beer: Object,
  },
  data() {
    return {
      newBeer: {},
    };
  },
  created() {
    this.newBeer.beerName = this.beer.beerName;
    this.newBeer.beerAbv = this.beer.beerAbv;
    this.newBeer.beerStyle = this.beer.beerStyle;
    this.newBeer.beerDescription = this.beer.beerDescription;
  },
  methods: {
    updateBeer() {
      this.newBeer.active = this.beer.active;
      this.newBeer.beerImage = this.beer.beerImage;
      this.newBeer.breweryId = this.beer.breweryId;
      this.newBeer.id = this.beer.id;

      beerService.update(this.beer.id, this.newBeer).then((response) => {
        if (response.status === 200) {
          this.$router.go();
        }
      });
    },
    hideForm() {
      this.$emit("hideForm");
    },
    deactivate() {
      if (confirm("Are you sure you want to permanently delete this beer?"))
        beerService.delete(this.beer.id).then((response) => {
          if (response.status === 200) {
            this.$router.go();
          }
        });
    },
  },
};
</script>

<style>
#update-beer-form {
  display: flex;
  flex-direction: column;

  padding: 0% 5%;
}

.update-beer-item {
  display: flex;
  flex-direction: column;
  padding-bottom: 3%;
}

#update-beer-submission-bar {
  display: flex;
  justify-content: space-around;
  flex-wrap: wrap;
}
</style>