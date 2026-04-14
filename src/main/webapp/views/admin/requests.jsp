<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>PCMS &mdash; Service Requests</title>
    <%@ include file="../common/head.jsp" %>
</head>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="layout">
    <%@ include file="../common/sidebar-admin.jsp" %>
    <main class="main-content">
        <div class="page-header">
            <h1 class="page-title"><span>Service</span> Requests</h1>
        </div>

        <c:if test="${not empty param.success}">
            <div class="alert alert-success alert-dismissible fade show alert-auto">
                <i class="fas fa-check-circle me-2"></i>${param.success}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        </c:if>

        <div class="filter-bar">
            <a href="${pageContext.request.contextPath}/admin/requests" class="btn btn-sm btn-outline-secondary">All</a>
            <a href="${pageContext.request.contextPath}/admin/requests?status=Pending" class="btn btn-sm btn-outline-primary">Pending</a>
            <a href="${pageContext.request.contextPath}/admin/requests?status=Technician_Assigned" class="btn btn-sm" style="background:#f5f3ff;color:#6d28d9;border:1px solid #ddd6fe">Assigned</a>
            <a href="${pageContext.request.contextPath}/admin/requests?status=Fixed" class="btn btn-sm btn-outline-success">Fixed</a>
            <a href="${pageContext.request.contextPath}/admin/requests?status=Not_fixed" class="btn btn-sm btn-outline-danger">Not Fixed</a>
        </div>

        <div class="card-light">
            <div class="table-responsive">
                <table class="table table-custom mb-0">
                    <thead><tr>
                        <th>#</th><th>Requester</th><th>Contact</th><th>Unit</th>
                        <th>Request Type</th><th>Date</th><th>Status</th><th>Technician</th><th class="text-center">Actions</th>
                    </tr></thead>
                    <tbody>
                    <c:forEach var="r" items="${requests}" varStatus="vs">
                        <tr>
                            <td style="color:var(--text-muted);font-size:0.82rem">#${r.id}</td>
                            <td>
                                <div class="fw-semibold">${r.fullName}</div>
                                <div style="color:var(--text-muted);font-size:0.8rem">${r.email}</div>
                            </td>
                            <td style="font-size:0.85rem">${r.telephone}</td>
                            <td style="font-size:0.85rem">${r.unit}</td>
                            <td><span class="badge bg-light text-primary border" style="font-size:0.75rem;border-color:#bfdbfe!important">${r.requestType}</span></td>
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
                            <td style="font-size:0.85rem">${r.technician != null ? r.technician.fullName : '<span style="color:var(--text-light)">-</span>'}</td>
                            <td class="text-center">
                                <c:if test="${r.status.toString() == 'Pending' || r.status.toString() == 'Technician_Assigned'}">
                                    <a href="${pageContext.request.contextPath}/admin/requests?action=assign&id=${r.id}"
                                       class="btn btn-sm btn-outline-primary me-1" title="Assign Technician">
                                        <i class="fas fa-user-plus"></i>
                                    </a>
                                </c:if>
                                <form method="post" action="${pageContext.request.contextPath}/admin/requests" class="d-inline">
                                    <input type="hidden" name="action" value="updateStatus">
                                    <input type="hidden" name="requestId" value="${r.id}">
                                    <select name="status" class="form-select form-select-sm d-inline-block w-auto"
                                        onchange="this.form.submit()" style="font-size:0.78rem">
                                        <option value="${r.status}" selected>Change...</option>
                                        <option value="Pending">Pending</option>
                                        <option value="Technician_Assigned">Assigned</option>
                                        <option value="Fixed">Fixed</option>
                                        <option value="Not_fixed">Not Fixed</option>
                                    </select>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty requests}">
                        <tr><td colspan="9" class="text-center py-5" style="color:var(--text-muted)">
                            <i class="fas fa-ticket-alt fa-2x mb-2 d-block" style="color:var(--text-light)"></i>No requests found.
                        </td></tr>
                    </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </main>
</div>
<%@ include file="../common/scripts.jsp" %>
</body>
</html>
