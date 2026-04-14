<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>PCMS &mdash; My Requests</title>
    <%@ include file="../common/head.jsp" %>
</head>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="layout">
    <%@ include file="../common/sidebar-tech.jsp" %>
    <main class="main-content">
        <div class="page-header">
            <h1 class="page-title">My <span>Requests</span></h1>
        </div>
        <div class="card-light">
            <div class="table-responsive">
                <table class="table table-custom mb-0">
                    <thead><tr><th>#</th><th>Requester</th><th>Unit</th><th>Request Type</th><th>Date</th><th>Status</th></tr></thead>
                    <tbody>
                    <c:forEach var="r" items="${requests}">
                        <tr>
                            <td style="color:var(--text-muted)">#${r.id}</td>
                            <td><div class="fw-semibold">${r.fullName}</div><div style="color:var(--text-muted);font-size:0.8rem">${r.email} &bull; ${r.telephone}</div></td>
                            <td>${r.unit}</td>
                            <td>${r.requestType}</td>
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
                    <c:if test="${empty requests}"><tr><td colspan="6" class="text-center py-5" style="color:var(--text-muted)"><i class="fas fa-ticket-alt fa-2x mb-2 d-block" style="color:var(--text-light)"></i>No requests assigned to you yet.</td></tr></c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </main>
</div>
<%@ include file="../common/scripts.jsp" %>
</body>
</html>
