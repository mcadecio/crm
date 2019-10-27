package com.crm.controller;

import com.crm.entity.Customer;
import com.crm.factory.Factory;
import org.hibernate.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping(value = "/customer")
public class CustomerController {

    private static final Logger LOGGER = LoggerFactory.getLogger(CustomerController.class);


    @GetMapping(value = "/list")
    public String showCustomers(Model model) {

        model.addAttribute("customers", getCustomers());

        return "customer/customer-list";
    }

    @GetMapping(value = "/showform")
    public String showAddForm(Model model) {
        model.addAttribute("newCustomer", new Customer());
        return "customer/customer-add";
    }

    @PostMapping(value = "/processform")
    public String processForm(@ModelAttribute(value = "newCustomer") Customer customer, Model model){
        addCustomer(customer);
        return showCustomers(model);
    }
    private void addCustomer(Customer customer){

        try (Session session = Factory.getSessionFactory()) {
            session.beginTransaction();

            session.save(customer);

            session.getTransaction().commit();

            LOGGER.info("Customer {} added successfully!", customer);

        } catch (Exception e) {
            LOGGER.error(e.getMessage());
        }

    }

    private List<Customer> getCustomers(){

        Session session =  Factory.getSessionFactory();

        List<Customer> customers = null;

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
