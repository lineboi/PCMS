<%@ page contentType="text/html;charset=UTF-8" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
<script>
    // Mark active nav link
    document.querySelectorAll('.nav-link-item').forEach(link => {
        if (link.href === window.location.href || window.location.pathname.startsWith(new URL(link.href).pathname)) {
            link.classList.add('active');
        }
    });
    // Auto-dismiss alerts
    setTimeout(() => {
        document.querySelectorAll('.alert-auto').forEach(el => {
            let bsAlert = new bootstrap.Alert(el);
            bsAlert.close();
        });
    }, 4000);
</script>
