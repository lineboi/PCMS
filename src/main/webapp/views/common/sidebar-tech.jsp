<%@ page contentType="text/html;charset=UTF-8" %>
<div class="sidebar" id="sidebar">
    <div class="sidebar-brand">
        <i class="fas fa-tools me-2"></i>PCMS Tech
    </div>
    <nav class="sidebar-nav">
        <div class="nav-section">Overview</div>
        <a href="${pageContext.request.contextPath}/technician/dashboard" class="nav-link-item">
            <i class="fas fa-tachometer-alt"></i><span>Dashboard</span>
        </a>

        <div class="nav-section">My Work</div>
        <a href="${pageContext.request.contextPath}/technician/equipment" class="nav-link-item">
            <i class="fas fa-laptop-medical"></i><span>My Equipment</span>
        </a>
        <a href="${pageContext.request.contextPath}/technician/requests" class="nav-link-item">
            <i class="fas fa-ticket-alt"></i><span>My Requests</span>
        </a>

        <div class="nav-section">Account</div>
        <a href="${pageContext.request.contextPath}/logout" class="nav-link-item text-danger">
            <i class="fas fa-sign-out-alt"></i><span>Logout</span>
        </a>
    </nav>
</div>
