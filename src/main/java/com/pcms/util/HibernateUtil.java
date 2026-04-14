package com.pcms.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {

    private static SessionFactory sessionFactory;

    static {
        try {
            Configuration config = new Configuration().configure("hibernate.cfg.xml");

            // Override with environment variables when available (Railway / cloud)
            String dbUrl  = System.getenv("DB_URL");
            String dbUser = System.getenv("DB_USER");
            String dbPass = System.getenv("DB_PASSWORD");

            if (dbUrl  != null) config.setProperty("hibernate.connection.url",      dbUrl);
            if (dbUser != null) config.setProperty("hibernate.connection.username",  dbUser);
            if (dbPass != null) config.setProperty("hibernate.connection.password",  dbPass);

            sessionFactory = config.buildSessionFactory();
        } catch (Exception e) {
            e.printStackTrace();
            throw new ExceptionInInitializerError(e);
        }
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public static void shutdown() {
        if (sessionFactory != null) sessionFactory.close();
    }
}
