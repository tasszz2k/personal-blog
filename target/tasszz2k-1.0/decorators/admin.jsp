<%-- 
    Document   : admin
    Created on : Jun 16, 2020, 2:36:07 PM
    Author     : TASS
--%>

<%@include  file="/common/taglib.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Admin Page</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/template/admin/assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/template/admin/assets/fonts/fontawesome-all.min.css">

        <script src="${pageContext.request.contextPath}/template/admin/assets/js/jquery.min.js"></script>

        <!--Paging-->
        <script src="${pageContext.request.contextPath}/template/paging/jquery.twbsPagination.js"></script>
        <!--<script src="${pageContext.request.contextPath}/template/paging/jquery.twbsPagination.min.js"></script>-->
        <!--Paging-->
        <!-- gallery -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/template/gallery/custom-gallery.css">
        <!-- gallery -->
        <!--ckediter-->
        <script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
        <!--ckediter-->
    </head>
    <body id="page-top">

        <div id="wrapper">
            <nav class="navbar navbar-dark align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0">
                <!--menu-->
                <%@include file="/common/admin/menu.jsp" %>
                <!--menu-->
            </nav>
            <div class="d-flex flex-column" id="content-wrapper">
                <div id="contentX">
                    <nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
                        <!--header-->
                        <%@include file="/common/admin/header.jsp" %>
                        <!--header-->
                    </nav>
                    <div class="container-fluid">
                        <dec:body/>
                    </div>
                </div>
                <footer class="bg-white sticky-footer">
                    <!--footer-->
                    <%@include file="/common/admin/footer.jsp" %>
                    <!--footer-->
                </footer>
            </div>
            <a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
        </div>



        <script src="${pageContext.request.contextPath}/template/admin/assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/template/admin/assets/js/chart.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
        <script src="${pageContext.request.contextPath}/template/admin/assets/js/script.min.js"></script>

    </body>
</html>
