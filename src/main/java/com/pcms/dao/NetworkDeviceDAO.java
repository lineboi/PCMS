package com.pcms.dao;

import com.pcms.model.NetworkDevice;
import com.pcms.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class NetworkDeviceDAO {

    public void save(NetworkDevice nd) {
        Transaction tx = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();
            session.persist(nd);
            tx.commit();
        } catch (Exception e) { if (tx != null) tx.rollback(); throw e; }
    }

    public void update(NetworkDevice nd) {
        Transaction tx = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();
            session.merge(nd);
            tx.commit();
        } catch (Exception e) { if (tx != null) tx.rollback(); throw e; }
    }

    public void delete(int id) {
        Transaction tx = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();
            NetworkDevice nd = session.get(NetworkDevice.class, id);
            if (nd != null) session.remove(nd);
            tx.commit();
        } catch (Exception e) { if (tx != null) tx.rollback(); throw e; }
    }

    public NetworkDevice getById(int id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(NetworkDevice.class, id);
        }
    }

    public List<NetworkDevice> getAll() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("FROM NetworkDevice", NetworkDevice.class).list();
        }
    }

    public List<NetworkDevice> getByLocation(String location) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("FROM NetworkDevice WHERE location = :loc", NetworkDevice.class)
                    .setParameter("loc", NetworkDevice.Location.valueOf(location)).list();
        }
    }

    public List<NetworkDevice> getByStatus(String status) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("FROM NetworkDevice WHERE status = :st", NetworkDevice.class)
                    .setParameter("st", NetworkDevice.DeviceStatus.valueOf(status)).list();
        }
    }

    public List<NetworkDevice> getByTechnician(int techId) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("FROM NetworkDevice WHERE technician.id = :tid", NetworkDevice.class)
                    .setParameter("tid", techId).list();
        }
    }

    public long countByStatus(NetworkDevice.DeviceStatus status) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("SELECT COUNT(n) FROM NetworkDevice n WHERE n.status = :st", Long.class)
                    .setParameter("st", status).uniqueResult();
        }
    }
}
