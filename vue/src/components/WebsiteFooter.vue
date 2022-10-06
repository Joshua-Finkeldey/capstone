<template>
    <div id ='footer'>
        <p id ="CopyRight"> &#169; 2022 tech elevator designz</p>
        <div><a  id ="InstaLink" href="https://www.instagram.com/backrowboyzpizza/" class="fa fa-instagram"></a></div>
        <div id= "EmployeeLogin"><router-link class = "LoginLink" :to="{ name: 'login' }">login</router-link></div>
        <!-- <a id= "EmployeeLogin" href="LoginFromMike">login</a> -->
    </div>
</template>

<script>
export default {
    name: "website-footer"

}
</script>

<style>
#footer {
    display: flex;
    justify-content: space-between;
    position: relative;
    bottom: 0;
    width: 100%;
    margin-top: auto;
    height: 50px;
}

.fa {
    padding: 20px;
    font-size: 30px;
    width: 50px;
    text-align: center;
    text-decoration: none;
  }
  
  .fa:hover {
    opacity: 0.7;
  }

  .fa-instagram {
    background: #B6D7BA;
    color: #F76C4B;
  }

  #InstaLink {
      grid-area: "main";
      text-align: center;
      padding: 10px;
  }
  #CopyRight {
      grid-area: "main";
         font-size: 12px;
         width: 20%;
  }
  #EmployeeLogin {
      grid-area: "Login";
      width: 20%;
      text-align: right; 
  }
  .LoginLink {
      text-decoration: none;
      color: black;
  }
  .LoginLink:hover {
      opacity: 0.7;
      color: #F76C4B;
  }
</style>