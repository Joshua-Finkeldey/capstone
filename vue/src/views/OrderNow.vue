
<template>
  <div id="capsule">
    <website-header id="Header"/>
    <div>
    <h1 id="orderNow">order now</h1>
    <div id="tomatoBG">
    </div>
    <div class = 'CYORouterPhoto'>
      <router-link :to="{name: 'orderNowCustomPizzaV'}"><img src="../assets/cyo_improved2.png" class="MidPageLinks"> </router-link>
    </div>
    <div class = 'SPRouterPhoto'>
      <router-link :to="{name: 'orderNowSpecialtyPizzaV'}"><img src="../assets/sp_improved3.png" class="MidPageLinks"></router-link>
    </div>
    
    
    

    <!-- <div  class='BTN'>

            <router-link :to="{name: 'orderNowCustomPizzaV'}" tag="button" img src="../assets/cyo_no_border" class="MidPageLinks">Create Your Own</router-link>
            <router-link :to="{name: 'orderNowSpecialtyPizzaV'}" tag="button" class="MidPageLinks">Specialty Pies</router-link>
        </div> -->

    <!-- Provide router link to images to toggle between OrderNowCustomPizza_V vue and OrderNowSpecialtyPizza_V vue -->
    
    </div>
    <website-footer id ="footer"/>
</div>
</template>

<script>


import WebsiteHeader from "@/components/WebsiteHeader.vue" 
import WebsiteFooter from "@/components/WebsiteFooter.vue"

export default {
  data() {
    return {
     
    }
  },
  components: {
    WebsiteHeader,
    WebsiteFooter,
    

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

.BTN {
    position: absolute;
    top: 51%;
    left: 50%;
    font-size: 16px;
    padding: 12px 24px;
    border-radius: 5px;
    transform: translate(-50%, -50%);
    -ms-transform: translate(-50%, -50%);

}

.MidPageLinks {
    font-size: 16px;
    margin: 20px;
    width: 400px;
    height: 200px;
    background-color: #F76C4B;
    border-radius: 60px;
    border: solid rgb(5, 0, 0) 0px;
    color: #F7F3E8;
    cursor: pointer;
    box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
  
}

.CYORouterPhoto {
   position: absolute;
    top: 51%;
    left: 37%;
    font-size: 20px;
    padding: 12px 24px;
    border-radius: 5px;
    transform: translate(-50%, -50%);
    -ms-transform: translate(-50%, -50%);
}

.SPRouterPhoto {
   position: absolute;
    top: 51%;
    left: 63%;
    font-size: 16px;
    padding: 12px 24px;
    border-radius: 5px;
    transform: translate(-50%, -50%);
    -ms-transform: translate(-50%, -50%);
}
  
#tomatoBG {
  background-image: URL("https://images.unsplash.com/photo-1624821588855-a3ffb0b050ff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80");
  height: 520px;
  padding: 100px;
}
#orderNow{
  text-align: -webkit-center;
}
</style> 