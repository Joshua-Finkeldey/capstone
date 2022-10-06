<template>
  <div class="ingredients">
    <h2>Ingredients</h2>
    <div class="ingredient" v-for="ingredient in ingredients" v-bind:key="ingredient.id">
      <h3>{{ ingredient.ingredientName }}</h3>
      <p class="out-of-stock" v-if="!ingredient.available">OUT OF STOCK</p>
      <p>{{ ingredient.tier }}</p>
    </div>
  </div>
</template>

<script>
export default {
  name: 'ingredients-list',
  props: ['ingredients']
};
</script>

<style scoped>
.ingredients {
  background-color: #f7fafc;
  border-radius: 10px;
  padding: 10px 20px 20px 20px;
}
.ingredients h2 {
  margin: 0 0 30px 0;
}
.ingredient {
  margin: 20px 0;
  border-bottom: 1px solid rgb(180, 180, 180);
}
.ingredient:last-child {
  border-bottom: none;
}
.ingredient h3 {
  margin-bottom: 0;
}
.out-of-stock {
  margin-top: 4px;
  font-size: 0.75rem;
}
</style>