<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>PCMS &mdash; ${empty device ? 'Add' : 'Edit'} Network Device</title>
    <%@ include file="../common/head.jsp" %>
</head>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="layout">
    <%@ include file="../common/sidebar-admin.jsp" %>
    <main class="main-content">
        <div class="page-header">
            <h1 class="page-title"><span>${empty device ? 'Add' : 'Edit'}</span> Network Device</h1>
            <a href="${pageContext.request.contextPath}/admin/network-devices" class="btn btn-outline-secondary"><i class="fas fa-arrow-left me-2"></i>Back</a>
        </div>
        <div class="card-light p-4" style="max-width:550px">
            <form method="post" action="${pageContext.request.contextPath}/admin/network-devices">
                <input type="hidden" name="action" value="${empty device ? 'save' : 'update'}">
                <c:if test="${not empty device}"><input type="hidden" name="id" value="${device.id}"></c:if>
                <div class="row g-3">
                    <div class="col-md-6">
                        <label class="form-label">Device Type</label>
                        <select name="deviceType" class="form-select">
                            <option value="Access_Point" ${device.deviceType == 'Access_Point' ? 'selected':''}>Access Point</option>
                            <option value="Switch" ${device.deviceType == 'Switch' ? 'selected':''}>Switch</option>
                            <option value="Router" ${device.deviceType == 'Router' ? 'selected':''}>Router</option>
                        </select>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Brand</label>
                        <input type="text" name="brand" class="form-control" value="${device.brand}">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Location</label>
                        <select name="location" class="form-select">
                            <option value="Lab" ${device.location == 'Lab' ? 'selected':''}>Lab</option>
                            <option value="Office" ${device.location == 'Office' ? 'selected':''}>Office</option>
                        </select>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Status</label>
                        <select name="status" class="form-select">
                            <option value="Working" ${device.status == 'Working' ? 'selected':''}>Working</option>
                            <option value="Not_working" ${device.status == 'Not_working' ? 'selected':''}>Not Working</option>
                            <option value="Damaged" ${device.status == 'Damaged' ? 'selected':''}>Damaged</option>
                            <option value="Old" ${device.status == 'Old' ? 'selected':''}>Old</option>
                        </select>
                    </div>
                    <div class="col-12">
                        <label class="form-label">Responsible Technician</label>
                        <select name="technicianId" class="form-select">
                            <option value="">-- Unassigned --</option>
                            <c:forEach var="t" items="${technicians}">
                                <option value="${t.id}" ${device.technician != null && device.technician.id == t.id ? 'selected':''}>${t.fullName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-12">
                        <button type="submit" class="btn btn-pcms px-4">
                            <i class="fas fa-save me-2"></i>${empty device ? 'Add Device' : 'Update Device'}
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
