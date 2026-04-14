package com.pcms.dao;

import com.pcms.model.PC;
import com.pcms.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class PCDAO {

    public void save(PC pc) {
        Transaction tx = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();
            session.persist(pc);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            throw e;
        }
    }

    public void update(PC pc) {
        Transaction tx = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();
            session.merge(pc);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            throw e;
        }
    }

    public void delete(int id) {
        Transaction tx = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();
            PC pc = session.get(PC.class, id);
            if (pc != null) session.remove(pc);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            throw e;
        }
    }

    public PC getById(int id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(PC.class, id);
        }
    }

    public List<PC> getAll() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("FROM PC", PC.class).list();
        }
    }

    public List<PC> getByLocation(String location) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("FROM PC WHERE location = :loc", PC.class)
                    .setParameter("loc", PC.Location.valueOf(location)).list();
        }
    }

    public List<PC> getByStatus(String status) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("FROM PC WHERE status = :st", PC.class)
                    .setParameter("st", PC.DeviceStatus.valueOf(status)).list();
        }
    }

    public List<PC> getByTechnician(int techId) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("FROM PC WHERE technician.id = :tid", PC.class)
                    .setParameter("tid", techId).list();
        }
    }

    public long countByStatus(PC.DeviceStatus status) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("SELECT COUNT(p) FROM PC p WHERE p.status = :st", Long.class)
                    .setParameter("st", status).uniqueResult();
        }
    }
}
