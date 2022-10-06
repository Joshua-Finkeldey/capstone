package com.techelevator.model.process;

import java.math.BigDecimal;

public class Ingredient {

    private Long id;
    private String ingredientName;
    private String tier;
    private BigDecimal ingredientPrice;
    private boolean available;

    @Override
    public String toString() {
        return ingredientName;     }


//    @Override
//    public String toString() {
//        return "Ingredient{" +
//                "id=" + id +
//                ", ingredientName='" + ingredientName + '\'' +
//                ", tier='" + tier + '\'' +
//                ", ingredientPrice=" + ingredientPrice +
//                ", available=" + available +
//                '}';
//    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getIngredientName() {
        return ingredientName;
    }

    public void setIngredientName(String ingredientName) {
        this.ingredientName = ingredientName;
    }

    public String getTier() {
        return tier;
    }

    public void setTier(String tier) {
        this.tier = tier;
    }

    public BigDecimal getIngredientPrice() {
        return ingredientPrice;
    }

    public void setIngredientPrice(BigDecimal ingredientPrice) {
        this.ingredientPrice = ingredientPrice;
    }

    public boolean isAvailable() {
        return available;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }
}
