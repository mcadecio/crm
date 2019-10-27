package com.crm.factory;

import com.crm.entity.Customer;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class Factory {

    private static final SessionFactory SESSION_FACTORY = new Configuration()
            .configure()
            .addAnnotatedClass(Customer.class)
            .buildSessionFactory();

    private Factory() {
    }

    public static Session getSessionFactory() {
        return SESSION_FACTORY.getCurrentSession();
    }


}
