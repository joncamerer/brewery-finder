<template>
  <div id="app">
    <router-view />
  </div>
</template>

<script>
export default {};
</script>

<style>
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

html {
  display: flex;
  height: 100vh;
  width: 100vw;
}

body {
  display: flex;

  background-color: var(--color-one);
  font-family: "Helvitica";
}

#app {
  display: flex;
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

