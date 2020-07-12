<%-- 
    Document   : home
    Created on : Jun 16, 2020, 1:25:08 PM
    Author     : TASS
--%>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
            <%@include file="/common/taglib.jsp" %>
                <c:url var="NewsURL" value="/post" />
                <!DOCTYPE html>
                <html>

                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                    <title>Trang chủ</title <link rel="stylesheet" href="${pageContext.request.contextPath}/template/web/assets/bootstrap/css/bootstrap.min.css">
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

                </head>

                <body>
                    <header class="masthead" style="background-image:url('${pageContext.request.contextPath}/template/web/assets/img/plant-2004483_1920.jpg');">
                        <div class="overlay"></div>
                        <div class="container">
                            <div class="row">
                                <div class="col-md-10 col-lg-8 mx-auto">
                                    <div class="site-heading">
                                        <h1 data-aos="fade-down" style="font-size: 70px;">Hello, I'm TASS</h1><span data-aos="fade-up" class="subheading">Welcome to my Blog!</span>
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
                                        <div class="text-left searchbar" data-bs-hover-animate="pulse" style="width: 358px;"><input type="text" class="search_input" style="width: 190px;font-family: 'Open Sans', sans-serif;padding: 0;margin-left: 0px;padding-left: 10px;" autocomplete="on" placeholder="Search..."><a class="search_icon"
                                                href="#"><i
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
                                            <c:param name="type" value="view" />
                                            <c:param name="id" value="${item.id}" />
                                        </c:url>
                                        <a href="${viewURL}">
                                            <h2 class="post-title">${item.title}</h2>
                                            <h3 class="post-subtitle">${item.shortDescription}</h3>
                                        </a>
                                        <p class="post-meta" style="margin: 0px;"> Thể loại&nbsp; <a href="#">${item.categoryName}</a></p>
                                        <p class="post-meta">Đăng bởi&nbsp;
                                            <a href="">
                                                <nobr class="text-uppercase">${item.createdBy}</nobr>
                                                <nobr>
                                            </a>&nbsp;ngày
                                            <fmt:formatDate pattern="dd/MM/yyyy" value="${item.createdDate}" />
                                            </nobr>
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
                                        <div class="col-sm-4 d-flex justify-content-center align-items-center">
                                            <a data-fancybox="gallery" data-caption="Hero Image Nature" href="${pageContext.request.contextPath}/template/web/assets/img/hero-background-nature.jpg"><img class="img-fluid" src="${pageContext.request.contextPath}/template/web/assets/img/hero-background-nature.jpg" alt="Hero Image Nature"></a>
                                        </div>
                                        <div class="col-sm-4 d-flex justify-content-center align-items-center">
                                            <a data-fancybox="gallery" data-caption="Hero Image Technology" href="${pageContext.request.contextPath}/template/web/assets/img/hero-background-technology.jpg"><img class="img-fluid" src="${pageContext.request.contextPath}/template/web/assets/img/hero-background-technology.jpg" alt="Hero Image Technology"></a>
                                        </div>
                                        <div class="col-sm-4 d-flex justify-content-center align-items-center">
                                            <a data-fancybox="gallery" data-caption="Hero Image Travel" href="${pageContext.request.contextPath}/template/web/assets/img/hero-background-travel.jpg"><img class="img-fluid" src="${pageContext.request.contextPath}/template/web/assets/img/hero-background-travel.jpg" alt="Hero Image Travel"></a>
                                        </div>
                                        <div class="col-sm-4 d-flex justify-content-center align-items-center">
                                            <a data-fancybox="gallery" data-caption="Hero Image Food" href="${pageContext.request.contextPath}/template/web/assets/img/hero-background-food.jpg"><img class="img-fluid" src="${pageContext.request.contextPath}/template/web/assets/img/hero-background-food.jpg" alt="Hero Image Food"></a>
                                        </div>
                                        <div class="col-sm-4 d-flex justify-content-center align-items-center">
                                            <a data-fancybox="gallery" data-caption="Hero Image Music" href="${pageContext.request.contextPath}/template/web/assets/img/hero-background-music.jpg"><img class="img-fluid" src="${pageContext.request.contextPath}/template/web/assets/img/hero-background-music.jpg" alt="Hero Image Music"></a>
                                        </div>
                                        <div class="col-sm-4 d-flex justify-content-center align-items-center">
                                            <a data-fancybox="gallery" data-caption="Hero Image Photography" href="${pageContext.request.contextPath}/template/web/assets/img/hero-background-photography.jpg"><img class="img-fluid" src="${pageContext.request.contextPath}/template/web/assets/img/hero-background-photography.jpg" alt="Hero Image Photography"></a>
                                        </div>
                                    </div>
                                </div>
                                <hr>

                            </div>
                            <div class="col-1"></div>
                            <div class="col">
                                <hr>
                                <hr>
                                <div class="container">
                                    <div class="row">

                                        <h1 class="text-uppercase text-center">NGẪU HỨNG</h1>
                                        <p style="font-family: Open Sans, Helvetica Neue, Helvetica, Arial, sans-serif; text-align: center;">Một vài thứ gì đó sẽ ở đây trong tương lai</p>

                                    </div>
                                </div>
                                <div class="container">
                                    <div class="row fbox3">
                                        <!-- <div class="col-sm-4 d-flex justify-content-center align-items-center"> -->
                                        <a data-fancybox="gallery" data-caption="Hero Image Nature" href="${pageContext.request.contextPath}/template/web/assets/img/hero-background-nature.jpg"><img class="img-fluid" src="${pageContext.request.contextPath}/template/web/assets/img/hero-background-nature.jpg" alt="Hero Image Nature"></a>
                                        <!-- </div> -->
                                        <!-- <div class="col-sm-4 d-flex justify-content-center align-items-center"> -->
                                        <a data-fancybox="gallery" data-caption="Hero Image Technology" href="${pageContext.request.contextPath}/template/web/assets/img/hero-background-technology.jpg"><img class="img-fluid" src="${pageContext.request.contextPath}/template/web/assets/img/hero-background-technology.jpg" alt="Hero Image Technology"></a>
                                        <!-- </div> -->
                                        <!-- <div class="col-sm-4 d-flex justify-content-center align-items-center"> -->
                                        <a data-fancybox="gallery" data-caption="Hero Image Travel" href="${pageContext.request.contextPath}/template/web/assets/img/hero-background-travel.jpg"><img class="img-fluid" src="${pageContext.request.contextPath}/template/web/assets/img/hero-background-travel.jpg" alt="Hero Image Travel"></a>
                                        <!-- </div> -->
                                        <!-- <div class="col-sm-4 d-flex justify-content-center align-items-center"> -->
                                        <a data-fancybox="gallery" data-caption="Hero Image Food" href="${pageContext.request.contextPath}/template/web/assets/img/hero-background-food.jpg"><img class="img-fluid" src="${pageContext.request.contextPath}/template/web/assets/img/hero-background-food.jpg" alt="Hero Image Food"></a>
                                        <!-- </div> -->
                                        <!-- <div class="col-sm-4 d-flex justify-content-center align-items-center"> -->
                                        <a data-fancybox="gallery" data-caption="Hero Image Music" href="${pageContext.request.contextPath}/template/web/assets/img/hero-background-music.jpg"><img class="img-fluid" src="${pageContext.request.contextPath}/template/web/assets/img/hero-background-music.jpg" alt="Hero Image Music"></a>
                                        <!-- </div> -->
                                        <!-- <div class="col-sm-4 d-flex justify-content-center align-items-center"> -->
                                        <a data-fancybox="gallery" data-caption="Hero Image Photography" href="${pageContext.request.contextPath}/template/web/assets/img/hero-background-photography.jpg"><img class="img-fluid" src="${pageContext.request.contextPath}/template/web/assets/img/hero-background-photography.jpg" alt="Hero Image Photography"></a>
                                        <!-- </div> -->
                                    </div>
                                </div>
                                <hr>
                            </div>
                            <form action="<c:url value='/home-page'/>" id="formSubmit" method="get">
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