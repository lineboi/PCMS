<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>PCMS &mdash; ${empty pc ? 'Register' : 'Edit'} PC</title>
    <%@ include file="../common/head.jsp" %>
</head>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="layout">
    <%@ include file="../common/sidebar-admin.jsp" %>
    <main class="main-content">
        <div class="page-header">
            <h1 class="page-title"><span>${empty pc ? 'Register' : 'Edit'}</span> PC</h1>
            <a href="${pageContext.request.contextPath}/admin/pcs" class="btn btn-outline-secondary"><i class="fas fa-arrow-left me-2"></i>Back</a>
        </div>
        <div class="card-light p-4" style="max-width:650px">
            <form method="post" action="${pageContext.request.contextPath}/admin/pcs">
                <input type="hidden" name="action" value="${empty pc ? 'save' : 'update'}">
                <c:if test="${not empty pc}"><input type="hidden" name="id" value="${pc.id}"></c:if>
                <div class="row g-3">
                    <div class="col-md-6">
                        <label class="form-label">Brand</label>
                        <input type="text" name="brand" class="form-control" value="${pc.brand}" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Type</label>
                        <select name="pcType" class="form-select">
                            <option value="Desktop" ${pc.pcType == 'Desktop' ? 'selected':''}>Desktop</option>
                            <option value="Laptop" ${pc.pcType == 'Laptop' ? 'selected':''}>Laptop</option>
                        </select>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">HDD</label>
                        <input type="text" name="hdd" class="form-control" value="${pc.hdd}" placeholder="e.g. 500GB SSD">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">RAM</label>
                        <input type="text" name="ram" class="form-control" value="${pc.ram}" placeholder="e.g. 8GB DDR4">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Operating System</label>
                        <input type="text" name="os" class="form-control" value="${pc.os}" placeholder="e.g. Windows 11">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Registration Year</label>
                        <input type="number" name="registrationYear" class="form-control" value="${pc.registrationYear}" min="2000" max="2030">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Location</label>
                        <select name="location" class="form-select">
                            <option value="Lab" ${pc.location == 'Lab' ? 'selected':''}>Lab</option>
                            <option value="Office" ${pc.location == 'Office' ? 'selected':''}>Office</option>
                        </select>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Status</label>
                        <select name="status" class="form-select">
                            <option value="Working" ${pc.status == 'Working' ? 'selected':''}>Working</option>
                            <option value="Not_working" ${pc.status == 'Not_working' ? 'selected':''}>Not Working</option>
                            <option value="Damaged" ${pc.status == 'Damaged' ? 'selected':''}>Damaged</option>
                            <option value="Old" ${pc.status == 'Old' ? 'selected':''}>Old</option>
                        </select>
                    </div>
                    <div class="col-12">
                        <label class="form-label">Responsible Technician</label>
                        <select name="technicianId" class="form-select">
                            <option value="">-- Unassigned --</option>
                            <c:forEach var="t" items="${technicians}">
                                <option value="${t.id}" ${pc.technician != null && pc.technician.id == t.id ? 'selected':''}>${t.fullName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-12">
                        <button type="submit" class="btn btn-pcms px-4">
                            <i class="fas fa-save me-2"></i>${empty pc ? 'Register PC' : 'Update PC'}
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
