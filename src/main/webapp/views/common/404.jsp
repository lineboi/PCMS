<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>PCMS &mdash; Page Not Found</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        body { background: #0f1923; color: #e8eaf0; min-height: 100vh; display: flex; align-items: center; justify-content: center; }
        .err-icon { font-size: 5rem; color: #e94560; }
    </style>
</head>
<body>
<div class="text-center">
    <div class="err-icon mb-3"><i class="fas fa-exclamation-circle"></i></div>
    <h1 class="display-4 fw-bold">404</h1>
    <p class="lead text-muted">The page you're looking for doesn't exist.</p>
    <a href="${pageContext.request.contextPath}/" class="btn mt-3" style="background:#e94560;color:#fff;border-radius:10px">
        <i class="fas fa-home me-2"></i>Go Home
    </a>
</div>
</body>
</html>
