<template>
  <div>
    <p>{{ review.reviewText }}</p>
    <p>- {{ review.reviewerUsername }}</p>
  </div>
</template>

<script>
export default {
  props: {
    review: Object,
  },
};
</script>

<style>
</style>