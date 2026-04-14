package com.pcms.dao;

import com.pcms.model.Request;
import com.pcms.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class RequestDAO {

    public void save(Request r) {
        Transaction tx = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();
            session.persist(r);
            tx.commit();
        } catch (Exception e) { if (tx != null) tx.rollback(); throw e; }
    }

    public void update(Request r) {
        Transaction tx = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();
            session.merge(r);
            tx.commit();
        } catch (Exception e) { if (tx != null) tx.rollback(); throw e; }
    }

    public void delete(int id) {
        Transaction tx = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();
            Request r = session.get(Request.class, id);
            if (r != null) session.remove(r);
            tx.commit();
        } catch (Exception e) { if (tx != null) tx.rollback(); throw e; }
    }

    public Request getById(int id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(Request.class, id);
        }
    }

    public List<Request> getAll() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("FROM Request ORDER BY requestDate DESC", Request.class).list();
        }
    }

    public List<Request> getByStatus(String status) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("FROM Request WHERE status = :st ORDER BY requestDate DESC", Request.class)
                    .setParameter("st", Request.RequestStatus.valueOf(status)).list();
        }
    }

    public List<Request> getByTechnician(int techId) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery(
                "FROM Request WHERE technician.id = :tid ORDER BY requestDate DESC", Request.class)
                    .setParameter("tid", techId).list();
        }
    }

    public long countByStatus(Request.RequestStatus status) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("SELECT COUNT(r) FROM Request r WHERE r.status = :st", Long.class)
                    .setParameter("st", status).uniqueResult();
        }
    }
}
