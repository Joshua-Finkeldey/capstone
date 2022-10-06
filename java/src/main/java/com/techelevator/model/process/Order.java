package com.techelevator.model.process;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Order {

    private Long id;
    private String orderStatus;
    private boolean isDelivery;
    private String employeeName;
    private LocalDateTime orderTime;
    private String custAddress;
    private String custEmail;
    private List<Pizza> pizzas = new ArrayList<>();

    @Override
    public String toString() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm MM/dd/yyyy");

        if (isDelivery) {
            return "Thanks for your Order! \n\n" +
                    "Your Order ID is: " + id + ".\n" +
                    "Your order was received at " + formatter.format(orderTime) + ". \n" +
                    "Your order will be in the oven shortly.\n\n" + "Your delivery driver, " +
                    employeeName + " will be to you at " +
                    custAddress + " in 45 minutes. Don't worry, it is worth the wait. \n\n" +
                    "You ordered: " + pizzas + "\n We hope you love it!";

//                    "You ordered: " + Arrays.deepToString(new List[]{pizzas}) + "\n We hope you love it!";

        } else {
            return "Thanks for your Order! \n\n" +
                    "Your Order ID is: " + id + ".\n" +
                    "Your order was received at " + formatter.format(orderTime) + ".  <== We are big fans of precision here at BRBP! \n" +
                    "Your order will be in the oven shortly.\n\n" +
                    "You ordered: " + Arrays.deepToString(new List[]{pizzas}) + "\n We hope you love it!";
        }
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public boolean isDelivery() {
        return isDelivery;
    }

    public void setDelivery(boolean delivery) {
        isDelivery = delivery;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public LocalDateTime getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(LocalDateTime orderTime) {
        this.orderTime = orderTime;
    }

    public String getCustAddress() {
        return custAddress;
    }

    public void setCustAddress(String custAddress) {
        this.custAddress = custAddress;
    }

    public String getCustEmail() {
        return custEmail;
    }

    public void setCustEmail(String custEmail) {
        this.custEmail = custEmail;
    }

    public List<Pizza> getPizzas() {
        return pizzas;
    }

    public void setPizzas(List<Pizza> pizzas) {
        this.pizzas = pizzas;
    }
}
