<template>
  <div class="reviews">
    <h2>REVIEWS</h2>
    <new-review-form v-bind:beer="beer.id" />

    <h6>
      Average Rating:
      <div class="rating">{{ averageRating }}</div>
    </h6>

    <p
      v-for="review in reviews"
      v-bind:key="review.id"
      v-bind:review="review"
      class="reviews1"
    >
      - {{ review.reviewText }}
    </p>
  </div>
</template>

<script>
import NewReviewForm from "@/components/forms/NewReviewForm.vue";

import reviewService from "@/services/ReviewService";

export default {
  components: { NewReviewForm },
  props: {
    beer: Object,
  },
  data() {
    return {
      reviews: [],
    };
  },
  computed: {
    averageRating() {
      let total = 0.0;
      this.reviews.forEach((review) => {
        total += review.starRating;
      });
      return (total / this.reviews.length).toFixed(2);
    },
  },
  created() {
    reviewService.listByBeerId(this.beer.id).then((response) => {
      if (response.status == 200) {
        this.reviews = response.data;
      }
    });
  },
};
</script>

<style>
</style>