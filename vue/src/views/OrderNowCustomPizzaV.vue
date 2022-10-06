<template>
  <div id="capsule">
    <website-header id="Header"/>
    <div>
  

<!-- Import OrderNowCustomPizza component
Provide router link to toggle between OrderNowSpecialtyPizzaV vue -->
<order-now-client-form></order-now-client-form>

    </div>
    <website-footer id ="footer"/>
</div>
</template>

<script>
// Import OrderNowCustomPizza component 
import WebsiteHeader from "@/components/WebsiteHeader.vue" 
import WebsiteFooter from "@/components/WebsiteFooter.vue"
import OrderNowClientForm from "@/components/OrderNowClientForm"

export default {
  name: 'order-custom-pizza-view',
  data() {
    return {
     
    }
  },
  components: {

    WebsiteHeader,
    WebsiteFooter,
    OrderNowClientForm
    // OrderNowCustomPizza

  },

    computed: {
   
 }
}
</script>

<style scoped>

div#capsule {
    font-family: 'Major Mono Display', monospace;
    display: flex;
    min-height: 100vh;
    flex-direction: column;
    background-color: #B7D8BD;
}

</style> 