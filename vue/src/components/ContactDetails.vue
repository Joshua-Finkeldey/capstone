<template>
  <div class="ContactShadow">
      <h4>{{title}}</h4>
  <div>
       <a href="mailto:backrowboyzpizza@gmail.com" class="btn-container" v-if="typeOfAddress==='email'">{{address}}</a>
       <p v-if="typeOfAddress==='phone'">{{address}}</p>
       <a href="https://www.yelp.com/backrowboyzpizza" v-if="typeOfAddress ==='review'">{{address}}</a>
       

  </div>
  </div>
</template>

<script>
export default {
    name: "contact-details",
    props: [
        "title", "address", "typeOfAddress"
    ]

}
</script>

<style>
.ContactShadow {
    box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
    border-radius: 20px;
    font-weight: 600;
}
</style>