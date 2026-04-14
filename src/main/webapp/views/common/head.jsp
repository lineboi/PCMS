<%@ page contentType="text/html;charset=UTF-8" %>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<style>
    :root {
        --primary:       #2563eb;
        --primary-light: #eff6ff;
        --primary-dark:  #1d4ed8;
        --accent:        #0ea5e9;
        --success:       #16a34a;
        --warning:       #d97706;
        --danger:        #dc2626;
        --sidebar-bg:    #1e3a5f;
        --sidebar-hover: #2563eb;
        --body-bg:       #f0f4f8;
        --card-bg:       #ffffff;
        --border:        #e2e8f0;
        --text-main:     #1e293b;
        --text-muted:    #64748b;
        --text-light:    #94a3b8;
    }
    * { box-sizing: border-box; }
    body {
        background: var(--body-bg);
        color: var(--text-main);
        font-family: 'Segoe UI', system-ui, sans-serif;
        margin: 0;
    }

    /* ── Navbar ── */
    .pcms-navbar {
        background: var(--sidebar-bg);
        border-bottom: 1px solid rgba(255,255,255,0.08);
        position: sticky; top: 0; z-index: 1030;
        height: 60px;
        box-shadow: 0 2px 8px rgba(30,58,95,0.18);
    }
    .pcms-navbar .navbar-brand { color: #fff; font-weight: 700; font-size: 1.15rem; letter-spacing: .5px; }
    .pcms-navbar .nav-link { color: rgba(255,255,255,0.85) !important; }

    /* ── Layout ── */
    .layout { display: flex; min-height: calc(100vh - 60px); }

    /* ── Sidebar ── */
    .sidebar {
        width: 240px;
        background: var(--sidebar-bg);
        flex-shrink: 0;
        padding: 1.25rem 0;
        position: sticky; top: 60px;
        height: calc(100vh - 60px);
        overflow-y: auto;
    }
    .sidebar-brand {
        color: #93c5fd;
        font-weight: 700; font-size: 0.9rem;
        padding: 0 1.25rem 1.25rem;
        letter-spacing: .5px;
        text-transform: uppercase;
    }
    .nav-section {
        font-size: 0.68rem; font-weight: 700;
        letter-spacing: 1.5px; text-transform: uppercase;
        color: rgba(255,255,255,0.35);
        padding: 0.8rem 1.25rem 0.2rem;
    }
    .nav-link-item {
        display: flex; align-items: center; gap: 0.75rem;
        padding: 0.6rem 1.25rem;
        color: rgba(255,255,255,0.7);
        text-decoration: none; font-size: 0.88rem;
        border-left: 3px solid transparent;
        transition: all 0.18s;
    }
    .nav-link-item:hover, .nav-link-item.active {
        background: rgba(37,99,235,0.3);
        color: #fff;
        border-left-color: #60a5fa;
    }
    .nav-link-item i { width: 18px; text-align: center; font-size: 0.9rem; }

    /* ── Main content ── */
    .main-content { flex: 1; padding: 2rem; overflow-x: hidden; }

    /* ── Page header ── */
    .page-header {
        display: flex; align-items: center; justify-content: space-between;
        margin-bottom: 1.75rem;
    }
    .page-title { font-size: 1.55rem; font-weight: 700; color: var(--text-main); margin: 0; }
    .page-title span { color: var(--primary); }

    /* ── Stat cards ── */
    .stat-card {
        background: var(--card-bg);
        border: 1px solid var(--border);
        border-radius: 14px;
        padding: 1.4rem 1.5rem;
        transition: box-shadow 0.2s, transform 0.2s;
        box-shadow: 0 1px 4px rgba(0,0,0,0.06);
    }
    .stat-card:hover { transform: translateY(-3px); box-shadow: 0 6px 20px rgba(37,99,235,0.12); }
    .stat-icon {
        width: 52px; height: 52px; border-radius: 12px;
        display: flex; align-items: center; justify-content: center;
        font-size: 1.35rem;
    }
    .stat-value { font-size: 2rem; font-weight: 800; color: var(--text-main); line-height: 1; }
    .stat-label { color: var(--text-muted); font-size: 0.82rem; margin-top: 2px; }

    /* ── Cards ── */
    .card-light {
        background: var(--card-bg);
        border: 1px solid var(--border);
        border-radius: 14px;
        box-shadow: 0 1px 4px rgba(0,0,0,0.06);
    }

    /* ── Tables ── */
    .table-custom { --bs-table-bg: transparent; color: var(--text-main); }
    .table-custom thead th {
        font-size: 0.75rem; font-weight: 700; text-transform: uppercase;
        letter-spacing: 0.7px; color: var(--text-muted);
        border-bottom: 2px solid var(--border) !important;
        padding: 0.75rem 1rem; background: #f8fafc;
    }
    .table-custom tbody td { padding: 0.85rem 1rem; vertical-align: middle; border-bottom: 1px solid var(--border); color: var(--text-main); }
    .table-custom tbody tr:hover { background: #f1f5fd; }
    .table-custom tbody tr:last-child td { border-bottom: none; }

    /* ── Forms ── */
    .form-control, .form-select {
        background: #fff;
        border: 1.5px solid var(--border);
        color: var(--text-main);
        border-radius: 8px;
        padding: 0.55rem 0.85rem;
        font-size: 0.9rem;
    }
    .form-control:focus, .form-select:focus {
        border-color: var(--primary);
        box-shadow: 0 0 0 3px rgba(37,99,235,0.12);
        color: var(--text-main);
    }
    .form-label { color: var(--text-main); font-weight: 600; font-size: 0.85rem; margin-bottom: 0.35rem; }

    /* ── Buttons ── */
    .btn-pcms {
        background: var(--primary);
        color: #fff; border: none;
        border-radius: 8px; font-weight: 600; font-size: 0.88rem;
        padding: 0.5rem 1.1rem;
        transition: all 0.18s;
    }
    .btn-pcms:hover { background: var(--primary-dark); color: #fff; box-shadow: 0 4px 14px rgba(37,99,235,0.3); transform: translateY(-1px); }

    /* ── Status badges ── */
    .badge-status {
        padding: 0.3em 0.75em; border-radius: 20px;
        font-size: 0.75rem; font-weight: 600; letter-spacing: 0.2px;
        display: inline-block;
    }
    .bs-working    { background: #dcfce7; color: #15803d; }
    .bs-not_working{ background: #fee2e2; color: #b91c1c; }
    .bs-damaged    { background: #fef9c3; color: #a16207; }
    .bs-old        { background: #f1f5f9; color: #475569; }
    .bs-available  { background: #dcfce7; color: #15803d; }
    .bs-busy       { background: #fef9c3; color: #a16207; }
    .bs-not_available { background: #f1f5f9; color: #475569; }
    .bs-pending    { background: #dbeafe; color: #1d4ed8; }
    .bs-technician_assigned { background: #ede9fe; color: #6d28d9; }
    .bs-fixed      { background: #dcfce7; color: #15803d; }
    .bs-not_fixed  { background: #fee2e2; color: #b91c1c; }
    .bs-admin      { background: #fee2e2; color: #b91c1c; }
    .bs-technician { background: #dbeafe; color: #1d4ed8; }

    /* ── Filter bar ── */
    .filter-bar {
        background: var(--card-bg);
        border: 1px solid var(--border);
        border-radius: 12px;
        padding: 0.85rem 1.25rem;
        margin-bottom: 1.25rem;
        display: flex; align-items: center; gap: 0.5rem; flex-wrap: wrap;
        box-shadow: 0 1px 3px rgba(0,0,0,0.04);
    }
    .filter-bar .btn { font-size: 0.8rem; border-radius: 20px; font-weight: 600; }

    /* ── Alerts ── */
    .alert { border-radius: 10px; font-size: 0.9rem; }
    .alert-success { background: #f0fdf4; border: 1px solid #bbf7d0; color: #15803d; }
    .alert-danger  { background: #fff1f2; border: 1px solid #fecdd3; color: #b91c1c; }

    /* ── Modal ── */
    .modal-content { border-radius: 14px; border: 1px solid var(--border); color: var(--text-main); }
    .modal-header { border-bottom: 1px solid var(--border); padding: 1rem 1.25rem; }
    .modal-footer { border-top: 1px solid var(--border); padding: 0.75rem 1.25rem; }

    /* ── Section headers inside pages ── */
    .section-header {
        font-size: 1rem; font-weight: 700; color: var(--text-main);
        margin-bottom: 1rem;
        display: flex; align-items: center; gap: 0.5rem;
    }
    .section-header i { color: var(--primary); }

    /* ── Divider ── */
    .card-divider { border-bottom: 1px solid var(--border); padding: 0.85rem 1.25rem; }

    @media (max-width: 768px) {
        .sidebar { display: none; }
        .main-content { padding: 1rem; }
    }
</style>
