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
        <div id="star-rating">
          <img
            class="star"
            src="@/images/star.png"
            v-for="n in stars"
            v-bind:key="n"
          />
          <div
            id="decimal-star"
            :style="{
              width: decimalPixels + 'px',
            }"
          >
            <img class="star" src="@/images/star.png" />
          </div>
        </div>
      </div>

      <div v-if="reviews.length > 0">
        <review-summary
          v-for="review in reviews"
          v-bind:key="review.id"
          v-bind:review="review"
        />
      </div>
      <div v-else>
        <p>Be the first to add a review for this beer!</p>
      </div>
    </div>
  </div>
</template>

<script>
import NewReviewForm from "@/components/forms/NewReviewForm.vue";
import ReviewSummary from "@/components/summaries/ReviewSummary.vue";

import reviewService from "@/services/ReviewService";

export default {
  components: { NewReviewForm, ReviewSummary },
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

      if (total > 0.0) {
        return (total / this.reviews.length).toFixed(2);
      }
      return total;
    },
    stars() {
      return Math.floor(this.averageRating);
    },
    decimalPixels() {
      return (this.averageRating - this.stars) * 40;
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

#star-rating {
  display: flex;
  width: 255px;
}

.star {
  max-height: 40px;
}

#decimal-star {
  overflow: hidden;
}

#average-rating {
  border: 6px ridge green;
}
</style>