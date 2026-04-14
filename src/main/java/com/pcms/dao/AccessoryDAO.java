package com.pcms.dao;

import com.pcms.model.Accessory;
import com.pcms.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class AccessoryDAO {

    public void save(Accessory a) {
        Transaction tx = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();
            session.persist(a);
            tx.commit();
        } catch (Exception e) { if (tx != null) tx.rollback(); throw e; }
    }

    public void update(Accessory a) {
        Transaction tx = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();
            session.merge(a);
            tx.commit();
        } catch (Exception e) { if (tx != null) tx.rollback(); throw e; }
    }

    public void delete(int id) {
        Transaction tx = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();
            Accessory a = session.get(Accessory.class, id);
            if (a != null) session.remove(a);
            tx.commit();
        } catch (Exception e) { if (tx != null) tx.rollback(); throw e; }
    }

    public Accessory getById(int id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(Accessory.class, id);
        }
    }

    public List<Accessory> getAll() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("FROM Accessory", Accessory.class).list();
        }
    }

    public List<Accessory> getByLocation(String location) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("FROM Accessory WHERE location = :loc", Accessory.class)
                    .setParameter("loc", Accessory.Location.valueOf(location)).list();
        }
    }

    public List<Accessory> getByStatus(String status) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("FROM Accessory WHERE status = :st", Accessory.class)
                    .setParameter("st", Accessory.DeviceStatus.valueOf(status)).list();
        }
    }

    public List<Accessory> getByTechnician(int techId) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("FROM Accessory WHERE technician.id = :tid", Accessory.class)
                    .setParameter("tid", techId).list();
        }
    }

    public long countByStatus(Accessory.DeviceStatus status) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("SELECT COUNT(a) FROM Accessory a WHERE a.status = :st", Long.class)
                    .setParameter("st", status).uniqueResult();
        }
    }
}
