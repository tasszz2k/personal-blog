<%-- 
    Document   : moments
    Created on : Jul 10, 2020, 6:13:00 PM
    Author     : TASS
--%>
<%@include file="/common/taglib.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <header class="masthead" style="background-image: url(&quot;${pageContext.request.contextPath}/template/web/assets/img/pro-photography-equipment_1426-1771.jpg&quot;);">
            <div class="overlay"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-10 col-lg-8 mx-auto">
                        <div class="site-heading">
                            <h1 data-aos="fade-down">MOMENTS</h1><span data-aos="fade-up" class="subheading">Những bức ảnh ngẫu hứng</span></div>
                    </div>
                </div>
            </div>
        </header>

        <!--gallery-->
        <div class="container">
            <div class="row">
                <div class="col-md-10 col-lg-8 text-center mx-auto" data-aos="fade-down">
                    <h1 class="text-uppercase text-center">MY GALLERY</h1>
                    <p>Cùng dạo qua một vài bức ảnh cùng mình nhé ^^</p>
                </div>
            </div>
        </div>

        <div class="container">
            <!-- Grid row -->
            <div class="gallery" id="gallery">

                <c:forEach var="item" items="${photo.listResult}">
                    <!-- Grid column -->
                    <div class="mb-3 pics animation" data-aos="fade-down">
                        <a data-fancybox="gallery" data-caption="${item.shortDescription}" href="${item.image}">
                            <img class="img-fluid" src="${item.image}" alt="${item.title}">
                        </a>
                    </div>
                    <!-- Grid column -->
                </c:forEach>

            </div>
            <!-- Grid row -->
        </div>
        <!--gallery-->


        <hr>
    </body>
</html>
