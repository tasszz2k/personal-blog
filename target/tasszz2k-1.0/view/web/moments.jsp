<%-- 
    Document   : moments
    Created on : Jul 10, 2020, 6:13:00 PM
    Author     : TASS
--%>

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
        <div class="container">
            <div class="row">
                <div class="col-md-10 col-lg-8 text-center mx-auto">
                    <h1 class="text-uppercase text-center">MY GALLERY</h1>
                    <p>Short descripttion</p>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row fbox3">
                <div class="col-sm-4 d-flex justify-content-center align-items-center"><a data-fancybox="gallery" data-caption="Hero Image Nature" href="${pageContext.request.contextPath}/template/web/assets/img/hero-background-nature.jpg"><img class="img-fluid" src="${pageContext.request.contextPath}/template/web/assets/img/hero-background-nature.jpg" alt="Hero Image Nature"></a></div>
                <div class="col-sm-4 d-flex justify-content-center align-items-center"><a data-fancybox="gallery" data-caption="Hero Image Technology" href="${pageContext.request.contextPath}/template/web/assets/img/hero-background-technology.jpg"><img class="img-fluid" src="${pageContext.request.contextPath}/template/web/assets/img/hero-background-technology.jpg" alt="Hero Image Technology"></a></div>
                <div class="col-sm-4 d-flex justify-content-center align-items-center"><a data-fancybox="gallery" data-caption="Hero Image Travel" href="${pageContext.request.contextPath}/template/web/assets/img/hero-background-travel.jpg"><img class="img-fluid" src="${pageContext.request.contextPath}/template/web/assets/img/hero-background-travel.jpg" alt="Hero Image Travel"></a></div>
                <div class="col-sm-4 d-flex justify-content-center align-items-center"><a data-fancybox="gallery" data-caption="Hero Image Food" href="${pageContext.request.contextPath}/template/web/assets/img/hero-background-food.jpg"><img class="img-fluid" src="${pageContext.request.contextPath}/template/web/assets/img/hero-background-food.jpg" alt="Hero Image Food"></a></div>
                <div class="col-sm-4 d-flex justify-content-center align-items-center"><a data-fancybox="gallery" data-caption="Hero Image Music" href="${pageContext.request.contextPath}/template/web/assets/img/hero-background-music.jpg"><img class="img-fluid" src="${pageContext.request.contextPath}/template/web/assets/img/hero-background-music.jpg" alt="Hero Image Music"></a></div>
                <div class="col-sm-4 d-flex justify-content-center align-items-center"><a data-fancybox="gallery" data-caption="Hero Image Photography" href="${pageContext.request.contextPath}/template/web/assets/img/hero-background-photography.jpg"><img class="img-fluid" src="${pageContext.request.contextPath}/template/web/assets/img/hero-background-photography.jpg" alt="Hero Image Photography"></a></div>
            </div>
        </div>
        <hr>
    </body>
</html>
