<template>
  <div id="capsule">
    <website-header id="Header"/>
    <div>

    <test-component/>
    
   
    
    <!-- <order-now-client-form></order-now-client-form> -->



<!-- Provide router link to toggle between OrderNowCustomPizza_V vue -->

    </div>
    <website-footer id ="footer"/>
</div>
</template>

<script>
import WebsiteHeader from "@/components/WebsiteHeader.vue" 
import WebsiteFooter from "@/components/WebsiteFooter.vue"
import TestComponent from '@/components/TestComponent.vue'
// import OrderNowClientForm from "@/components/OrderNowClientForm"

export default {
  name: 'order-specialty-pizza-view',
  data() {
    return {
     
    }
  },
  components: {

    WebsiteHeader,
    WebsiteFooter,
    
    TestComponent
    // OrderNowClientForm

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