<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>PCMS &mdash; Submit Report</title>
    <%@ include file="../common/head.jsp" %>
</head>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="layout">
    <%@ include file="../common/sidebar-tech.jsp" %>
    <main class="main-content">
        <div class="page-header">
            <h1 class="page-title">Submit <span>Report</span></h1>
            <a href="${pageContext.request.contextPath}/technician/equipment" class="btn btn-outline-secondary"><i class="fas fa-arrow-left me-2"></i>Back</a>
        </div>
        <div class="card-light p-4" style="max-width:550px">
            <form method="post" action="${pageContext.request.contextPath}/technician/equipment">
                <input type="hidden" name="action" value="report">
                <div class="row g-3">
                    <div class="col-md-6">
                        <label class="form-label">Device Category</label>
                        <select name="category" class="form-select">
                            <option value="PC">PC</option>
                            <option value="Accessories">Accessories</option>
                            <option value="NetworkDevices">Network Devices</option>
                        </select>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Device ID</label>
                        <input type="number" name="deviceId" class="form-control" required placeholder="e.g. 1">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Status</label>
                        <select name="status" class="form-select">
                            <option value="Working">Working</option>
                            <option value="Not_working">Not Working</option>
                            <option value="Damaged">Damaged</option>
                            <option value="Old">Old</option>
                        </select>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Location</label>
                        <select name="location" class="form-select">
                            <option value="Lab">Lab</option>
                            <option value="Office">Office</option>
                        </select>
                    </div>
                    <div class="col-12">
                        <label class="form-label">Notes</label>
                        <textarea name="notes" class="form-control" rows="4" placeholder="Describe the issue or repair done..."></textarea>
                    </div>
                    <div class="col-12">
                        <button type="submit" class="btn btn-pcms px-4">
                            <i class="fas fa-paper-plane me-2"></i>Submit Report
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
