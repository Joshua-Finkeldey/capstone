<template>
  <div>
    <div class="loading" v-if="isLoading">
      <img src="../assets/pizza_loader.gif" />
    </div>
    <div v-else>
      <h1>Pizza Status: {{ pizza.status }}</h1>
      <p>Pizza ID: {{ pizza.id }}</p>
      <!-- <router-link
        tag="button"
        :to="{ name: 'ModifyPizza', params: {pizzaID: $route.params.pizzaID} }"
        class="btn modifyPizza"
      >Modify Pizza</router-link> -->
      <button class="btn pendPizza" v-on:click="updatePizza('Pending')">PENDING</button>
      <button class="btn readyPizza" v-on:click="updatePizza('Ready')" >READY</button>
      <button class="btn completePizza" v-on:click="updatePizza('Completed')" >COMPLETED</button>
      <button class="btn cancelPizza" v-on:click="updatePizza('Cancelled')" >CANCELLED</button>
      <button class="btn deletePizza" v-on:click="deletePizza">Delete Pizza</button>
      <div class="status-message error" v-show="errorMsg !== ''">{{errorMsg}}</div>
      <p v-if="pizza.isSpecialty">{{ pizza.description }}</p>
      <ul>
        <li>{{ pizza.pizzaSize }}</li>
        <li>{{ pizza.dough }}</li>
        <li>{{ pizza.shape }}</li>
        <li>{{ pizza.sauceType }}</li>
        <li>{{ pizza.pizzaPrice }}</li>

      </ul>
      <ingredients-list :ingredients="pizza.ingredients" />
    </div>

    <div class="board-actions" v-if="!isLoading">
      <router-link :to="{ name: 'Board', params: { id: $route.params.boardID } }">Back to Board</router-link>
    </div>
  </div>
</template>

<script>
import pizzaService from "../services/PizzaService";
import IngredientsList from "@/components/IngredientsList";

export default {
  name: "pizza-detail",
  components: {
    IngredientsList
  },
  data() {
    return {
      isLoading: true,
      errorMsg: "",
      // pizza: {
      //   id: 0,
      //   pizzaSize: "",
      //   dough: "",
      //   shape: "",
      //   sauceType: "",
      //   description: "",
      //   pizzaPrice: 0,
      //   isSpecialty: false,
      //   orderId: 0,
      //   ingredients: [],
      //   boardId: 0,
      //   status: this.status,
      //   available: this.available
      // }
    };
  },
  methods: {
    retrievePizza() {
      pizzaService
        .getPizza(this.$route.params.pizzaID)
        .then(response => {
          this.$store.commit("SET_CURRENT_PIZZA", response.data);
          this.isLoading = false;
        })
        .catch(error => {
          if (error.response && error.response.status === 404) {
            alert(
              "This pizza may have 'fallen off the truck' or you have entered an imaginary pizza."
            );
            this.$router.push({ name: 'employee-home' });
          }
        });
    },
    
    updatePizza(newStatus) {
      const newPizza = {
        id: this.pizza.id,
        pizzaSize: this.pizza.pizzaSize,
        dough: this.pizza.dough,
        shape: this.pizza.shape,
        sauceType: this.pizza.sauceType,
        description: this.pizza.description,
        pizzaPrice: this.pizza.pizzaPrice,
        isSpecialty: this.pizza.isSpecialty,
        orderId: this.pizza.orderId,
        ingredients: this.pizza.ingredients,
        boardId: this.pizza.boardId,
        status: this.pizza.status,
        available: this.pizza.available

        
      };
      
      

      newPizza.status = newStatus;
      pizzaService
        .refreshPizza(newPizza)
        .then(response => {
          if (response.status === 200) {
            if (newPizza.orderId == 1) {
              this.$router.push(`/board/2`);
            } else {
            this.$router.push(`/board/1`);}
          }
        })
        .catch(error => {
          if (error.response) {
            this.errorMsg =
              "Error changing pizza. Response received was '" +
              error.response.statusText +
              "'.";
          } else if (error.request) {
            this.errorMsg =
              "Error changing pizza. Server could not be reached.";
          } else {
            this.errorMsg =
              "Error changing pizza. Request could not be created.";
          }
        });
      
    },
    
    
    deletePizza() {
      if (
        confirm(
          "Are you sure you want to fuggedabout this pizza?"
        )
      ) {
        
          
          let gonePizza = this.pizza
          pizzaService
          .deletePizza(this.pizza.id)
          .then(response => {
            if (response.status === 200) {
              alert("Fuggedaboutit");
                if (gonePizza.orderId == 1) {
              this.$router.push(`/board/2`);
            } else {
            this.$router.push(`/board/1`);}
              
              
              
              
              // this.$router.push(`/board/${this.pizza.boardId}`);
            }
          })
          .catch(error => {
            if (error.response) {
              this.errorMsg =
                "Error removing pizza. Response received was '" +
                error.response.statusText +
                "'.";
            } else if (error.request) {
              this.errorMsg =
                "Error removing pizza. Server could not be reached.";
            } else {
              this.errorMsg =
                "Error removing pizza. Request could not be created.";
            }
          });
      }
    },
  },
  created() {
    this.retrievePizza();
  },
  computed: {
    pizza() {
      return this.$store.state.pizza;
    }
  }
};
</script>

<style>
.btn.pendPizza {
  color: rgb(255, 255, 255);
  background-color: #efdf03;
  border-color: #ef031a;
  margin-bottom: 10px;
}

.btn.readyPizza {
  color: rgb(255, 255, 255);
  background-color: #3ad11c;
  border-color: #ef031a;
  margin-bottom: 10px;
}

.btn.completePizza {
  color: #fff;
  background-color: #0b93d3;
  border-color: #183da3;
  margin-bottom: 10px;
}

.btn.cancelPizza {
  color: #fff;
  background-color: #508ca8;
  border-color: #508ca8;
  margin-bottom: 10px;
}

.btn.deletePizza {
  color: #fff;
  background-color: #ef031a;
  border-color: #ef031a;
  margin-bottom: 10px;
}
</style>
