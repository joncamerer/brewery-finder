<template>
  <div>
    <div v-if="showEdit">
      <update-review-form v-bind:review="review" />
      <button type="button" v-on:click="toggleEditReview()">edit</button>
    </div>
    <div v-else>
      <p>{{ review.reviewText }}</p>
      <p>- {{ review.reviewerUsername }}</p>
      <div v-if="$store.state.user.id == review.reviewerId">
        <button type="button" v-on:click="toggleEditReview()">edit</button>
      </div>
    </div>
  </div>
</template>

<script>
import UpdateReviewForm from "@/components/forms/UpdateReviewForm.vue";

export default {
  components: { UpdateReviewForm },
  props: {
    review: Object,
  },
  data() {
    return {
      showEdit: false,
    };
  },
  methods: {
    toggleEditReview() {
      this.showEdit = !this.showEdit;
    },
  },
};
</script>

<style>
</style>