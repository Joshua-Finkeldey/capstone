<template>
  <employee-orders-list v-bind:boardId="this.boardId" />
</template>

<script>

import EmployeeOrdersList from "@/components/EmployeeOrdersList";

export default {
  components: {
    EmployeeOrdersList
  },
  data() {
    return {
      boardId: 0
    };
  },
  created() {
    this.boardId = parseInt(this.$route.params.id);
    this.$store.commit("SET_ACTIVE_BOARD", this.boardId);
  }
};
</script>
