import axios from 'axios';

const http = axios.create({
  baseURL: "http://localhost:9000",
});

export default {

    getBoards() {
        return http.get('/boards');
    },

    getPizzas(boardID) {
        return http.get(`/boards/${boardID}`);
    },

    getPizza(pizzaID) {
        return http.get(`/pizzas/${pizzaID}`)
      },
    
    getSpecialtyPizzas() {
        return http.get('/pizzas/specialty');
    },

    getAllPizzas() {
        return http.get('/pizzas');
    },

    getAllIngredients() {
        return http.get('/ing');
    },

    getAvailableIngredients() {
        return http.get('/ing/available');
    },

    createPizza(pizza) {
        return http.post('/pizzas', pizza);
    },

    refreshPizza(pizza) {
        return http.put(`/pizzas/${pizza.id}`, pizza)
    },

    deletePizza(pizzaID) {
        return http.delete(`/pizzas/${pizzaID}`); 
    },

    deleteBoard(boardID) {
        const authStr = 'Bearer ' + localStorage.getItem('token'); 
        return http.delete(`/boards/${boardID}`, { headers: { Authorization: authStr } })
    },

    createOrder(order) {
        return http.post('/orders', order);
    },
    createSpecialtyPizza(pizza) {
        return http.post('/pizzas', pizza)
    }
}