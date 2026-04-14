<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>PCMS &mdash; PCs</title>
    <%@ include file="../common/head.jsp" %>
</head>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="layout">
    <%@ include file="../common/sidebar-admin.jsp" %>
    <main class="main-content">
        <div class="page-header">
            <h1 class="page-title"><span>PC</span> Inventory</h1>
            <a href="${pageContext.request.contextPath}/admin/pcs?action=new" class="btn btn-pcms">
                <i class="fas fa-plus me-2"></i>Register PC
            </a>
        </div>

        <c:if test="${not empty param.success}">
            <div class="alert alert-success alert-dismissible fade show alert-auto">
                <i class="fas fa-check-circle me-2"></i>${param.success}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        </c:if>

        <div class="filter-bar d-flex gap-3 flex-wrap">
            <a href="${pageContext.request.contextPath}/admin/pcs" class="btn btn-sm btn-outline-secondary">All</a>
            <a href="${pageContext.request.contextPath}/admin/pcs?location=Lab" class="btn btn-sm btn-outline-info">Lab</a>
            <a href="${pageContext.request.contextPath}/admin/pcs?location=Office" class="btn btn-sm btn-outline-primary">Office</a>
            <div class="vr"></div>
            <a href="${pageContext.request.contextPath}/admin/pcs?status=Working" class="btn btn-sm btn-outline-success">Working</a>
            <a href="${pageContext.request.contextPath}/admin/pcs?status=Not_working" class="btn btn-sm btn-outline-danger">Not Working</a>
            <a href="${pageContext.request.contextPath}/admin/pcs?status=Damaged" class="btn btn-sm btn-outline-warning">Damaged</a>
            <a href="${pageContext.request.contextPath}/admin/pcs?status=Old" class="btn btn-sm btn-outline-secondary">Old</a>
        </div>

        <div class="card-light">
            <div class="table-responsive">
                <table class="table table-custom table-hover mb-0">
                    <thead><tr>
                        <th>#</th><th>Brand</th><th>Type</th><th>Specs</th>
                        <th>Location</th><th>Status</th><th>Technician</th><th class="text-center">Actions</th>
                    </tr></thead>
                    <tbody>
                    <c:forEach var="pc" items="${pcs}" varStatus="vs">
                        <tr>
                            <td>${vs.count}</td>
                            <td class="fw-semibold">${pc.brand}</td>
                            <td>${pc.pcType}</td>
                            <td class="small text-muted">
                                <div>HDD: ${pc.hdd}</div>
                                <div>RAM: ${pc.ram} &bull; OS: ${pc.os}</div>
                                <div>Year: ${pc.registrationYear}</div>
                            </td>
                            <td><span class="badge bg-secondary">${pc.location}</span></td>
                            <td>
                                <span class="badge-status badge-${pc.status.toString().toLowerCase().replace(' ','_')}">
                                    ${pc.status.toString().replace('_',' ')}
                                </span>
                            </td>
                            <td>${pc.technician != null ? pc.technician.fullName : '<span class="text-muted">Unassigned</span>'}</td>
                            <td class="text-center">
                                <a href="${pageContext.request.contextPath}/admin/pcs?action=edit&id=${pc.id}" class="btn btn-sm btn-outline-warning me-1"><i class="fas fa-edit"></i></a>
                                <button class="btn btn-sm btn-outline-danger"
                                    onclick="confirmDelete('${pageContext.request.contextPath}/admin/pcs?action=delete&id=${pc.id}','PC #${vs.count}')">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty pcs}">
                        <tr><td colspan="8" class="text-center text-muted py-4">
                            <i class="fas fa-computer fa-2x mb-2 d-block"></i>No PCs found.
                        </td></tr>
                    </c:if>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="modal fade" id="deleteModal" tabindex="-1">
            <div class="modal-dialog modal-sm modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h6 class="modal-title"><i class="fas fa-exclamation-triangle text-danger me-2"></i>Confirm Delete</h6>
                    </div>
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
