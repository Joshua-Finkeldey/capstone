<template>
  <div id="capsule">
    <website-header id="Header"/>
    <h1 class="Location">location</h1> 
    <div class="landing">
      <div id ='LocationMainBody'>

        <div id="LocationInfo">
          <div id="LogoContainer">
            <img id ="BigLogo" src="../assets/UziVert.png">
          </div>
          <div id="InfoContainer">
            <p> we are happy to announce the grand opening of our first back row boyz pizza establishment located at 438 south st, philadelphia pa, 19147! come in during our working 
              hours for the best darn pizza in philadelphia!</p>
          </div>
        </div>
        <div id="Map"></div>
      </div>
    </div>
    <website-footer/>
  </div>
</template>

 <script
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB41DRUbKWJHPxaFjMAwdrzWzbVKartNGg&callback=initMap&v=weekly"
    defer
  ></script>

<script>
import WebsiteHeader from "@/components/WebsiteHeader.vue" 
import WebsiteFooter from "@/components/WebsiteFooter.vue"

export default {
  components: {
      WebsiteHeader,
      WebsiteFooter
  },
  methods: {
    initMap() {
     // let googleScript = document.createElement("script") 
      //googleScript.setAttribute("src","https://maps.googleapis.com/maps/api/js?key=AIzaSyB41DRUbKWJHPxaFjMAwdrzWzbVKartNGg&callback=initMap&v=weekly")
      //document.head.append(googleScript)
      const pizzaShop = { lat: 39.941810, lng: -75.150410 };
      const map = new google.maps.Map(document.getElementById("Map"), {
        zoom: 10,
        center: pizzaShop,
      });
      const marker = new google.maps.Marker({
        position: pizzaShop,
        map: map,
      });
    }
  },
  mounted() {
    /*let googleScript = document.createElement("script") 
    googleScript.setAttribute("src","https://maps.googleapis.com/maps/api/js?key=AIzaSyB41DRUbKWJHPxaFjMAwdrzWzbVKartNGg&callback=initMap&v=weekly")
    document.head.append(googleScript)*/
    this.initMap()
  }

}

</script>

<style>
.Location {
  text-align: center;
}
.landing {
    width: 100%;
    height: 800px;
    overflow: hidden;
    background-image: URL("https://images.unsplash.com/photo-1624821588855-a3ffb0b050ff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80");
}
#Map {
  height: 400px;
  width: 30%;
  background-color: #F76C4B;
  box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
  border-radius: 20px;
}
#LocationMainBody {
  display: flex;
  justify-content: space-between;
  margin-top: 5%;
  padding: 0 10% 0 10%;
}
#BigLogo {
  width: 300px;
}
#LogoContainer {
  background-color: #ad958f;
  border-top-left-radius: 20px 20px;
  border-top-right-radius: 20px 20px;
}
#LocationInfo {
  text-align: -webkit-center;
  width: 45%;
  background-color: #FAF9F6;
  text-align: center;
  padding-bottom: 0.5em;
  height: fit-content;
  margin-top: 5%;
  box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
  border-radius: 20px;
}
#InfoContainer {
  font-weight: 600;
}

</style>