<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>PCMS &mdash; Admin Dashboard</title>
    <%@ include file="../common/head.jsp" %>
</head>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="layout">
    <%@ include file="../common/sidebar-admin.jsp" %>
    <main class="main-content">
        <div class="page-header">
            <h1 class="page-title">Admin <span>Dashboard</span></h1>
            <span style="color:var(--text-muted);font-size:0.9rem"><i class="fas fa-calendar-alt me-1"></i>Overview</span>
        </div>

        <p class="section-header"><i class="fas fa-computer"></i>PCs</p>
        <div class="row g-3 mb-4">
            <div class="col-6 col-lg-3"><div class="stat-card"><div class="d-flex align-items-center gap-3"><div class="stat-icon" style="background:#dcfce7"><i class="fas fa-check-circle" style="color:#16a34a"></i></div><div><div class="stat-value">${pcWorking}</div><div class="stat-label">Working</div></div></div></div></div>
            <div class="col-6 col-lg-3"><div class="stat-card"><div class="d-flex align-items-center gap-3"><div class="stat-icon" style="background:#fee2e2"><i class="fas fa-times-circle" style="color:#dc2626"></i></div><div><div class="stat-value">${pcNotWorking}</div><div class="stat-label">Not Working</div></div></div></div></div>
            <div class="col-6 col-lg-3"><div class="stat-card"><div class="d-flex align-items-center gap-3"><div class="stat-icon" style="background:#fef9c3"><i class="fas fa-exclamation-triangle" style="color:#d97706"></i></div><div><div class="stat-value">${pcDamaged}</div><div class="stat-label">Damaged</div></div></div></div></div>
            <div class="col-6 col-lg-3"><div class="stat-card"><div class="d-flex align-items-center gap-3"><div class="stat-icon" style="background:#f1f5f9"><i class="fas fa-history" style="color:#64748b"></i></div><div><div class="stat-value">${pcOld}</div><div class="stat-label">Old (${pcTotal} total)</div></div></div></div></div>
        </div>

        <p class="section-header"><i class="fas fa-keyboard"></i>Accessories</p>
        <div class="row g-3 mb-4">
            <div class="col-6 col-lg-3"><div class="stat-card"><div class="d-flex align-items-center gap-3"><div class="stat-icon" style="background:#dcfce7"><i class="fas fa-check-circle" style="color:#16a34a"></i></div><div><div class="stat-value">${accWorking}</div><div class="stat-label">Working</div></div></div></div></div>
            <div class="col-6 col-lg-3"><div class="stat-card"><div class="d-flex align-items-center gap-3"><div class="stat-icon" style="background:#fee2e2"><i class="fas fa-times-circle" style="color:#dc2626"></i></div><div><div class="stat-value">${accNotWorking}</div><div class="stat-label">Not Working</div></div></div></div></div>
            <div class="col-6 col-lg-3"><div class="stat-card"><div class="d-flex align-items-center gap-3"><div class="stat-icon" style="background:#fef9c3"><i class="fas fa-exclamation-triangle" style="color:#d97706"></i></div><div><div class="stat-value">${accDamaged}</div><div class="stat-label">Damaged</div></div></div></div></div>
            <div class="col-6 col-lg-3"><div class="stat-card"><div class="d-flex align-items-center gap-3"><div class="stat-icon" style="background:#f1f5f9"><i class="fas fa-history" style="color:#64748b"></i></div><div><div class="stat-value">${accOld}</div><div class="stat-label">Old (${accTotal} total)</div></div></div></div></div>
        </div>

        <p class="section-header"><i class="fas fa-network-wired"></i>Network Devices</p>
        <div class="row g-3 mb-4">
            <div class="col-6 col-lg-3"><div class="stat-card"><div class="d-flex align-items-center gap-3"><div class="stat-icon" style="background:#dcfce7"><i class="fas fa-check-circle" style="color:#16a34a"></i></div><div><div class="stat-value">${netWorking}</div><div class="stat-label">Working</div></div></div></div></div>
            <div class="col-6 col-lg-3"><div class="stat-card"><div class="d-flex align-items-center gap-3"><div class="stat-icon" style="background:#fee2e2"><i class="fas fa-times-circle" style="color:#dc2626"></i></div><div><div class="stat-value">${netNotWorking}</div><div class="stat-label">Not Working</div></div></div></div></div>
            <div class="col-6 col-lg-3"><div class="stat-card"><div class="d-flex align-items-center gap-3"><div class="stat-icon" style="background:#fef9c3"><i class="fas fa-exclamation-triangle" style="color:#d97706"></i></div><div><div class="stat-value">${netDamaged}</div><div class="stat-label">Damaged</div></div></div></div></div>
            <div class="col-6 col-lg-3"><div class="stat-card"><div class="d-flex align-items-center gap-3"><div class="stat-icon" style="background:#f1f5f9"><i class="fas fa-history" style="color:#64748b"></i></div><div><div class="stat-value">${netOld}</div><div class="stat-label">Old (${netTotal} total)</div></div></div></div></div>
        </div>

        <div class="row g-4">
            <div class="col-lg-6">
                <div class="card-light p-4">
                    <p class="section-header"><i class="fas fa-users-cog"></i>Technicians Status</p>
                    <div class="d-flex flex-column gap-2">
                        <div class="d-flex align-items-center justify-content-between p-3 rounded" style="background:#f0fdf4;border:1px solid #bbf7d0">
                            <span style="color:#15803d;font-weight:600"><i class="fas fa-circle me-2" style="font-size:0.55rem;vertical-align:middle"></i>Available</span>
                            <span class="fw-bold fs-4" style="color:#15803d">${techAvailable}</span>
                        </div>
                        <div class="d-flex align-items-center justify-content-between p-3 rounded" style="background:#fefce8;border:1px solid #fde68a">
                            <span style="color:#a16207;font-weight:600"><i class="fas fa-circle me-2" style="font-size:0.55rem;vertical-align:middle"></i>Busy</span>
                            <span class="fw-bold fs-4" style="color:#a16207">${techBusy}</span>
                        </div>
                        <div class="d-flex align-items-center justify-content-between p-3 rounded" style="background:#f8fafc;border:1px solid #e2e8f0">
                            <span style="color:#64748b;font-weight:600"><i class="fas fa-circle me-2" style="font-size:0.55rem;vertical-align:middle"></i>Not Available</span>
                            <span class="fw-bold fs-4" style="color:#64748b">${techNotAvailable}</span>
                        </div>
                    </div>
                    <a href="${pageContext.request.contextPath}/admin/technicians" class="btn btn-pcms mt-3 w-100"><i class="fas fa-arrow-right me-1"></i>Manage Technicians</a>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="card-light p-4">
                    <p class="section-header"><i class="fas fa-ticket-alt"></i>Service Requests</p>
                    <div class="d-flex flex-column gap-2">
                        <div class="d-flex align-items-center justify-content-between p-3 rounded" style="background:#eff6ff;border:1px solid #bfdbfe">
                            <span style="color:#1d4ed8;font-weight:600"><i class="fas fa-hourglass-half me-2"></i>Pending</span>
                            <span class="fw-bold fs-4" style="color:#1d4ed8">${reqPending}</span>
                        </div>
                        <div class="d-flex align-items-center justify-content-between p-3 rounded" style="background:#f5f3ff;border:1px solid #ddd6fe">
                            <span style="color:#6d28d9;font-weight:600"><i class="fas fa-user-check me-2"></i>Assigned</span>
                            <span class="fw-bold fs-4" style="color:#6d28d9">${reqAssigned}</span>
                        </div>
                        <div class="d-flex align-items-center justify-content-between p-3 rounded" style="background:#f0fdf4;border:1px solid #bbf7d0">
                            <span style="color:#15803d;font-weight:600"><i class="fas fa-check-double me-2"></i>Fixed</span>
                            <span class="fw-bold fs-4" style="color:#15803d">${reqFixed}</span>
                        </div>
                    </div>
                    <a href="${pageContext.request.contextPath}/admin/requests" class="btn btn-pcms mt-3 w-100"><i class="fas fa-arrow-right me-1"></i>Manage Requests</a>
                </div>
            </div>
        </div>
    </main>
</div>
<%@ include file="../common/scripts.jsp" %>
</body>
</html>
