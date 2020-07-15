<%-- 
    Document   : web
    Created on : Jun 16, 2020, 2:36:14 PM
    Author     : TASS
--%>


<%--<%@include  file="/common/taglib.jsp" %>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Trang chủ - #TASS</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/template/web/assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.0/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/template/web/assets/fonts/fontawesome5-overrides.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.2/dist/jquery.fancybox.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/template/web/assets/css/Basic-fancyBox-Gallery-v2.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/template/web/assets/css/Bold-BS4-Animated-Back-To-Top.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/template/web/assets/css/Growing-Search-Bar-Animated-Text-Input.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.1.1/aos.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/template/web/assets/css/custom-style-nvabar-menu.css">

        <!-- comment -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/template/web/assets/css/custom-style-comment.css">
        <!-- comment -->
        <!-- gallery -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/template/gallery/custom-gallery.css">
        <!-- gallery -->
        <script src="${pageContext.request.contextPath}/template/admin/assets/js/jquery.min.js"></script>

    </head>

    <body>
        <!--header-->
        <%@include file="/common/web/header.jsp" %>
        <!--header-->

        <!--<div class="container">-->
        <dec:body/>
        <!--</div>-->

        <!--footer-->
        <%@include file="/common/web/footer.jsp" %>
        <!--footer-->

        <!-- Bootstrap core JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/template/web/assets/js/bs-init.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.1.1/aos.js"></script>
        <script src="${pageContext.request.contextPath}/template/web/assets/js/Bold-BS4-Animated-Back-To-Top.js"></script>
        <script src="${pageContext.request.contextPath}/template/web/assets/js/clean-blog.js"></script>
        <script src="https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.2/dist/jquery.fancybox.min.js"></script>

    </body>

</html>