package com.techelevator.dao.Pizza;

import com.techelevator.model.process.Board;
import com.techelevator.model.process.Ingredient;
import com.techelevator.model.process.Order;
import com.techelevator.model.process.Pizza;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface PizzaDAO {

    public List<Pizza> getAllPizzas();

    public List<Pizza> getSpecialtyPizzas();

    public Pizza getPizza(long pizzaId);

    Pizza employeeCreatePizza(Pizza pizza);

    boolean updatePizza(Pizza pizza);

    public boolean deletePizza(long pizzaID);

//  order

    public List<Order> getAllOrders();

    public Order getOrder(long orderId);

    @Transactional
    Order createOrder(Order order);

    public boolean updateOrder(Order order);

    public boolean deleteOrder(long orderId);

//  board

    public List<Board> getAllBoards();

    public Board getBoard(long boardId);

    public Board createBoard(Board board);

    public boolean deleteBoard(long boardId);

//  ingredient
    List<Ingredient> getAllIngredients();

    List<Ingredient> getIngredientsForPizzaId(long pizzaId);

    boolean updateIngredient(Ingredient ingredient);

    List<Ingredient> getAvailableIngredients();
}
