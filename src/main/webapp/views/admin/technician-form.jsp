<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>PCMS &mdash; ${empty tech ? 'Add' : 'Edit'} Technician</title>
    <%@ include file="../common/head.jsp" %>
</head>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="layout">
    <%@ include file="../common/sidebar-admin.jsp" %>
    <main class="main-content">
        <div class="page-header">
            <h1 class="page-title"><span>${empty tech ? 'Add' : 'Edit'}</span> Technician</h1>
            <a href="${pageContext.request.contextPath}/admin/technicians" class="btn btn-outline-secondary">
                <i class="fas fa-arrow-left me-2"></i>Back
            </a>
        </div>

        <c:if test="${not empty error}">
            <div class="alert alert-danger alert-dismissible fade show">
                <i class="fas fa-exclamation-triangle me-2"></i>${error}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        </c:if>

        <div class="card-light p-4" style="max-width:600px">
            <form method="post" action="${pageContext.request.contextPath}/admin/technicians">
                <input type="hidden" name="action" value="${empty tech ? 'save' : 'update'}">
                <c:if test="${not empty tech}">
                    <input type="hidden" name="id" value="${tech.id}">
                </c:if>
                <div class="row g-3">
                    <div class="col-md-6">
                        <label class="form-label">First Name</label>
                        <input type="text" name="firstName" class="form-control" value="${tech.firstName}" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Last Name</label>
                        <input type="text" name="lastName" class="form-control" value="${tech.lastName}" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Email</label>
                        <input type="email" name="email" class="form-control" value="${tech.email}" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Phone</label>
                        <input type="text" name="phone" class="form-control" value="${tech.phone}">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Password ${not empty tech ? '(leave blank to keep)' : ''}</label>
                        <input type="password" name="password" class="form-control" ${empty tech ? 'required' : ''}>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Status</label>
                        <select name="status" class="form-select">
                            <option value="Available" ${tech.status == 'Available' ? 'selected' : ''}>Available</option>
                            <option value="Busy" ${tech.status == 'Busy' ? 'selected' : ''}>Busy</option>
                            <option value="Not_available" ${tech.status == 'Not_available' ? 'selected' : ''}>Not Available</option>
                        </select>
                    </div>
                    <div class="col-12">
                        <button type="submit" class="btn btn-pcms px-4">
                            <i class="fas fa-save me-2"></i>${empty tech ? 'Add Technician' : 'Update Technician'}
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </main>
</div>
<%@ include file="../common/scripts.jsp" %>
</body>
</html>
