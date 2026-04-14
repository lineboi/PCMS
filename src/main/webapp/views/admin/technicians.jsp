<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>PCMS &mdash; Technicians</title>
    <%@ include file="../common/head.jsp" %>
</head>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="layout">
    <%@ include file="../common/sidebar-admin.jsp" %>
    <main class="main-content">
        <div class="page-header">
            <h1 class="page-title"><span>Technicians</span></h1>
            <a href="${pageContext.request.contextPath}/admin/technicians?action=new" class="btn btn-pcms">
                <i class="fas fa-plus me-2"></i>Add Technician
            </a>
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
                        <th>#</th><th>Name</th><th>Email</th><th>Phone</th>
                        <th>Status</th><th>Joined</th><th class="text-center">Actions</th>
                    </tr></thead>
                    <tbody>
                    <c:forEach var="t" items="${technicians}" varStatus="vs">
                        <tr>
                            <td>${vs.count}</td>
                            <td>
                                <div class="d-flex align-items-center gap-2">
                                    <div style="width:36px;height:36px;background:var(--primary);border-radius:50%;display:flex;align-items:center;justify-content:center;font-weight:700;font-size:0.85rem">
                                        ${t.firstName.charAt(0)}${t.lastName.charAt(0)}
                                    </div>
                                    <div>
                                        <div class="fw-semibold">${t.fullName}</div>
                                    </div>
                                </div>
                            </td>
                            <td>${t.email}</td>
                            <td>${t.phone}</td>
                            <td>
                                <span class="badge-status
                                    <c:choose>
                                        <c:when test="${t.status == 'Available'}">bs-available</c:when>
                                        <c:when test="${t.status == 'Busy'}">bs-busy</c:when>
                                        <c:otherwise>bs-not_available</c:otherwise>
                                    </c:choose>">
                                    ${t.status}
                                </span>
                            </td>
                            <td class="text-muted small">${t.createdAt}</td>
                            <td class="text-center">
                                <a href="${pageContext.request.contextPath}/admin/technicians?action=edit&id=${t.id}" class="btn btn-sm btn-outline-warning me-1">
                                    <i class="fas fa-edit"></i>
                                </a>
                                <button class="btn btn-sm btn-outline-danger"
                                    onclick="confirmDelete('${pageContext.request.contextPath}/admin/technicians?action=delete&id=${t.id}', '${t.fullName}')">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty technicians}">
                        <tr><td colspan="7" class="text-center text-muted py-4">
                            <i class="fas fa-users-slash fa-2x mb-2 d-block"></i>No technicians registered yet.
                        </td></tr>
                    </c:if>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Delete Confirm Modal -->
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
