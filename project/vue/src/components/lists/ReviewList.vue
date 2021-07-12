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
</style>