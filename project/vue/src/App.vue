<template>
  <div id="app">
    <router-view />
  </div>
</template>

<script>
export default {};
</script>

<style>
/* brewery card on home page */

.beer-summary {
  grid-area: beer-summary;
  /* border: 2px solid white; */
  color: white;
  font-size: 1.5em;
  color: gold;
}

.beer-name-link {
  text-decoration: none;
  color: gold;
}

.reviews {
  font-size: 1.5em;
}

/* end of card test */

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

.beer-menu-box {
  border: 1px solid gold;
  display: flex;
  justify-content: space-between;
  align-items: center;
  border-radius: 15px;
  padding: 1%;
  margin: 2%;
  box-shadow: 3px 2px 14px rgba(white, 0.2);
  transition: all 200ms ease-in-out;
  background-color: white;
  margin-left: -1%;
  /* beer card */
  opacity: 50%;
  color: rgb(8, 8, 4);
  filter: blur(0.7px);
}
.beer-menu-box:hover {
  transform: translateY(-1rem);
  box-shadow: 3px 2px 18px rgba(255.255.255, 0.4);
  color: rgb(8, 8, 4);
  font-weight: bolder;
  font-size: 17px;
  font-size: 45px;
  border-bottom: 6px solid black;
  border-right: 6px solid black;
  border-top: 0px;
  border-left: 0px;
  filter: blur(0px);
  opacity: 90%;
}
.beerimg {
  border: 0px;
  border-radius: 4px;
  object-fit: scale-down;
}
.beerimg:hover {
  border: 0px;
}
.beer-des {
  font-size: 25px;
  background: transparent;
  background-color: white;
  opacity: 88%;
  color: black;
  padding: 2%;
  font-weight: bolder;
  text-decoration: underline;

  border-radius: 20px;
}

.reviews {
  opacity: 100%;
}

.reviews1 {
  font-size: 25px;
  background: transparent;
  background-color: white;
  opacity: 90%;
  color: black;
  padding: 2%;
  font-weight: bolder;

  border-radius: 20px;
}
.rating {
  color: rgb(223, 212, 62);
  font-weight: bolder;
  align-items: center;
  border: 6px ridge green;
  margin-right: 92%;
  padding: 0.5%;
  font-size: 30px;
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

