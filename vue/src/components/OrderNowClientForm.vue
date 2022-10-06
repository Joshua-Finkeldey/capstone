<template>
<div>
  <successful-order-popup v-if ="displayPopup"/>
    

     <form v-on:submit.prevent>

      
  <div class="custom-menu-selections">
    <h1 id="CreateYourOwn">create-your-own</h1>
      <!--- PICKUP or DELIVERY
       =============================== -->

       <div class='BTTNS'>
         <input v-model="order.isDelivery" type="radio" id="PickupRadio" name="PickupOrDeliveryRadio" value="false">
          <label for="PickupRadio">pickup</label>
          <input v-model="order.isDelivery" type="radio" id="DeliveryRadio" name="PickupOrDeliveryRadio" value="true">
          <label for="DeliveryRadio">delivery</label>

        <!--<button tag="button" class="PickupDelivery">Pickup</button>
        <button tag="button" class="PickupDelivery">Delivery</button>-->
      </div>
  <div id="CustomBG">
      <!-- =========================== -->
       <div class="prices"> 
        <p id ="SizesAndPrices"></p> 12" small ($11.99) | 16" medium ($14.99) | 20" ($17.99)
      </div>
  <div id="SizeDough">
    <div class="size-list">
      <h2>choose a size</h2>
      <!-- drop down -->
      <!-- <div>{{ size.selected }}</div> -->
    <select v-model="pizza.pizzaSize" >
      <option disabled value="">please select one</option>
      <option>Small</option>
      <option>Medium</option>
      <option>Large</option>
      </select>
      <!-- check boxes -->
      <!-- <ul>
        <li v-for="size in filteredSizes" v-bind:key="size.choice"
            v-bind:class="{ finished: pizza.pizzaSize }">
          <input type="radio" v-model="pizza.pizzaSize" />
          {{ size.choice }}
        </li>
      </ul> -->
    </div>
    <div class="dough-list">
      <h2>choose a dough</h2>
      <!-- drop down -->
      <!-- <div>{{ selected }}</div> -->
    <select v-model="pizza.dough" >
      <option disabled value="">Please select one</option>
      <option>Hand-tossed traditional</option>
      <option>Gluten-free +$3.50</option>
      <option>Cauliflower, <em>vegan</em> +$3.50</option>
      </select>
      <!-- check boxes -->
      <!-- <ul>
        <li v-for="dough in filteredDoughs" v-bind:key="dough.choice"
            v-bind:class="{ finished: dough.done }">
          <input type="checkbox" v-model="dough.done" />
          {{ dough.choice }}
        </li>
      </ul> -->
    </div>
    </div>
    <div id="StyleSauce">
    <div class="style-list">
      <h2>choose a style</h2>
      <!-- drop down -->
      <!-- <div>{{ selected }}</div> -->
    <select v-model="pizza.shape" >
      <option disabled value="">Please select one</option>
      <option>Classic pie</option>
      <option>Flatbread</option>
      <option>Deepdish +$2.50</option>
      </select>
      <!-- check boxes -->
      <!-- <ul>
        <li v-for="style in filteredStyles" v-bind:key="style.choice"
            v-bind:class="{ finished: style.done }">
          <input type="checkbox" v-model="style.done" />
          {{ style.choice }}
        </li>
      </ul> -->
    </div>
    <div class="sauce-list">
      <h2>choose a sauce</h2>
      <!-- drop down -->
      <!-- <div>{{ selected }}</div> -->
    <select v-model="pizza.sauceType" >
      <option disabled value="">Please select one</option>
      <option>Traditional red</option>
      <option>White garlic</option>
      <option>Basil pesto</option>
      <option>Spicy Buffalo</option>
      </select>
      <!-- check boxes -->
      <!-- <ul>
        <li v-for="sauce in filteredSauces" v-bind:key="sauce.choice"
            v-bind:class="{ finished: sauce.done }">
          <input type="checkbox" v-model="sauce.done" />
          {{ sauce.choice }}
        </li>
      </ul> -->
    </div>
  </div>
    <div class="standard-topping-list">
        <h2>choose standard toppings</h2>
        <p>first 4 are free. additional toppings ($0.25) each</p>
        <ul>
          <li v-for="standardIngredient in standardIngredients" v-bind:key="standardIngredient.ingredientName">            
            <input type="checkbox" v-model="selectedStandardIngredients"  :value="standardIngredient"/>
          {{ standardIngredient.ingredientName }}
          </li>
        </ul>      
    </div>

    <div class="premium-topping-list">    
        <h2>choose premium toppings</h2>
        <p>first 2 are free. additional toppings ($0.50) each</p>
        <ul>
          <li v-for="premiumIngredient in premiumIngredients" v-bind:key="premiumIngredient.ingredientName">            
            <input type="checkbox" v-model="selectedPremiumIngredients"  :value="premiumIngredient"/>
          {{ premiumIngredient.ingredientName }}
          </li>
      </ul>
 </div> 
    </div>   
    
    
     <div>
    
  </div>
  <div v-if="order.isDelivery ==='true'" id="DeliveryPopUp">
     <h2>enter your delivery information</h2>
    <div id="customer-information">      
      <div class="form-group">
        <input
          class="form-control"
          type="email"
          id="email"
          placeholder="email"
          v-model="order.custEmail"
          required
        >
      </div>
      <div class="form-group">
        <input
          class="form-control"
          type="text"
          id="address"
          placeholder="address"
          v-model="order.custAddress"
          required
        >
      </div>    
    </div>    
  </div>
  <div id="PaymentInformation">
    <div class="form-group">       
      <div class="running-total">
        <p>Current total: ${{ pizzaPriceTotal }}</p>
      </div>
      <input 
        class="form-control"
        type="text"
        id="creditCard"
        maxlength="16"
        pattern="[0-9]*"
        inputmode="numeric"
        placeholder="enter payment info"
        v-model="order.custCreditCard"
        required
      >
    </div>
    <div class="form-group">        
      <input 
        class="form-control"    
        type="text"
        id="creditCardCVC"
        maxlength="3"
        pattern="[0-9]*"
        inputmode="numeric"
        placeholder="enter CVC" 
        required
        >
    </div>
    <div class="form-group">        
      <input 
        class="form-control"                
        type="text"
        id="creditCardExpiry"
        maxlength="4"
        pattern="[0-9]*"
        inputmode="numeric"
        placeholder="enter date of expiration" 
        required
        >
    </div>
  <div class="form-group">  
    <button 
      v-on:click.prevent="createOrder" class="form-control">Submit Order</button>
      <button class="form-control" v-on:click.prevent="clearOrder">Clear Order</button>
  </div>
  
  
  </div>
    
  <!-- <div class="form-group">  
    <button 
      v-on:click.prevent="createOrder"
      class="form-control"
    >
      Submit Order
    </button>
  </div> -->


</div>
</form>
</div>
</template>

<script>
// vanilla JS from Josh to select from an array
// Array.from(document.querySelectorAll("input[type=checkbox][name=type]:checked"), e => e.value); 

import PizzaService from "@/services/PizzaService.js"
import SuccessfulOrderPopup from "./SuccessfulOrderPopup.vue"

export default {
     name: 'order-now-client-form',
     data() {
    return {
      selectedStandardIngredients: [],
      selectedPremiumIngredients: [],
      displayPopup: false,   
      ingredient: {
        "id": 1,
        "ingredientName": "Red onion",
        "tier": "Standard",
        "ingredientPrice": 0.25,
        "available": true
      },   
      pizza: {
        pizzaSize: 'Medium',
        dough: 'Hand-tossed traditional',
        shape: 'Classic pie',
        sauceType: 'Traditional red',
        description: "This is a test",
        pizzaPrice: 14.99,
        isSpecialty: false,
        orderId: 0,
        boardId: 1,
        ingredients: [],
        isAvailable: true,
        status: "Pending"
      },
      order: {
        orderStatus: "Pending",
        isDelivery: true,
        custEmail: "backrowboyzpizza@gmail.com",
        custAddress: "742 Evergreen Terrace",
        custCreditCard: "",
        pizzas: []
      },
    //       private Long id;
    // private String pizzaSize;
    // private String dough;
    // private String shape;
    // private String sauceType;
    // private String description;
    // private BigDecimal pizzaPrice;
    // private boolean isSpecialty;
    // private Long orderId;
    // private List<Ingredient> ingredients = new ArrayList<>();
    // private boolean isAvailable;
    // private Long boardId;
    // private String status;
// =================
// ORDER
// =================
  // private Long id;
  //   private String orderStatus;
  //   private boolean isDelivery;
  //   private String employeeName;
  //   private LocalDateTime orderTime;
  //   private String custAddress;
  //   private String custEmail;
  //   private List<Pizza> pizzas = new ArrayList<>();

    // =======================

      filterSizes: '',
      sizes: [
        {
          choice: 'Small',
          done: false
        },
        {
          choice: 'Medium',
          done: false
        },
        {
          choice: 'Large',
          done: false
        }
      ],

    filterDoughs: '',
    doughs: [
        {
          choice: 'Hand-tossed traditional',
          done: false
        },
        {
          choice: 'Gluten-free (+$3.50)', // plus $3.50 upcharge
          done: false
        },
        {
          choice: 'Cauliflower, vegan (+$3.50)', // plus $3.50 upcharge
          done: false
        },
      ],

      filterStyles: '',
      styles: [
        {
          choice: 'Classic pie',
          done: false
        },
        {
          choice: 'Flatbread', 
          done: false
        },
        {
          choice: 'Deepdish (+$2.50)', // plus $2.50 upcharge
          done: false
        },
      ],

      filterSauces: '',
      sauces: [
        {
          choice: 'Traditional red',
          done: false
        },
        {
          choice: 'White garlic', 
          done: false
        },
        {
          choice: 'Basil pesto', 
          done: false
        },
        {
          choice: 'Spicy Buffalo', 
          done: false
        },
      ],
    }
  },
  components: {
    SuccessfulOrderPopup
  },
  methods: {

    clearOrder() {
      location.reload();
    },
    createOrder() {
      if (confirm("Ready to order? Your card will be charged: " + this.pizzaPriceTotal )) {
        console.log("In createOrder")
        
        for (let i = 0; i < this.selectedStandardIngredients.length; i++) {
          this.pizza.ingredients.push(this.selectedStandardIngredients[i]);
          console.log("ingredient added")
        }
        for (let j = 0; j < this.selectedPremiumIngredients.length; j++) {
          this.pizza.ingredients.push(this.selectedPremiumIngredients[j]);
          console.log("ingredient added")
        }
        this.pizza.pizzaPrice = this.pizzaPriceTotal
        this.order.pizzas.push(this.pizza)

        console.log(this.order)


        PizzaService.createOrder(this.order).then(() =>{
          //TO DO - check response - look for 201
          console.log("Order created.")
          this.order.pizzas=[]
          this.selectedStandardIngredients = []
          this.selectedPremiumIngredients = []
        })
        this.displayPopup = true;
      }
    },

    retrieveAvailableIngredients() {
      PizzaService.getAvailableIngredients().then((response) => {
        this.$store.commit("SET_AVAILABLE_INGREDIENTS", response.data)
      })
    },

    setDelivery() {
    }
   
  },


  computed: {

    pizzaPriceTotal() {
      let pizzaPrice = 11.99 
      
      if (this.pizza.pizzaSize == 'Medium') {
        pizzaPrice += 3
      }
      else if (this.pizza.pizzaSize == 'Large') {
        pizzaPrice += 6
      }
      if (this.pizza.dough == 'Cauliflower, vegan +$3.50' || this.pizza.dough == 'Gluten-free +$3.50'){
        pizzaPrice += 3.50
      }
      if (this.pizza.shape == 'Deepdish +$2.50') {
        pizzaPrice += 2.50
      }

      for (let i = 4; i < this.selectedStandardIngredients.length; i++) {
        pizzaPrice += 0.25
      }
      for (let j = 2; j < this.selectedPremiumIngredients.length; j++) {
        pizzaPrice += 0.50
      }

      pizzaPrice = Math.round(pizzaPrice * 100) / 100;

      return pizzaPrice
    },
    
    standardIngredients() {
      let standardIngredients = this.$store.state.availableIngredients.filter( ingredient => ingredient.tier == 'Standard' )
      // return this.$store.state.filter(())
      return standardIngredients
    },

    premiumIngredients() {
      let premiumIngredients = this.$store.state.availableIngredients.filter( ingredient => ingredient.tier == 'Premium' )
      // return this.$store.state.filter(())
      return premiumIngredients
    },


      filteredSizes() {
      return this.sizes.filter((size) => {
        return size.choice.includes(this.filterSizes);
      });
    },
    filteredDoughs() {
      return this.doughs.filter((dough) => {
        return dough.choice.includes(this.filterDoughs);
      });
    },
    filteredStyles() {
      return this.styles.filter((style) => {
        return style.choice.includes(this.filterStyles);
      });
    },
    filteredSauces() {
      return this.sauces.filter((sauce) => {
        return sauce.choice.includes(this.filterSauces);
      });
    },
    
  },

  created() {
    this.retrieveAvailableIngredients();
  }
 }


</script>
 
<style scope>
#submitButton {
  margin-left: 47%;
}

.custom-menu-selections {
  font-weight: 600;
}
#CustomBG {
  background-image: URL("https://images.unsplash.com/photo-1624821588855-a3ffb0b050ff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80");
  height: 100%;
  padding: 10px;

}
#CreateYourOwn {
    display: block;
    font-size: 2em;
    margin-block-start: 0.67em;
    margin-block-end: 0.67em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
    text-align: center;
}

.BTTNS {
    position: relative;
    top: 35px;
    left: 50%;
    text-align: -webkit-center;
    font-size: 16px;
    padding: 10px 50px 10px 50px;
    border-radius: 5px;
    transform: translate(-50%, -50%);
    -ms-transform: translate(-50%, -50%);

}
.PickupDelivery {
    font-size: 16px;
    margin: 20px;
    width: 150px;
    height: 75px;
    background-color: #F76C4B;
    border-radius: 60px;
    border: solid white 2px;
    color: white;
    cursor: pointer;
}

.prices {
  text-align: center;
  width: 60%;
  margin: auto;
  padding: 1em;
  background-color: #F7F3E8;
  box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
  border-radius: 15px;
  margin-bottom: 1rem;
}

.size-list {
  text-align: center;
  width: 60%;
  margin: auto;
}

.dough-list {
  text-align: center;
  width: 60%;
  margin: auto;
}

.sauce-list {
  text-align: center;
  width: 60%;
  margin: auto;
}

.style-list {
  text-align: center;
  width: 60%;
  margin: auto;
}

.standard-topping-list {
  text-align: center;
  width: 60%;
  margin: auto;
  padding: 1em;
  background-color: #F7F3E8;
  box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
  border-radius: 15px;
  margin-bottom: 1rem;
}

.premium-topping-list {
  text-align: center;
  width: 60%;
  margin: auto;
  padding: 1em;
  background-color: #F7F3E8;
  box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
  border-radius: 15px;
  margin-bottom: 1rem;
}
.standard-topping-list ul{
  list-style: none;
}
.premium-topping-list ul{
  list-style: none;
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
    border: solid rgb(5, 0, 0) 2px;
    color: white;
    cursor: pointer;
}
#SizeDough {
  display: flex;
  width: 60%;
  margin-left: auto;
  margin-right: auto;
  padding: 1em;
  background-color: #F7F3E8;
  box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
  border-radius: 15px;
  margin-bottom: 1rem;
}
#StyleSauce {
  display: flex;
  width: 60%;
  margin-left: auto;
  margin-right: auto;
  padding: 1em;
  background-color: #F7F3E8;
  box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
  border-radius: 15px;
  margin-bottom: 1rem;
}
#DeliveryPopUp {
  width: 60%;
  margin-left: auto;
  margin-right: auto;
  padding: 1em;
  background-color: #F7F3E8;
  box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
  border-radius: 15px;
  margin-bottom: 1rem;
  text-align: -webkit-center;
  
}
#inputs { 
  display:flex;
  justify-content: space-between;
}
#PaymentInformation{
  width: 60%;
  margin-left: auto;
  margin-right: auto;
  padding: 1em;
  background-color: #F7F3E8;
  box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
  border-radius: 15px;
  margin-bottom: 1rem;
  text-align: -webkit-center;
}
</style>