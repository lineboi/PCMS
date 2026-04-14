<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>PCMS &mdash; Accessories</title>
    <%@ include file="../common/head.jsp" %>
</head>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="layout">
    <%@ include file="../common/sidebar-admin.jsp" %>
    <main class="main-content">
        <div class="page-header">
            <h1 class="page-title"><span>Accessories</span> Inventory</h1>
            <a href="${pageContext.request.contextPath}/admin/accessories?action=new" class="btn btn-pcms">
                <i class="fas fa-plus me-2"></i>Add Accessory
            </a>
        </div>

        <c:if test="${not empty param.success}">
            <div class="alert alert-success alert-dismissible fade show alert-auto">
                <i class="fas fa-check-circle me-2"></i>${param.success}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        </c:if>

        <div class="filter-bar d-flex gap-3 flex-wrap">
            <a href="${pageContext.request.contextPath}/admin/accessories" class="btn btn-sm btn-outline-secondary">All</a>
            <a href="${pageContext.request.contextPath}/admin/accessories?location=Lab" class="btn btn-sm btn-outline-info">Lab</a>
            <a href="${pageContext.request.contextPath}/admin/accessories?location=Office" class="btn btn-sm btn-outline-primary">Office</a>
            <div class="vr"></div>
            <a href="${pageContext.request.contextPath}/admin/accessories?status=Working" class="btn btn-sm btn-outline-success">Working</a>
            <a href="${pageContext.request.contextPath}/admin/accessories?status=Not_working" class="btn btn-sm btn-outline-danger">Not Working</a>
            <a href="${pageContext.request.contextPath}/admin/accessories?status=Damaged" class="btn btn-sm btn-outline-warning">Damaged</a>
            <a href="${pageContext.request.contextPath}/admin/accessories?status=Old" class="btn btn-sm btn-outline-secondary">Old</a>
        </div>

        <div class="card-light">
            <div class="table-responsive">
                <table class="table table-custom table-hover mb-0">
                    <thead><tr>
                        <th>#</th><th>Type</th><th>Brand</th><th>Location</th>
                        <th>Status</th><th>Technician</th><th class="text-center">Actions</th>
                    </tr></thead>
                    <tbody>
                    <c:forEach var="a" items="${accessories}" varStatus="vs">
                        <tr>
                            <td>${vs.count}</td>
                            <td><i class="fas fa-${a.accessoryType == 'Monitor' ? 'desktop' : a.accessoryType == 'Keyboard' ? 'keyboard' : a.accessoryType == 'Mouse' ? 'computer-mouse' : 'video'} me-1"></i>${a.accessoryType}</td>
                            <td>${a.brand}</td>
                            <td><span class="badge bg-secondary">${a.location}</span></td>
                            <td>
                                <span class="badge-status badge-${a.status.toString().toLowerCase()}">
                                    ${a.status.toString().replace('_',' ')}
                                </span>
                            </td>
                            <td>${a.technician != null ? a.technician.fullName : '<span class="text-muted">Unassigned</span>'}</td>
                            <td class="text-center">
                                <a href="${pageContext.request.contextPath}/admin/accessories?action=edit&id=${a.id}" class="btn btn-sm btn-outline-warning me-1"><i class="fas fa-edit"></i></a>
                                <button class="btn btn-sm btn-outline-danger"
                                    onclick="confirmDelete('${pageContext.request.contextPath}/admin/accessories?action=delete&id=${a.id}','${a.accessoryType}')">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty accessories}">
                        <tr><td colspan="7" class="text-center text-muted py-4">
                            <i class="fas fa-keyboard fa-2x mb-2 d-block"></i>No accessories found.
                        </td></tr>
                    </c:if>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="modal fade" id="deleteModal" tabindex="-1">
            <div class="modal-dialog modal-sm modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header"><h6 class="modal-title text-danger"><i class="fas fa-exclamation-triangle me-2"></i>Confirm Delete</h6></div>
                    <div class="modal-body">Delete <strong id="deleteName"></strong>?</div>
                    <div class="modal-footer">
                        <button class="btn btn-sm btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <a id="deleteConfirmBtn" href="#" class="btn btn-sm btn-danger">Delete</a>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>
<%@ include file="../common/scripts.jsp" %>
<script>
function confirmDelete(url, name) {
    document.getElementById('deleteName').textContent = name;
    document.getElementById('deleteConfirmBtn').href = url;
    new bootstrap.Modal(document.getElementById('deleteModal')).show();
}
</script>
</body>
</html>
