
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
.flex-container-card {
  display: flex;
  justify-content: space-between;
  align-items: flex-end;
}

.flex-container-card button {
  height: 20px;
}

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

/* card temp border */
.card {
  border: 2px solid black;
  border-radius: 15px;
  padding: 3px;
  margin: 4%;
  box-shadow: 3px 2px 14px rgba(white, 0.2);
  transition: all 200ms ease-in-out;
  background-color: white;

  /* beer card */
  opacity: 50%;
  color: rgb(8, 8, 4);
  filter: blur(0.7px);
  /* font-size: 20px; */

  /* test */
}

.card:hover {
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

.user-info {
  display: flex;
  flex-direction: column;
  border: 2px solid black;
  padding: 2.25em;
  width: 150px;
  background-color: white;
  border-radius: 129%;
  opacity: 90%;
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
::-webkit-scrollbar {
  background-color: rgb(247, 247, 147, 0.6);
  border-radius: 10px;
}
::-webkit-scrollbar-thumb {
  border-radius: 10px;
  box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.96);
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

.form-register {
  height: auto;
  width: 250px;

  background-color: rgb(247, 243, 240);
  border: 3px solid black;
  border-radius: 12px;
  padding: 3%;
  opacity: 90%;

  left: 50%;
  top: 50%;
  margin-left: -25%;
  position: absolute;
  margin-top: -13%;
}

.form-register:hover {
  opacity: 100%;
}
/* contact card css */
.contact {
  border: 2px solid black;
  border-radius: 15px;
  background-color: white;
  font-weight: bolder;
  font-size: 17px;
  padding-left: 3%;
  border-bottom: 6px solid black;
  border-right: 6px solid black;
  border-top: 0px;
  border-left: 0px;
  filter: blur(0px);
  opacity: 90%;
  margin-right: 33%;
  margin-left: 3%;
}
.contact h2 {
  text-decoration: underline;
  font-size: 40px;
  color: rgb(175, 150, 7);
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

  --main-header-text: 50px;
  --section-header-text: 25px;
}

body {
  background-color: var(--color-one);
  font-family: "Helvitica";
}

.sidebar-scrollbox {
  overflow-y: scroll;
  height: 20vh;
}

.sidebar-item {
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

.sidebar-item:hover {
  transform: translateY(-1rem);
  box-shadow: 3px 2px 18px rgba(255.255.255, 0.4);
  color: rgb(175, 150, 7);
  font-weight: 900;
  font-size: 30px;
  text-decoration: underline;
  border-bottom: 6px solid black;
  border-right: 6px solid black;
  border-top: 0px;
  border-left: 0px;
  filter: blur(0px);
  opacity: 90%;
}

@import url("http://fonts.cdnfonts.com/css/biergarten");
@import url("https://fonts.googleapis.com/css2?family=Bungee+Shade&display=swap");
</style>

