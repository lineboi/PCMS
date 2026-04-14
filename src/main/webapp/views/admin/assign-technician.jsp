<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>PCMS &mdash; Assign Technician</title>
    <%@ include file="../common/head.jsp" %>
</head>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="layout">
    <%@ include file="../common/sidebar-admin.jsp" %>
    <main class="main-content">
        <div class="page-header">
            <h1 class="page-title"><span>Assign</span> Technician</h1>
            <a href="${pageContext.request.contextPath}/admin/requests" class="btn btn-outline-secondary"><i class="fas fa-arrow-left me-2"></i>Back</a>
        </div>

        <div class="row g-4">
            <div class="col-lg-5">
                <div class="card-light p-4">
                    <h6 class="mb-3 text-muted"><i class="fas fa-info-circle me-2"></i>Request Details</h6>
                    <table class="table table-custom table-sm mb-0">
                        <tr><th>ID</th><td>#${request.id}</td></tr>
                        <tr><th>Requester</th><td>${request.fullName}</td></tr>
                        <tr><th>Email</th><td>${request.email}</td></tr>
                        <tr><th>Phone</th><td>${request.telephone}</td></tr>
                        <tr><th>Unit</th><td>${request.unit}</td></tr>
                        <tr><th>Request</th><td>${request.requestType}</td></tr>
                        <tr><th>Date</th><td>${request.requestDate}</td></tr>
                        <tr><th>Status</th><td>${request.status.toString().replace('_',' ')}</td></tr>
                    </table>
                </div>
            </div>
            <div class="col-lg-5">
                <div class="card-light p-4">
                    <h6 class="mb-3 text-muted"><i class="fas fa-user-plus me-2"></i>Select Technician</h6>
                    <form method="post" action="${pageContext.request.contextPath}/admin/requests">
                        <input type="hidden" name="action" value="assign">
                        <input type="hidden" name="requestId" value="${request.id}">
                        <div class="mb-3">
                            <label class="form-label">Technician</label>
                            <select name="technicianId" class="form-select" required>
                                <option value="">-- Select Technician --</option>
                                <c:forEach var="t" items="${technicians}">
                                    <option value="${t.id}">${t.fullName} &bull; ${t.status}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-pcms w-100">
                            <i class="fas fa-user-check me-2"></i>Assign Technician
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </main>
</div>
<%@ include file="../common/scripts.jsp" %>
</body>
</html>
