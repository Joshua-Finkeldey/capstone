import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

/*
 * The authorization header is set for axios when you login but what happens when you come back or
 * the page is refreshed. When that happens you need to check for the token in local storage and if it
 * exists you should set the header so that it will be attached to each request
 */
const currentToken = localStorage.getItem('token')
const currentUser = JSON.parse(localStorage.getItem('user'));

if(currentToken != null) {
  axios.defaults.headers.common['Authorization'] = `Bearer ${currentToken}`;
}

export default new Vuex.Store({
  state: {
    token: currentToken || '',
    user: currentUser || {},
    isBannerDisplayed: true,
    boards: [],
    activeBoardId: null,
    boardPizzas: [],
    allIngredients: [],
    availableIngredients: [],
    specialtyPizzas: [],
    currentSpecialtyIngredients: [],
    showBoardColumns: true,
    orderedPizzas: [],
    pizza: {
      id: 0,
      pizzaSize: '',
      dough: '',
      shape: '',
      sauceType: '',
      description: '',
      pizzaPrice: 0,
      isSpecialty: false,
      orderId: 0,
      ingredients: [],
      boardId: 0,
      status: '',
      available: true
    },
    ingredient: {
      id: 0,
      ingredientName: '',
      tier: '',
      ingredientPrice: 0,
      available: true
    }
  },
  mutations: {
    
    SET_ALL_INGREDIENTS (state, data) {
      state.allIngredients = data;
    },
    SET_AVAILABLE_INGREDIENTS(state, data) {
      state.availableIngredients = data;
    },
    SET_BOARDS(state, data) {
      state.boards = data;
    },
    SET_ACTIVE_BOARD(state, boardId) {
      state.activeBoardId = boardId;
    },
    SET_BOARD_PIZZAS(state, data) {
      state.boardPizzas = data;
    },
    SET_SPECIALTY_PIZZAS(state, data) {
      state.specialtyPizzas = data;
    },
    SET_CURRENT_PIZZA(state, data) {
      state.pizza = data;
    },
    SET_AUTH_TOKEN(state, token) {
      state.token = token;
      localStorage.setItem('token', token);
      axios.defaults.headers.common['Authorization'] = `Bearer ${token}`
    },
    SET_USER(state, user) {
      state.user = user;
      localStorage.setItem('user',JSON.stringify(user));
    },
    LOGOUT(state) {
      localStorage.removeItem('token');
      localStorage.removeItem('user');
      state.token = '';
      state.user = {};
      axios.defaults.headers.common = {};
    },
    SET_CURRENT_SPECIALTY_INGREDIENTS(state, data) {
      state.currentSpecialtyIngredients = data;
    }
    
  }
})
