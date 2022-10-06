<template>
  <div id="capsule">
    <website-header id="Header"/>
    <div class="contact">
      <h1 class="contactHeader">contact us</h1>
      <div class="content">
        <div class="firstRow">
          <contact-details class="contactInfo" :typeOfAddress="'phone'" :title="'call us'" :address="'(484)-803-8318'"/>
          <contact-details class="contactInfo" :typeOfAddress="'email'" :title="'email us'" :address="'backrowboyzpizza@gmail.com'"/>
        </div>
        <div class="secondRow">
          <contact-details :title="'leave us a review!'" :typeOfAddress="'review'"  :address="'yelp.com/backrowboyzpizza'"/>
        </div>
      </div>
    </div>
    <website-footer id ="footer"/>
  </div>
</template>

<script>
import ContactDetails from "../components/ContactDetails.vue"
import WebsiteHeader from "@/components/WebsiteHeader.vue" 
import WebsiteFooter from "@/components/WebsiteFooter.vue"

export default {
  components: {
    ContactDetails,
    WebsiteHeader,
    WebsiteFooter
  }


}
</script>

<style>
div#capsule {
    font-family: 'Major Mono Display', monospace;
    display: flex;
    min-height: 100vh;
    flex-direction: column;
    background-color: #B7D8BD;
}

.firstRow {
  display: flex;
  text-align: center;
  justify-content: center;
}
.firstRow div {
  margin: 1em;
  background-color: #FAF9F6;
  text-align: center;
}

.contactInfo {
  width: 30%;
}

.secondRow {
  display: flex;
  text-align: center;
  justify-content: center;
}
.secondRow div {
  background-color: #FAF9F6;
  width: 69%;
  text-align: center;
  margin: auto;
  padding-bottom: 0.5em;
}
.contactHeader {
  text-align: center;
}
.contact a {
  text-decoration: none;
  color: #F76C4B;
}
.contact a:visited {
  color: #F76C4B;
}
.content {
  background-image: URL("https://images.unsplash.com/photo-1624821588855-a3ffb0b050ff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80");
  height: 520px;
  padding: 100px;
}

</style>
