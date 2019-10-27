package com.crm.controller;

import com.crm.entity.Customer;
import com.crm.factory.Factory;
import org.hibernate.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/customer")
public class ListController {

    private static final Logger LOGGER = LoggerFactory.getLogger(ListController.class);


    @GetMapping(value = "/list")
    public String showCustomers(Model model) {

        model.addAttribute("customers", getCustomers());

        return "customer/customer-list";
    }

    private List<Customer> getCustomers(){

        Session session =  Factory.getSessionFactory();

        List<Customer> customers = new ArrayList<>();

        try {
            session.beginTransaction();


            customers = session.createQuery("from Customer", Customer.class).getResultList();


            session.getTransaction().commit();


        } catch (Exception e){
            LOGGER.error(e.getMessage());
        } finally {
            session.close();
        }

        return customers;
    }
}
