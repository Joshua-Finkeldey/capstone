package com.techelevator.model.process;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class Pizza {

    private Long id;
    private String pizzaSize;
    private String dough;
    private String shape;
    private String sauceType;
    private String description;
    private BigDecimal pizzaPrice;
    private boolean isSpecialty;
    private Long orderId;
    private List<Ingredient> ingredients = new ArrayList<>();
    private boolean isAvailable;
    private Long boardId;
    private String status;

    @Override
    public String toString() {
        return "   A " + pizzaSize + ", "
                + dough + " with "
                + sauceType + " sauce and " + ingredients;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPizzaSize() {
        return pizzaSize;
    }

    public void setPizzaSize(String pizzaSize) {
        this.pizzaSize = pizzaSize;
    }

    public String getDough() {
        return dough;
    }

    public void setDough(String dough) {
        this.dough = dough;
    }

    public String getShape() {
        return shape;
    }

    public void setShape(String shape) {
        this.shape = shape;
    }

    public String getSauceType() {
        return sauceType;
    }

    public void setSauceType(String sauceType) {
        this.sauceType = sauceType;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public BigDecimal getPizzaPrice() {
        return pizzaPrice;
    }

    public void setPizzaPrice(BigDecimal pizzaPrice) {
        this.pizzaPrice = pizzaPrice;
    }

    public boolean getIsSpecialty() {
        return isSpecialty;
    }

    public void setIsSpecialty(boolean specialty) {
        isSpecialty = specialty;
    }

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public List<Ingredient> getIngredients() {
        return ingredients;
    }

    public void setIngredients(List<Ingredient> ingredients) {
        this.ingredients = ingredients;
    }

    public boolean isAvailable() {
        return isAvailable;
    }

    public void setAvailable(boolean available) {
        isAvailable = available;
    }

    public Long getBoardId() {
        return boardId;
    }

    public void setBoardId(Long boardId) {
        this.boardId = boardId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
