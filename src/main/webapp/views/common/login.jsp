<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PCMS &mdash; Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #eff6ff 0%, #dbeafe 50%, #e0f2fe 100%);
            min-height: 100vh;
            display: flex; align-items: center; justify-content: center;
        }
        .login-wrap {
            display: flex; width: 900px; max-width: 98vw;
            background: #fff; border-radius: 24px;
            box-shadow: 0 20px 60px rgba(37,99,235,0.13);
            overflow: hidden;
        }
        .login-left {
            background: linear-gradient(160deg, #1e3a5f 0%, #2563eb 100%);
            width: 42%; padding: 3rem 2.5rem;
            display: flex; flex-direction: column;
            align-items: center; justify-content: center; text-align: center;
        }
        .login-left .brand-icon {
            width: 80px; height: 80px; border-radius: 50%;
            background: rgba(255,255,255,0.15);
            display: flex; align-items: center; justify-content: center;
            font-size: 2.2rem; color: #fff; margin: 0 auto 1.5rem;
            border: 2px solid rgba(255,255,255,0.25);
        }
        .login-left h2 { color: #fff; font-weight: 800; font-size: 1.8rem; margin-bottom: 0.4rem; }
        .login-left p  { color: rgba(255,255,255,0.7); font-size: 0.9rem; line-height: 1.6; }
        .feature-item { display: flex; align-items: center; gap: 0.6rem; margin-top: 1rem; color: rgba(255,255,255,0.8); font-size: 0.85rem; }
        .feature-item i { color: #93c5fd; }

        .login-right { flex: 1; padding: 3rem 2.5rem; }
        .login-right h3 { color: #1e293b; font-weight: 700; font-size: 1.4rem; margin-bottom: 0.3rem; }
        .login-right p.sub { color: #64748b; font-size: 0.88rem; margin-bottom: 1.75rem; }

        .form-label { font-weight: 600; font-size: 0.85rem; color: #374151; }
        .form-control {
            border: 1.5px solid #e2e8f0; border-radius: 10px;
            padding: 0.65rem 1rem; font-size: 0.9rem; color: #1e293b;
        }
        .form-control:focus { border-color: #2563eb; box-shadow: 0 0 0 3px rgba(37,99,235,0.12); }
        .input-group-text {
            background: #f8fafc; border: 1.5px solid #e2e8f0;
            color: #94a3b8; border-radius: 10px 0 0 10px;
        }
        .input-group .form-control { border-radius: 0 10px 10px 0; border-left: none; }
        .btn-login {
            background: linear-gradient(135deg, #2563eb, #1d4ed8);
            border: none; border-radius: 10px;
            padding: 0.7rem; font-weight: 700; font-size: 0.95rem;
            letter-spacing: 0.3px; transition: all 0.2s;
        }
        .btn-login:hover { transform: translateY(-2px); box-shadow: 0 6px 20px rgba(37,99,235,0.35); }
        .submit-link { color: #64748b; font-size: 0.87rem; text-align: center; margin-top: 1.25rem; }
        .submit-link a { color: #2563eb; font-weight: 600; text-decoration: none; }
        .submit-link a:hover { text-decoration: underline; }
        @media (max-width: 600px) { .login-left { display: none; } }
    </style>
</head>
<body>
<div class="login-wrap">
    <!-- Left panel -->
    <div class="login-left">
        <div class="brand-icon"><i class="fas fa-desktop"></i></div>
        <h2>PCMS</h2>
        <p>PC Maintenance Management System</p>
        <div class="feature-item"><i class="fas fa-check-circle"></i>Equipment Tracking</div>
        <div class="feature-item"><i class="fas fa-check-circle"></i>Technician Management</div>
        <div class="feature-item"><i class="fas fa-check-circle"></i>ICT Request Portal</div>
        <div class="feature-item"><i class="fas fa-check-circle"></i>Real-time Reports</div>
    </div>
    <!-- Right panel -->
    <div class="login-right">
        <h3>Welcome Back</h3>
        <p class="sub">Sign in to your PCMS account</p>

        <% if (request.getAttribute("error") != null) { %>
        <div class="alert alert-danger alert-dismissible fade show mb-4" style="border-radius:10px;background:#fff1f2;border:1px solid #fecdd3;color:#b91c1c;">
            <i class="fas fa-exclamation-circle me-2"></i><%= request.getAttribute("error") %>
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
        <% } %>

        <form method="post" action="${pageContext.request.contextPath}/login">
            <div class="mb-3">
                <label class="form-label">Email Address</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                    <input type="email" name="email" class="form-control" placeholder="admin@pcms.com" required>
                </div>
            </div>
            <div class="mb-4">
                <label class="form-label">Password</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-lock"></i></span>
                    <input type="password" name="password" class="form-control" placeholder="Enter your password" required>
                </div>
            </div>
            <button type="submit" class="btn btn-login btn-primary w-100 text-white">
                <i class="fas fa-sign-in-alt me-2"></i>Sign In
            </button>
        </form>
        <p class="submit-link">
            Need ICT support? <a href="${pageContext.request.contextPath}/submit-request">Submit a Request</a>
        </p>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>
