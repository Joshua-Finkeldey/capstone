<template>
<div>

     <form v-on:submit.prevent>

      
  <div class="custom-menu-selections">
    <h1 id="CreateYourOwn">Create New Menu Special</h1>


    <div class="size-list">
      <p>Size</p>
      
    <select v-model="pizza.pizzaSize" >
      <option disabled value="">please select one</option>
      <option>Small</option>
      <option>Medium</option>
      <option>Large</option>
      </select>
      
    </div>
    
    <div class="dough-list">
      <p>Dough Base</p>
      
    <select v-model="pizza.dough" >
      <option disabled value="">Please select one</option>
      <option>Hand-tossed traditional</option>
      <option>Gluten-free +$3.50</option>
      <option>Cauliflower, <em>vegan</em> +$3.50</option>
      </select>
      
    </div>

    <div class="style-list">
      <p>Crust Profile</p>
      
    <select v-model="pizza.shape" >
      <option disabled value="">Please select one</option>
      <option>Classic pie</option>
      <option>Flatbread</option>
      <option>Deepdish +$2.50</option>
      </select>
      
    </div>

    <div class="sauce-list">
      <p>Sauces</p>
      
    <select v-model="pizza.sauceType" >
      <option disabled value="">Please select one</option>
      <option>Traditional red</option>
      <option>White garlic</option>
      <option>Basil pesto</option>
      <option>Spicy Buffalo</option>
      </select>
      
    </div>

    <div class="standard-topping-list">
               
        <ul>
          <li v-for="standardIngredient in standardIngredients" v-bind:key="standardIngredient.ingredientName">            
            <input type="checkbox" v-model="selectedStandardIngredients"  :value="standardIngredient"/>
          {{ standardIngredient.ingredientName }}
          </li>
        </ul>      
    </div>

    <div class="premium-topping-list">    
        <ul>
          <li v-for="premiumIngredient in premiumIngredients" v-bind:key="premiumIngredient.ingredientName">            
            <input type="checkbox" v-model="selectedPremiumIngredients"  :value="premiumIngredient"/>
          {{ premiumIngredient.ingredientName }}
          </li>
      </ul>
    </div>   
    
    
  <div>
    <p>
      enter price if not default
    </p>
    <input v-model="pizza.pizzaPrice" />
  </div>
  <div>
    <p>
      enter description
    </p>
    <input v-model="pizza.description" />
  </div>
  
  
  <button v-on:click.prevent="createPizza">Submit</button>

</div>
</form>
</div>
</template>

<script>
// vanilla JS from Josh to select from an array
// Array.from(document.querySelectorAll("input[type=checkbox][name=type]:checked"), e => e.value); 

import PizzaService from "@/services/PizzaService.js"

export default {
     name: 'create-new-specialty',
     data() {
    return {

      price: 0,
      selectedStandardIngredients: [],
      selectedPremiumIngredients: [],
      
      
      
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
        description: "",
        pizzaPrice: 16.99,
        isSpecialty: true,
        orderId: 1,
        ingredients: [],
        isAvailable: true,
        status: "Pending",
        boardId: 5
        

      },

      order: {
        orderStatus: "Pending",
        isDelivery: false,
        custEmail: "test@email.com",
        pizzas: []
      },
    

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
  methods: {

    createPizza() {
      console.log("In createOrder")
      
      for (let i = 0; i < this.selectedStandardIngredients.length; i++) {
        this.pizza.ingredients.push(this.selectedStandardIngredients[i]);
        console.log("ingredient added")
      }
      for (let j = 0; j < this.selectedPremiumIngredients.length; j++) {
        this.pizza.ingredients.push(this.selectedPremiumIngredients[j]);
        console.log("ingredient added")
      }  
  
      PizzaService.createSpecialtyPizza(this.pizza)
      .then(response => {
            if (response.status === 201) {
              alert("Pizza Added to Inventory");
            }
          })       
       //TO DO - check response - look for 201
        console.log("Pizza created.")
        this.order.pizzas=[]
        this.selectedStandardIngredients = []
        this.selectedPremiumIngredients = []
        this.pizza.pizzaPrice = 16.99
        this.pizza.description = ""

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

<style scoped>

.pizza-box {
  height: 100vh;
  display: grid;
  grid-template-columns: 1fr 1fr 1fr 1fr;
  grid-template-rows: 1fr 1fr 1fr;
  gap: 20px;
  align-items: stretch; 
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
    align-items: stretch;
}

.BTTNS {
    position: relative;
    top: 85px;
    left: 50%;
    text-align: -webkit-center;
    font-size: 16px;
    padding: 50px 50px 50px 50px;
    border-radius: 5px;
    transform: translate(-50%, -50%);
    -ms-transform: translate(-50%, -50%);

}

.prices {
  text-align: center;
  width: 60%;
  margin: auto;
  padding: 1em;
  background-color: #F7F3E8;
  box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
  border-radius: 15px;
}

.size-list {
  text-align: center;
  width: 60%;
  margin: auto;
  padding: 1em;
  background-color: #F7F3E8;
  box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
  border-radius: 15px;
}

.dough-list {
  text-align: center;
  width: 60%;
  margin: auto;
  padding: 1em;
  background-color: #F7F3E8;
  box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
  border-radius: 15px;
}

.sauce-list {
  text-align: center;
  width: 60%;
  margin: auto;
  padding: 1em;
  background-color: #F7F3E8;
  box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
  border-radius: 15px;
}

.style-list {
  text-align: center;
  width: 60%;
  margin: auto;
  padding: 1em;
  background-color: #F7F3E8;
  box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
  border-radius: 15px;
}

.standard-topping-list {
  text-align: center;
  width: 60%;
  margin: auto;
  padding: 1em;
  background-color: #F7F3E8;
  box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
  border-radius: 15px;
}

.premium-topping-list {
  text-align: center;
  width: 60%;
  margin: auto;
  padding: 1em;
  background-color: #F7F3E8;
  box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
  border-radius: 15px;
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


</style>



















