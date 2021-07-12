<template>
  <div id="app">
    <router-view />
  </div>
</template>

<script>
export default {};
</script>

<style>
.events-list {
  grid-area: events-list;
  background: transparent;
  border-radius: 10px;
  /* border: 6px solid black; */

  height: 600px;
  margin-bottom: 18.5%;
  padding-bottom: 10px;
  font-size: 1.75em;
  padding: 45px;
  overflow-y: scroll;
  margin-top: 70px;
  margin-left: -4%;
  margin-right: 6%;
}

.events {
  color: gold;
}

.update-form {
  /* margin-left:10%; */
  border: 2px solid black;
  border-radius: 15px;
  background-color: rgb(247, 221, 104);
  font-weight: bolder;
  font-size: 17px;
  padding: 1%;
  padding-left: 3%;
  border-bottom: 6px solid black;
  border-right: 6px solid black;
  border-top: 0px;
  border-left: 0px;
  filter: blur(0px);
  opacity: 90%;
  width: 500px;
  margin-left: 40px;
}

.text {
  color: white;
}

.reviews {
  color: gold;
}

.beer-menu {
  margin: 1%;
  padding: 3%;
}

/* STYLES WHICH BELONG IN APP.JS */
:root {
  --color-one: #fff897;
  --color-two: #fae96f;
  --color-three: #f6c101;
  --color-four: #ec9d00;
  --color-five: #df8d03;
  --color-six: #c96e12;
  --color-seven: rgb(153, 119, 8);

  --main-header-text: 50px;
  --section-header-text: 25px;
  --card-header: 25px;
  --card-body: 18px;
  --body-text: 12px;
}

.tab {
  display: inline-block;
  margin-left: 30px;
}

.hidden-label {
  display: none;
}

body {
  background-color: var(--color-one);
  font-family: "Helvitica";

  margin: 0;
  min-height: 100vh;
}

textarea {
  font-family: "Helvitica";
}

.list-title-bar {
  display: flex;
}

.list-title {
  font-size: var(--section-header-text);
  color: var(--color-two);
  background-color: var(--color-five);
  margin-top: 0;
  min-height: 35px;
  padding-left: 3%;

  flex-grow: 1;
}

.list-title-button {
  font-size: var(--section-header-text);
  margin-bottom: 0.67em;
  min-width: 40px;
}

.summary-title {
  font-size: var(--card-header);
}

.summary-text {
  font-size: var(--card-body);
  margin: 0;
}

.summary-text > p {
  margin: 0.5em 0em;
}

.summary-list-item {
  margin-left: 15px !important;
}

.sidebar-scrollbox {
  overflow-y: scroll;
}

.sidebar-summary {
  display: flex;
  flex-direction: column;
  margin-bottom: 3%;
  background-color: white;
  padding-left: 3%;
}
</style>

