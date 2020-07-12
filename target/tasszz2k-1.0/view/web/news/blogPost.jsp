<%-- 
    Document   : blogPost
    Created on : Jul 10, 2020, 6:08:10 PM
    Author     : TASS
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <body>

        <style>
            p {
                margin: 0px !important;
            }
        </style>
        <header class="masthead" style="background-image: url(&quot;${pageContext.request.contextPath}/template/web/assets/img/home-bg.jpg&quot;);">
            <div class="overlay"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-10 col-lg-8 mx-auto">
                        <div class="site-heading">
                            <h1 data-aos="fade-down">BLOG POST</h1><span data-aos="fade-up" class="subheading">Tớ viết linh
                                tinh ở đây nè ^^</span>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <div class="container">
            <div class="row">
                <div class="col-md-10 col-lg-12 offset-lg-0">
                    <div class="post-preview">

                        <h2 class="text-uppercase text-center text-danger post-title" data-bs-hover-animate="bounce" style="font-size: 40px;">bài viết nổi bật!&nbsp;<br>⬇<br></h2>
                        <h3 class="text-uppercase text-center text-danger post-subtitle" data-aos="zoom-in">====================</h3>

                        <div class="d-flex justify-content-center h-100" style="margin-top: 5px;width: 320px;margin-right: auto;margin-left: auto;">
                            <div class="text-left searchbar" data-bs-hover-animate="pulse" style="width: 358px;"><input type="text" class="search_input" style="width: 190px;font-family: 'Open Sans', sans-serif;padding: 0;margin-left: 0px;padding-left: 10px;" autocomplete="on" placeholder="Search..."><a class="search_icon" href="#"><i
                                        class="fas fa-search"></i></a></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-10 col-lg-8">
                    <c:forEach var="item" items="${model.listResult}">
                        <div class="post-preview" data-aos="zoom-in">
                            <c:url var="viewURL" value="/post">
                                <c:param name="type" value="view"/>
                                <c:param name="id" value="${item.id}"/>
                            </c:url>
                            <a href="${viewURL}">
                                <h2 class="post-title">${item.title}</h2>
                                <h3 class="post-subtitle">${item.shortDescription}</h3>
                            </a>
                            <p class="post-meta" style="margin: 0px;"> Thể loại&nbsp; <a href="#">${item.categoryName}</a></p>
                            <p class="post-meta">Đăng bởi&nbsp; <a href="" > <nobr class="text-uppercase">${item.createdBy}</nobr>
                                    <nobr></a>&nbsp;ngày <fmt:formatDate pattern = "dd/MM/yyyy" value = "${item.createdDate}" /></nobr>           
                            </p>
                        </div>
                        <hr>
                    </c:forEach>

                    <hr>
                    <div class="clearfix">
                        <button class="btn btn-primary float-right" type="button" onclick="viewMore()">Older
                            Posts&nbsp;⇒</button>
                    </div>

                    <hr>
                    <hr>
                </div>

                <form action="<c:url value='/blog-post'/>" id="formSubmit" method="get">
                    <input type="hidden" value="" id="page" name="page" />
                    <input type="hidden" value="" id="maxPageItem" name="maxPageItem" />
                    <input type="hidden" value="" id="sortBy" name="sortBy" />
                    <input type="hidden" value="" id="sortType" name="sortType" />
                    <input type="hidden" value="list" id="type" name="type" />
                </form>            
            </div>
        </div>


        <script type="text/javascript">
            function viewMore() {
                var totalPages = ${model.totalPages}; //50
                var currentPage = ${model.page}; //1
                var limit = 5; //; 
                if (currentPage < totalPages) {
                    //console.info(page + " (from options)");
                    $("#maxPageItem").val(limit);
                    $("#page").val(currentPage + 1);
                    $("#sortBy").val('id');
                    $("#sortType").val('desc');
                    $("#type").val('list');
                    $("#formSubmit").submit();
                }
            }

        </script>  
    </body>

</html>