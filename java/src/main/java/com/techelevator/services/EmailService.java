package com.techelevator.services;

import com.techelevator.model.process.Order;

import java.io.IOException;

public interface EmailService {
    void sendEmailConfirmation(String custEmail, Order order) throws IOException;
}

