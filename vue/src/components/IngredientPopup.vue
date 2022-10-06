<template>
  <div id="Overlay">

      <div id="PopupBox">
          <h3>Thank You For Ordering!</h3>
          <router-link :to="'/'">Return Home</router-link>
    </div> 
  </div>  

    
</template>

<script>
export default {
    name: "ingredient-popup"
}
</script>

<style>
#PopupBox {
    background-color:red;
    width: 50%;
    height: 50%;
    background: #1abcb9;
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    margin: auto;
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