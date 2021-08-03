<template>
  <div id="Update-review-blurb-form">
    <p>Changed your mind? Update your review</p>
    <form id="update-review-form" v-on:submit.prevent="updateReview()">
      <div class="update-review-item">
        <label class="hidden-label" for="update-review-star-rating"
          >Review Star Rating</label
        >
        <select id="update-review-star-rating" v-model="newReview.starRating">
          <option value="">--Please select a star rating</option>
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
        </select>
      </div>

      <div class="update-review-item">
        <label class="hidden-label" for="update-review-text">Review Text</label>
        <textarea
          id="update-review-text"
          placeholder="Review Text"
          v-model="newReview.reviewText"
        />
      </div>

      <div id="new-review-submission-bar">
        <button type="submit">Submit</button>
      </div>
    </form>
  </div>
</template>

<script>
export default {
  props: {
    review: Object,
  },
  data() {
    return {
      newReview: {},
    };
  },
  created() {
    this.newReview.starRating = this.review.starRating;
    this.newReview.reviewText = this.review.reviewText;
  },
  methods: {
    updateReview() {
      console.log("update");
    },
  },
};
</script>

<style>
</style>