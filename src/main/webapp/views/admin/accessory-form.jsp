<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>PCMS &mdash; ${empty accessory ? 'Add' : 'Edit'} Accessory</title>
    <%@ include file="../common/head.jsp" %>
</head>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="layout">
    <%@ include file="../common/sidebar-admin.jsp" %>
    <main class="main-content">
        <div class="page-header">
            <h1 class="page-title"><span>${empty accessory ? 'Add' : 'Edit'}</span> Accessory</h1>
            <a href="${pageContext.request.contextPath}/admin/accessories" class="btn btn-outline-secondary"><i class="fas fa-arrow-left me-2"></i>Back</a>
        </div>
        <div class="card-light p-4" style="max-width:550px">
            <form method="post" action="${pageContext.request.contextPath}/admin/accessories">
                <input type="hidden" name="action" value="${empty accessory ? 'save' : 'update'}">
                <c:if test="${not empty accessory}"><input type="hidden" name="id" value="${accessory.id}"></c:if>
                <div class="row g-3">
                    <div class="col-md-6">
                        <label class="form-label">Accessory Type</label>
                        <select name="accessoryType" class="form-select">
                            <option value="Mouse" ${accessory.accessoryType == 'Mouse' ? 'selected':''}>Mouse</option>
                            <option value="Keyboard" ${accessory.accessoryType == 'Keyboard' ? 'selected':''}>Keyboard</option>
                            <option value="Monitor" ${accessory.accessoryType == 'Monitor' ? 'selected':''}>Monitor</option>
                            <option value="Projector" ${accessory.accessoryType == 'Projector' ? 'selected':''}>Projector</option>
                        </select>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Brand</label>
                        <input type="text" name="brand" class="form-control" value="${accessory.brand}">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Location</label>
                        <select name="location" class="form-select">
                            <option value="Lab" ${accessory.location == 'Lab' ? 'selected':''}>Lab</option>
                            <option value="Office" ${accessory.location == 'Office' ? 'selected':''}>Office</option>
                        </select>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Status</label>
                        <select name="status" class="form-select">
                            <option value="Working" ${accessory.status == 'Working' ? 'selected':''}>Working</option>
                            <option value="Not_working" ${accessory.status == 'Not_working' ? 'selected':''}>Not Working</option>
                            <option value="Damaged" ${accessory.status == 'Damaged' ? 'selected':''}>Damaged</option>
                            <option value="Old" ${accessory.status == 'Old' ? 'selected':''}>Old</option>
                        </select>
                    </div>
                    <div class="col-12">
                        <label class="form-label">Responsible Technician</label>
                        <select name="technicianId" class="form-select">
                            <option value="">-- Unassigned --</option>
                            <c:forEach var="t" items="${technicians}">
                                <option value="${t.id}" ${accessory.technician != null && accessory.technician.id == t.id ? 'selected':''}>${t.fullName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-12">
                        <button type="submit" class="btn btn-pcms px-4">
                            <i class="fas fa-save me-2"></i>${empty accessory ? 'Add Accessory' : 'Update Accessory'}
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
