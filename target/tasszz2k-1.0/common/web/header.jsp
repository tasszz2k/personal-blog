<%@include  file="/common/taglib.jsp" %>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <!-- Navigation -->
        <nav class="navbar navbar-light navbar-expand-lg fixed-top" id="mainNav">
            <div class="container">
                <a href="home-page">
                    <img data-bs-hover-animate="swing" src="${pageContext.request.contextPath}/template/web/assets/img/Logo_TASS.png" style="width: 82px;">
                </a>
                <button data-toggle="collapse" data-target="#navbarResponsive" class="navbar-toggler" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><i class="fa fa-bars"></i></button>

                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="nav navbar-nav ml-auto">
                        <li class="nav-item" role="presentation"><a class="nav-link" href="${pageContext.request.contextPath}/home-page">HOME</a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="${pageContext.request.contextPath}/about">ABOUT ME</a></li>
                        <!-- <li class="nav-item" role="presentation"><a class="nav-link" href="post.html">Blog Post</a></li> -->
                        <li class="nav-item dropdown" role="presentation">
                            <a class="nav-link dropdown-toggle" href="${pageContext.request.contextPath}/blog-post?type=list" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> BLOG POST </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                <c:forEach var="item" items="${categories}">
                                    <c:if test="${not fn:startsWith(item.code, 'tho-')}">
                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/blog-post?type=list&categoryCode=${item.code}">${item.name}</a></li>
                                    </c:if>
                                </c:forEach>

                                <li class="dropdown-submenu">
                                    <a class="dropdown-item dropdown-toggle" href="">THƠ</a>
                                    <ul class="dropdown-menu" style="top: 10px;" >
                                        <c:forEach var="item" items="${categories}">
                                            <c:if test="${fn:startsWith(item.code, 'tho-')}">
                                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/blog-post?type=list&categoryCode=${item.code}">${item.name}</a></li>
                                            </c:if>
                                        </c:forEach>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="${pageContext.request.contextPath}/moments">MOMENTS<br></a>
                        </li>
                        <c:if test="${empty USERMODEL}">
                            <li class="nav-item" role="presentation"><a class="nav-link" href='<c:url value="/login?action=login"/>'>LOGIN</a></li>

                        </c:if>
                        <c:if test="${not empty USERMODEL}">
                            <li class="nav-item dropdown" role="presentation">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Welcome, ${USERMODEL.fullName} </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                    <li><a class="dropdown-item" href='<c:url value="/profile?type=edit&userName=${currentUser.userName}"/>'>Profile</a></li>
                                    <li><a class="dropdown-item" href='<c:url value="/logout?action=logout"/>'>LOGOUT</a></li>
                                </ul>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </nav>