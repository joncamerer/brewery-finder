<template>
  <div id="new-review-blurb-form">
    <p>Leave us a review</p>
    <form id="new-review-form" v-on:submit.prevent="addReview()">
      <div class="new-review-item">
        <label class="hidden-label" for="new-review-star-rating"
          >Review Star Rating</label
        >
        <select id="new-review-star-rating" v-model="newReview.starRating">
          <option value="">--Please select a star rating</option>
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
        </select>
      </div>

      <div class="new-review-item">
        <label class="hidden-label" for="new-review-text">Review Text</label>
        <textarea
          id="new-review-text"
          placeholder="Review Text"
          v-model="newReview.reviewText"
        />
      </div>

      <div id="new-review-submission-bar">
        <button type="submit">Submit</button>
        <button type="button" v-on:click="hideForm()">Cancel</button>
      </div>
    </form>
  </div>
</template>

<script>
import reviewService from "@/services/ReviewService";
export default {
  data() {
    return {
      newReview: {
        beerId: this.beerId,
        reviewerId: this.$store.state.user.id,
      },
    };
  },
  props: {
    beerId: Number,
  },
  methods: {
    addReview() {
      this.newReview.starRating = parseInt(this.newReview.starRating);

      reviewService.create(this.newReview).then((response) => {
        if (response.status === 201) {
          this.$router.go();
        }
      });
    },
    hideForm() {
      this.$emit("hideForm");
    },
  },
};
</script>

<style>
#new-review-form {
  display: flex;
  flex-direction: column;
}

.new-review-item {
  display: flex;
  flex-direction: column;
}

#new-review-submission-bar {
  display: flex;
  justify-content: space-around;
}
</style>