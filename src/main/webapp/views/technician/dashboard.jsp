<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>PCMS &mdash; Technician Dashboard</title>
    <%@ include file="../common/head.jsp" %>
</head>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="layout">
    <%@ include file="../common/sidebar-tech.jsp" %>
    <main class="main-content">
        <div class="page-header">
            <h1 class="page-title">Welcome, <span>${sessionScope.loggedUser.firstName}</span></h1>
            <span style="color:var(--text-muted);font-size:0.9rem"><i class="fas fa-tools me-1"></i>Technician Portal</span>
        </div>

        <div class="row g-3 mb-4">
            <div class="col-6 col-lg-3"><div class="stat-card"><div class="d-flex align-items-center gap-3"><div class="stat-icon" style="background:#dbeafe"><i class="fas fa-computer" style="color:#2563eb"></i></div><div><div class="stat-value">${myPCs.size()}</div><div class="stat-label">My PCs</div></div></div></div></div>
            <div class="col-6 col-lg-3"><div class="stat-card"><div class="d-flex align-items-center gap-3"><div class="stat-icon" style="background:#f5f3ff"><i class="fas fa-keyboard" style="color:#7c3aed"></i></div><div><div class="stat-value">${myAccessories.size()}</div><div class="stat-label">Accessories</div></div></div></div></div>
            <div class="col-6 col-lg-3"><div class="stat-card"><div class="d-flex align-items-center gap-3"><div class="stat-icon" style="background:#fefce8"><i class="fas fa-network-wired" style="color:#d97706"></i></div><div><div class="stat-value">${myNetworkDevices.size()}</div><div class="stat-label">Network Devices</div></div></div></div></div>
            <div class="col-6 col-lg-3"><div class="stat-card"><div class="d-flex align-items-center gap-3"><div class="stat-icon" style="background:#fee2e2"><i class="fas fa-ticket-alt" style="color:#dc2626"></i></div><div><div class="stat-value">${myRequests.size()}</div><div class="stat-label">My Requests</div></div></div></div></div>
        </div>

        <div class="card-light mb-4">
            <div class="card-divider d-flex align-items-center justify-content-between">
                <span class="section-header mb-0"><i class="fas fa-ticket-alt"></i>My Assigned Requests</span>
                <a href="${pageContext.request.contextPath}/technician/requests" class="btn btn-pcms btn-sm">View All</a>
            </div>
            <div class="table-responsive">
                <table class="table table-custom mb-0">
                    <thead><tr><th>#</th><th>Requester</th><th>Unit</th><th>Type</th><th>Date</th><th>Status</th></tr></thead>
                    <tbody>
                    <c:forEach var="r" items="${myRequests}" varStatus="vs" end="4">
                        <tr>
                            <td style="color:var(--text-muted)">#${r.id}</td>
                            <td class="fw-semibold">${r.fullName}</td>
                            <td style="font-size:0.85rem">${r.unit}</td>
                            <td style="font-size:0.85rem">${r.requestType}</td>
                            <td style="color:var(--text-muted);font-size:0.82rem">${r.requestDate}</td>
                            <td>
                                <span class="badge-status
                                    <c:choose>
                                        <c:when test="${r.status.toString() == 'Pending'}">bs-pending</c:when>
                                        <c:when test="${r.status.toString() == 'Technician_Assigned'}">bs-technician_assigned</c:when>
                                        <c:when test="${r.status.toString() == 'Fixed'}">bs-fixed</c:when>
                                        <c:otherwise>bs-not_fixed</c:otherwise>
                                    </c:choose>">
                                    ${r.status.toString().replace('_',' ')}
                                </span>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty myRequests}"><tr><td colspan="6" class="text-center py-3" style="color:var(--text-muted)">No requests assigned yet.</td></tr></c:if>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="card-light">
            <div class="card-divider d-flex align-items-center justify-content-between">
                <span class="section-header mb-0"><i class="fas fa-laptop-medical"></i>My Equipment</span>
                <a href="${pageContext.request.contextPath}/technician/equipment" class="btn btn-pcms btn-sm">Manage</a>
            </div>
            <div class="p-3">
                <div class="row g-2">
                    <c:forEach var="pc" items="${myPCs}" end="5">
                        <div class="col-md-4">
                            <div class="p-3 rounded" style="background:#f8fafc;border:1px solid var(--border)">
                                <div class="d-flex justify-content-between align-items-center">
                                    <small class="fw-semibold" style="color:var(--text-main)"><i class="fas fa-computer me-1" style="color:var(--primary)"></i>${pc.brand} ${pc.pcType}</small>
                                    <span class="badge-status bs-${pc.status.toString().toLowerCase()}" style="font-size:0.7rem">${pc.status.toString().replace('_',' ')}</span>
                                </div>
                                <small style="color:var(--text-muted)" class="d-block mt-1">${pc.location} &bull; ${pc.os}</small>
                            </div>
                        </div>
                    </c:forEach>
                    <c:if test="${empty myPCs}"><div class="col-12"><p class="text-center py-2" style="color:var(--text-muted)">No equipment assigned.</p></div></c:if>
                </div>
            </div>
        </div>
    </main>
</div>
<%@ include file="../common/scripts.jsp" %>
</body>
</html>
