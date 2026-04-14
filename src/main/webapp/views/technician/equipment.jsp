<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>PCMS &mdash; My Equipment</title>
    <%@ include file="../common/head.jsp" %>
</head>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="layout">
    <%@ include file="../common/sidebar-tech.jsp" %>
    <main class="main-content">
        <div class="page-header">
            <h1 class="page-title">My <span>Equipment</span></h1>
            <a href="${pageContext.request.contextPath}/technician/equipment?action=report" class="btn btn-pcms">
                <i class="fas fa-plus me-2"></i>Submit Report
            </a>
        </div>

        <c:if test="${not empty param.success}">
            <div class="alert alert-success alert-dismissible fade show alert-auto">
                <i class="fas fa-check-circle me-2"></i>${param.success}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        </c:if>

        <!-- PCs -->
        <h5 class="mb-3"><i class="fas fa-computer me-2" style="color:var(--primary)"></i>PCs</h5>
        <div class="card-dark mb-4">
            <div class="table-responsive">
                <table class="table table-custom table-hover mb-0">
                    <thead><tr><th>#</th><th>Brand</th><th>Type</th><th>Specs</th><th>Location</th><th>Status</th><th class="text-center">Update Status</th></tr></thead>
                    <tbody>
                    <c:forEach var="pc" items="${pcs}" varStatus="vs">
                        <tr>
                            <td>${vs.count}</td>
                            <td class="fw-semibold">${pc.brand}</td>
                            <td>${pc.pcType}</td>
                            <td class="small text-muted">${pc.ram} RAM &bull; ${pc.hdd} &bull; ${pc.os}</td>
                            <td><span class="badge bg-secondary">${pc.location}</span></td>
                            <td><span class="badge-status badge-${pc.status.toString().toLowerCase()}">${pc.status.toString().replace('_',' ')}</span></td>
                            <td class="text-center">
                                <form method="post" action="${pageContext.request.contextPath}/technician/equipment" class="d-flex justify-content-center gap-1">
                                    <input type="hidden" name="action" value="updateStatus">
                                    <input type="hidden" name="category" value="PC">
                                    <input type="hidden" name="deviceId" value="${pc.id}">
                                    <select name="status" class="form-select form-select-sm w-auto" style="font-size:0.75rem">
                                        <option value="Working">Working</option>
                                        <option value="Not_working">Not Working</option>
                                        <option value="Damaged">Damaged</option>
                                        <option value="Old">Old</option>
                                    </select>
                                    <button type="submit" class="btn btn-sm btn-pcms"><i class="fas fa-check"></i></button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty pcs}"><tr><td colspan="7" class="text-center text-muted py-3">No PCs assigned.</td></tr></c:if>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Accessories -->
        <h5 class="mb-3"><i class="fas fa-keyboard me-2" style="color:var(--primary)"></i>Accessories</h5>
        <div class="card-dark mb-4">
            <div class="table-responsive">
                <table class="table table-custom table-hover mb-0">
                    <thead><tr><th>#</th><th>Type</th><th>Brand</th><th>Location</th><th>Status</th><th class="text-center">Update Status</th></tr></thead>
                    <tbody>
                    <c:forEach var="a" items="${accessories}" varStatus="vs">
                        <tr>
                            <td>${vs.count}</td>
                            <td>${a.accessoryType}</td>
                            <td>${a.brand}</td>
                            <td><span class="badge bg-secondary">${a.location}</span></td>
                            <td><span class="badge-status badge-${a.status.toString().toLowerCase()}">${a.status.toString().replace('_',' ')}</span></td>
                            <td class="text-center">
                                <form method="post" action="${pageContext.request.contextPath}/technician/equipment" class="d-flex justify-content-center gap-1">
                                    <input type="hidden" name="action" value="updateStatus">
                                    <input type="hidden" name="category" value="Accessories">
                                    <input type="hidden" name="deviceId" value="${a.id}">
                                    <select name="status" class="form-select form-select-sm w-auto" style="font-size:0.75rem">
                                        <option value="Working">Working</option>
                                        <option value="Not_working">Not Working</option>
                                        <option value="Damaged">Damaged</option>
                                        <option value="Old">Old</option>
                                    </select>
                                    <button type="submit" class="btn btn-sm btn-pcms"><i class="fas fa-check"></i></button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty accessories}"><tr><td colspan="6" class="text-center text-muted py-3">No accessories assigned.</td></tr></c:if>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Network Devices -->
        <h5 class="mb-3"><i class="fas fa-network-wired me-2" style="color:var(--primary)"></i>Network Devices</h5>
        <div class="card-light">
            <div class="table-responsive">
                <table class="table table-custom table-hover mb-0">
                    <thead><tr><th>#</th><th>Type</th><th>Brand</th><th>Location</th><th>Status</th><th class="text-center">Update Status</th></tr></thead>
                    <tbody>
                    <c:forEach var="nd" items="${networkDevices}" varStatus="vs">
                        <tr>
                            <td>${vs.count}</td>
                            <td>${nd.deviceType.toString().replace('_',' ')}</td>
                            <td>${nd.brand}</td>
                            <td><span class="badge bg-secondary">${nd.location}</span></td>
                            <td><span class="badge-status badge-${nd.status.toString().toLowerCase()}">${nd.status.toString().replace('_',' ')}</span></td>
                            <td class="text-center">
                                <form method="post" action="${pageContext.request.contextPath}/technician/equipment" class="d-flex justify-content-center gap-1">
                                    <input type="hidden" name="action" value="updateStatus">
                                    <input type="hidden" name="category" value="NetworkDevices">
                                    <input type="hidden" name="deviceId" value="${nd.id}">
                                    <select name="status" class="form-select form-select-sm w-auto" style="font-size:0.75rem">
                                        <option value="Working">Working</option>
                                        <option value="Not_working">Not Working</option>
                                        <option value="Damaged">Damaged</option>
                                        <option value="Old">Old</option>
                                    </select>
                                    <button type="submit" class="btn btn-sm btn-pcms"><i class="fas fa-check"></i></button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty networkDevices}"><tr><td colspan="6" class="text-center text-muted py-3">No network devices assigned.</td></tr></c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </main>
</div>
<%@ include file="../common/scripts.jsp" %>
</body>
</html>
