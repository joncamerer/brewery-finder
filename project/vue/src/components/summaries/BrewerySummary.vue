<template>
  <div
    class="brewery-summary-card"
    @mouseover="showButtons = true"
    @mouseleave="showButtons = true"
  >
    <div id="brewery-summary-info">
      <h1 id="brewery-summary-name">{{ brewery.breweryName }}</h1>
      <h1 id="brewery-summary-location">
        {{ brewery.breweryCity + ", " + brewery.breweryState }}
      </h1>
    </div>

    <div id="view-brewery-details-button" v-show="showButtons">
      <button v-on:click="viewDetails()" v-if="$store.state.token != ''">
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
  data() {
    return {
      showButtons: true,
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
  align-items: flex-end;

  background-color: #fff;
  margin-bottom: 3%;
}

#brewery-summary-info {
  display: flex;
  flex-direction: column;
  padding-left: 3%;
}

/* card temp border */
.cord {
  border: 2px solid black;
  border-radius: 15px;
  padding: 3px;
  margin: 4%;
  box-shadow: 3px 2px 14px rgba(white, 0.2);
  transition: all 200ms ease-in-out;
  background-color: white;

  opacity: 50%;
  color: rgb(8, 8, 4);
  filter: blur(0.7px);
}

.cord:hover {
  transform: translateY(-1rem);
  box-shadow: 3px 2px 18px rgba(255.255.255, 0.4);
  color: rgb(175, 150, 7);
  font-weight: 900;
  font-size: 24px;
  text-decoration: underline;
  border-bottom: 6px solid black;
  border-right: 6px solid black;
  border-top: 0px;
  border-left: 0px;
  filter: blur(0px);
  opacity: 90%;
}
</style>