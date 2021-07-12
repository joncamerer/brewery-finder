<template>
  <div id="review-list">
    <div class="list-title-bar">
      <h1 class="list-title">Reviews</h1>
      <button
        class="list-title-button"
        type="button"
        v-on:click="toggleAddReview()"
      >
        {{ showAddReview ? "-" : "+" }}
      </button>
    </div>

    <div v-if="showAddReview">
      <new-review-form
        v-bind:beerId="beer.id"
        v-on:hideForm="toggleAddReview()"
      />
    </div>

    <div v-else>
      <div id="review-average-rating-bar">
        <h1 class="summary-title">Rating</h1>
        <p id="average-rating" class="summary-text">{{ averageRating }}</p>
      </div>

      <p
        v-for="review in reviews"
        v-bind:key="review.id"
        v-bind:review="review"
        id="review-text"
        class="summary-text"
      >
        - {{ review.reviewText }}
      </p>
    </div>
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
      showAddReview: false,
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
  methods: {
    toggleAddReview() {
      this.showAddReview = !this.showAddReview;
    },
  },
};
</script>

<style>
#review-average-rating-bar {
  display: flex;
  justify-content: space-between;
  align-items: stretch;
}

#average-rating {
  border: 6px ridge green;
}

#review-text {
  padding-bottom: 1%;
}
</style>