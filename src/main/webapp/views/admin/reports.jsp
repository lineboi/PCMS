<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>PCMS &mdash; Reports</title>
    <%@ include file="../common/head.jsp" %>
</head>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="layout">
    <%@ include file="../common/sidebar-admin.jsp" %>
    <main class="main-content">
        <div class="page-header">
            <h1 class="page-title"><span>Equipment</span> Reports</h1>
        </div>

        <c:if test="${not empty param.success}">
            <div class="alert alert-success alert-dismissible fade show alert-auto">
                <i class="fas fa-check-circle me-2"></i>${param.success}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        </c:if>

        <div class="card-light">
            <div class="table-responsive">
                <table class="table table-custom table-hover mb-0">
                    <thead><tr>
                        <th>#</th><th>Category</th><th>Device ID</th><th>Status</th>
                        <th>Location</th><th>Date</th><th>Technician</th><th>Notes</th><th class="text-center">Actions</th>
                    </tr></thead>
                    <tbody>
                    <c:forEach var="r" items="${reports}" varStatus="vs">
                        <tr>
                            <td>${vs.count}</td>
                            <td><span class="badge bg-secondary">${r.deviceCategory}</span></td>
                            <td>#${r.deviceId}</td>
                            <td>
                                <span class="badge-status badge-${r.status.toString().toLowerCase()}">
                                    ${r.status.toString().replace('_',' ')}
                                </span>
                            </td>
                            <td>${r.deviceLocation}</td>
                            <td class="text-muted small">${r.reportDate}</td>
                            <td>${r.technician != null ? r.technician.fullName : '-'}</td>
                            <td class="small text-muted" style="max-width:200px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap">${r.notes}</td>
                            <td class="text-center">
                                <a href="${pageContext.request.contextPath}/admin/reports?action=delete&id=${r.id}"
                                   class="btn btn-sm btn-outline-danger"
                                   onclick="return confirm('Delete this report?')">
                                    <i class="fas fa-trash"></i>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty reports}">
                        <tr><td colspan="9" class="text-center text-muted py-4">
                            <i class="fas fa-chart-bar fa-2x mb-2 d-block"></i>No reports found.
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
