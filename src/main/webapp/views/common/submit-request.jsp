<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PCMS &mdash; Submit ICT Request</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #1a1a2e 0%, #16213e 50%, #0f3460 100%);
            min-height: 100vh;
            padding: 2rem 1rem;
        }
        .req-card {
            background: rgba(255,255,255,0.05);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255,255,255,0.12);
            border-radius: 20px;
            padding: 2.5rem;
            max-width: 650px;
            margin: auto;
        }
        .form-control, .form-select {
            background: rgba(255,255,255,0.07);
            border: 1px solid rgba(255,255,255,0.15);
            color: #fff;
            border-radius: 10px;
        }
        .form-control:focus, .form-select:focus {
            background: rgba(255,255,255,0.12);
            border-color: #e94560;
            color: #fff;
            box-shadow: 0 0 0 3px rgba(233,69,96,0.25);
        }
        .form-control::placeholder { color: rgba(255,255,255,0.35); }
        .form-select option { background: #1e2d3d; }
        .form-label { color: rgba(255,255,255,0.8); font-weight: 500; }
        .brand-icon {
            width: 70px; height: 70px;
            background: linear-gradient(135deg, #e94560, #0f3460);
            border-radius: 50%;
            display: flex; align-items: center; justify-content: center;
            margin: 0 auto 1rem;
            font-size: 1.8rem; color: #fff;
        }
        h2 { color: #fff; }
        p.sub { color: rgba(255,255,255,0.55); }
        .btn-submit {
            background: linear-gradient(135deg, #e94560, #c73652);
            border: none; border-radius: 10px;
            font-weight: 600; transition: all 0.3s;
        }
        .btn-submit:hover { transform: translateY(-2px); box-shadow: 0 8px 25px rgba(233,69,96,0.4); }
        .login-link { color: rgba(255,255,255,0.55); font-size: 0.9rem; text-align: center; margin-top: 1rem; }
        .login-link a { color: #e94560; text-decoration: none; }
    </style>
</head>
<body>
<div class="req-card">
    <div class="text-center mb-4">
        <div class="brand-icon"><i class="fas fa-headset"></i></div>
        <h2 class="fw-bold">ICT Support Request</h2>
        <p class="sub">Submit a request for ICT services and support</p>
    </div>

    <c:if test="${not empty success}">
        <div class="alert alert-success" style="border-radius:10px">
            <i class="fas fa-check-circle me-2"></i>${success}
        </div>
    </c:if>

    <form method="post" action="${pageContext.request.contextPath}/submit-request">
        <div class="row g-3">
            <div class="col-md-6">
                <label class="form-label">First Name</label>
                <input type="text" name="firstName" class="form-control" required placeholder="John">
            </div>
            <div class="col-md-6">
                <label class="form-label">Last Name</label>
                <input type="text" name="lastName" class="form-control" required placeholder="Doe">
            </div>
            <div class="col-md-6">
                <label class="form-label">Email Address</label>
                <input type="email" name="email" class="form-control" required placeholder="john@example.com">
            </div>
            <div class="col-md-6">
                <label class="form-label">Telephone</label>
                <input type="text" name="telephone" class="form-control" placeholder="07XXXXXXXX">
            </div>
            <div class="col-12">
                <label class="form-label">Department / Unit</label>
                <select name="unit" class="form-select" required>
                    <option value="">-- Select Unit --</option>
                    <option>Human Resources (HR)</option>
                    <option>Finance</option>
                    <option>Administration</option>
                    <option>ICT Department</option>
                    <option>Academic Affairs</option>
                    <option>Student Services</option>
                    <option>Procurement</option>
                    <option>Library</option>
                    <option>Research & Development</option>
                    <option>Security</option>
                    <option>Maintenance</option>
                    <option>Other</option>
                </select>
            </div>
            <div class="col-12">
                <label class="form-label">Request Type</label>
                <select name="requestType" class="form-select" required>
                    <option value="">-- Select Request Type --</option>
                    <option>Internet Cable Installation</option>
                    <option>Internet Connectivity Issue</option>
                    <option>Operating System Fix / Reinstall</option>
                    <option>Antivirus Installation / Update</option>
                    <option>Software Installation</option>
                    <option>Hardware Repair</option>
                    <option>Printer Setup / Repair</option>
                    <option>Email Configuration</option>
                    <option>Password Reset</option>
                    <option>Data Recovery</option>
                    <option>Network Configuration</option>
                    <option>CCTV / Surveillance Issue</option>
                    <option>Projector / Display Issue</option>
                    <option>Other ICT Service</option>
                </select>
            </div>
            <div class="col-12 mt-2">
                <button type="submit" class="btn btn-submit btn-primary w-100 py-2 text-white">
                    <i class="fas fa-paper-plane me-2"></i>Submit Request
                </button>
            </div>
        </div>
    </form>
    <p class="login-link"><a href="${pageContext.request.contextPath}/login"><i class="fas fa-arrow-left me-1"></i>Back to Login</a></p>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>
