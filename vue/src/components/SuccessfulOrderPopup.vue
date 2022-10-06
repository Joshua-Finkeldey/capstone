<template>
  <div id="Overlay">

      <div id="PopupBox">
          <div id="InsideTheBox">
            <div id="PopUpLogo">
            <img id ="BigLogo" src="../assets/UziVert.png">
            </div>
          <h3>thank you for your order! <br>we appreciate your business. <br>please check your email for confirmation.</h3>
          <div id="HomeLink">
          <router-link :to="'/'">return home</router-link>
          </div>
          </div>
    </div> 
  </div>  

    
</template>

<script>
export default {
    name: "successful-order-popup"
}
</script>

<style>
#PopUpLogo {
    width: 500px;
    margin-top: 10%;
}
#InsideTheBox {
    text-align: -webkit-center;
    font-weight: 600;
}
#HomeLink {
   text-align: -webkit-center; 
}
#PopupBox {
    background-color:#F76C4B;
    width: 50%;
    height: 50%;
    background: #F76C4B;
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    margin: auto;
    border-radius: 20px;
}
#Overlay {
  position: fixed;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: rgba(0,0,0,0.5);
  z-index: 2;
  cursor: pointer;
}
</style>