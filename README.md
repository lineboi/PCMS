# PC Maintenance Management System (PCMS)

A full-stack web application for managing ICT equipment, technicians, and service requests.

## Tech Stack

- **Frontend:** JSP, Bootstrap 5, Font Awesome
- **Backend:** Java Servlets (MVC pattern)
- **ORM:** Hibernate 6
- **Database:** MySQL 8
- **Server:** Apache Tomcat 10

## Features

### Admin
- Dashboard with equipment stats by category (PC, Accessories, Network Devices)
- Technician management (register, update, delete)
- Equipment inventory with location & status filters
- Service request management + technician assignment
- Equipment reports

### Technician
- View assigned equipment and update status
- View assigned service requests
- Submit equipment reports

### Public
- ICT service request submission (no login required)

## Database Setup

1. Create the database:
```sql
CREATE DATABASE PCM;
```

2. Copy `src/main/resources/hibernate.cfg.xml.example` to `hibernate.cfg.xml` and set your DB credentials.

3. Run the app — Hibernate auto-creates all tables on first launch.

4. Default admin account is seeded via SQL:
```sql
INSERT INTO Users (firstName, lastName, email, password, phone, role, status)
VALUES ('System', 'Admin', 'admin@pcms.com', MD5('admin123'), '0780000000', 'ADMIN', 'Available');
```

## Run

```bash
mvn clean package
# Deploy target/PCMS.war to Tomcat 10 webapps/
```

Access at: `http://localhost:8080/PCMS/`

## Login

| Role | Email | Password |
|------|-------|----------|
| Admin | admin@pcms.com | admin123 |
| Technician | (created by admin) | (set by admin) |
