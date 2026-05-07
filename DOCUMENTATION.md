# Technical Documentation: PC Maintenance Management System (PCMS)

## 1. Executive Summary
The PC Maintenance Management System (PCMS) is an enterprise-grade web application designed to streamline the lifecycle of ICT equipment and maintenance workflows. It provides tools for inventory tracking, technician workload management, and service request processing.

---

## 2. System Architecture
The application follows a traditional **Model-View-Controller (MVC)** architectural pattern:

- **Model:** JPA-annotated entities (`com.pcms.model`) and DAO classes (`com.pcms.dao`) using Hibernate for persistence.
- **View:** Server-side rendered JSP pages (`webapp/views`) utilizing JSTL and Bootstrap 5 for responsiveness.
- **Controller:** Jakarta Servlets (`com.pcms.servlet`) managing HTTP requests, business logic, and view routing.

### Technology Stack
| Layer | Technology |
|---|---|
| **Language** | Java 11 |
| **Web Framework** | Jakarta Servlet 5.0 / JSP 3.0 |
| **ORM** | Hibernate 6.4.4.Final |
| **Database** | MySQL 8.x |
| **Security** | Custom AuthFilter (Session-based) |
| **Build Tool** | Maven 3.x |

---

## 3. Data Model (Entities)
### Core Entities:
1.  **User:** Manages `ADMIN` and `TECHNICIAN` roles. Tracks contact info and availability status.
2.  **Request:** External/Internal service requests. Links to a `Technician` once assigned.
3.  **PC:** Inventory for computers. Tracks hardware specs (HDD, RAM, OS), location (Lab/Office), and health status.
4.  **NetworkDevice:** Tracks networking hardware (Routers, Switches, etc.).
5.  **Accessory:** Tracks peripherals (Mice, Keyboards, Monitors).
6.  **Reporting:** Detailed maintenance reports submitted by technicians after resolving requests.

---

## 4. Security & Authentication
### Authentication Filter (`AuthFilter.java`)
A global filter intercepts all requests (`/*`) to enforce security:
- **Public Access:** `/`, `/login`, `/submit-request`, and static assets (`/css`, `/js`, etc.).
- **Authorization:** 
    - Paths starting with `/admin/` require a user with `Role.ADMIN`.
    - Paths starting with `/technician/` require a user with `Role.TECHNICIAN`.
- **Session Management:** Standard HTTP session with a 30-minute timeout (configured in `web.xml`).

### Password Security
Passwords are currently hashed using **MD5** via `PasswordUtil.java`. 

---

## 5. Servlet Mapping & Routing
| Endpoint | Servlet | Access | Purpose |
|---|---|---|---|
| `/login` | `LoginServlet` | Public | User authentication |
| `/admin/dashboard` | `AdminDashboardServlet` | Admin | High-level system stats |
| `/admin/pcs` | `PCServlet` | Admin | PC inventory management |
| `/admin/requests` | `RequestServlet` | Admin | Service request triage |
| `/admin/technicians`| `TechnicianServlet` | Admin | Staff management |
| `/technician/dashboard`| `TechnicianDashboardServlet`| Tech | Personal task overview |
| `/technician/equipment`| `TechnicianEquipmentServlet`| Tech | View assigned hardware |

---

## 6. Persistence Layer
### Hibernate Configuration
Located in `src/main/resources/hibernate.cfg.xml`.
- **Auto-Schema:** Uses `hibernate.hbm2ddl.auto = update` to synchronize the database schema with Java entities.
- **Connection Pool:** Configured for 10 concurrent connections.
- **Environment Support:** `HibernateUtil.java` prioritizes environment variables (`DB_URL`, `DB_USER`, `DB_PASSWORD`) for cloud compatibility (e.g., Railway, Heroku).

---

## 7. Setup & Deployment
### Prerequisites
- JDK 11+
- Maven 3.x
- MySQL Server 8

### Installation Steps
1.  **Database:** Create a database named `PCM`.
2.  **Configuration:** Rename `hibernate.cfg.xml.example` to `hibernate.cfg.xml` and update credentials.
3.  **Build:** Run `mvn clean package`.
4.  **Deploy:** Copy the generated `PCMS.war` to your Tomcat `webapps` directory.

### Initial Seed
The default admin account can be created with the following SQL:
```sql
INSERT INTO Users (firstName, lastName, email, password, phone, role, status)
VALUES ('Admin', 'User', 'admin@pcms.com', MD5('admin123'), '0780000000', 'ADMIN', 'Available');
```

---

## 8. Directory Structure
```text
src/main/java/com/pcms/
├── dao/        # Data Access Objects (Hibernate Queries)
├── filter/     # Security Filters
├── model/      # JPA Entities (Database Tables)
├── servlet/    # Controllers (Request Handlers)
└── util/       # Helpers (HibernateUtil, PasswordUtil)

src/main/webapp/
├── views/      # JSP Pages
│   ├── admin/      # Admin Panel
│   ├── technician/ # Technician Panel
│   └── common/     # Shared Components (Header, Navbar)
└── WEB-INF/    # Deployment Descriptor
```

---

## 9. Project Team & Contributors
| Name | Reg Number | Role |
|---|---|---|
| **ABERA Ebenezer** | 224001481 | Team Lead & Backend |
| **Elise Mucyo** | 224009506 | Backend Development |
| **IKUZWE BANA Simplice** | 224007832 | Frontend Development |
| **Ishami Gaelle Bega** | 224011161 | Frontend Development |
| **IRADUKUNDA GWIZA Moise** | 224004102 | Database Design |
