package com.techelevator.services;
import com.sendgrid.*;
import com.techelevator.model.process.Order;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
public class sendGridEmailService implements EmailService{
    @Override
    public void sendEmailConfirmation(String custEmail, Order order) throws IOException {
        Email from = new Email("backrowboyzpizza@gmail.com");

        String subject = "Thanks for Ordering from Back Row Boyz Pizza!";
        Email to = new Email(custEmail);
        Content content = new Content("text/plain", order.toString());

        Mail mail = new Mail(from, subject, to, content);


        Request request = new Request();
        try {
            request.setMethod(Method.POST);
            request.setEndpoint("mail/send");
            request.setBody(mail.build());
        } catch (IOException ex) {
            throw ex;
        }
    }
}
