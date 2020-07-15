<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <div class="container-fluid d-flex flex-column p-0">
        <a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="#">
            <div class="sidebar-brand-icon rotate-n-15"><i class="fas fa-laugh-wink"></i></div>
            <div class="sidebar-brand-text mx-3"><span>~TASsZz2k~</span></div>
        </a>
        <hr class="sidebar-divider my-0">
        <ul class="nav navbar-nav text-light" id="accordionSidebar">
            <li class="nav-item" role="presentation"><a class="nav-link active" href="admin-home"><i class="fas fa-tachometer-alt"></i><span>Dashboard</span></a></li>
            <li class="nav-item" role="presentation"><a class="nav-link" href="profile?type=edit&userName=tass"><i class="fas fa-user"></i><span>Profile</span></a></li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" href="<c:url value="/admin-news?type=list&page=1&maxPageItem=5&sortBy=id&sortType=desc"/>">
                    <i class="fas fa-table"></i>
                    <span>Article Management</span>
                </a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" href="<c:url value="/admin-comment?type=list&page=1&maxPageItem=5&sortBy=id&sortType=desc"/>">
                    <i class="fas fa-comment-dots"></i>
                    <span>Comments Management</span>
                </a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" href="<c:url value="/admin-photo?type=list"/>">
                    <i class="fas fa-photo-video"></i>
                    <span>Photo Management</span>
                </a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" href="<c:url value="/admin-user?type=list&page=1&maxPageItem=5&sortBy=id&sortType=desc"/>">
                    <i class="far fa-user-circle"></i><span>Acount Management</span>
                </a></li>
            <li class="nav-item" role="presentation"><a class="nav-link" href="home-page"><i class="fas fa-home"></i><span>Back to Home page</span></a></li>
        </ul>
        <div class="text-center d-none d-md-inline"><button class="btn rounded-circle border-0" id="sidebarToggle" type="button"></button></div>
    </div>