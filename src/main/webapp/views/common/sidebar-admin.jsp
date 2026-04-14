<%@ page contentType="text/html;charset=UTF-8" %>
<div class="sidebar" id="sidebar">
    <div class="sidebar-brand">
        <i class="fas fa-desktop me-2"></i>PCMS Admin
    </div>
    <nav class="sidebar-nav">
        <div class="nav-section">Overview</div>
        <a href="${pageContext.request.contextPath}/admin/dashboard" class="nav-link-item">
            <i class="fas fa-tachometer-alt"></i><span>Dashboard</span>
        </a>

        <div class="nav-section">Equipment</div>
        <a href="${pageContext.request.contextPath}/admin/pcs" class="nav-link-item">
            <i class="fas fa-computer"></i><span>PCs</span>
        </a>
        <a href="${pageContext.request.contextPath}/admin/accessories" class="nav-link-item">
            <i class="fas fa-keyboard"></i><span>Accessories</span>
        </a>
        <a href="${pageContext.request.contextPath}/admin/network-devices" class="nav-link-item">
            <i class="fas fa-network-wired"></i><span>Network Devices</span>
        </a>

        <div class="nav-section">Management</div>
        <a href="${pageContext.request.contextPath}/admin/technicians" class="nav-link-item">
            <i class="fas fa-users-cog"></i><span>Technicians</span>
        </a>
        <a href="${pageContext.request.contextPath}/admin/requests" class="nav-link-item">
            <i class="fas fa-ticket-alt"></i><span>Requests</span>
        </a>
        <a href="${pageContext.request.contextPath}/admin/reports" class="nav-link-item">
            <i class="fas fa-chart-bar"></i><span>Reports</span>
        </a>

        <div class="nav-section">Account</div>
        <a href="${pageContext.request.contextPath}/logout" class="nav-link-item text-danger">
            <i class="fas fa-sign-out-alt"></i><span>Logout</span>
        </a>
    </nav>
</div>
