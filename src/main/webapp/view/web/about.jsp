<%-- 
    Document   : about
    Created on : Jul 8, 2020, 11:29:56 PM
    Author     : TASS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About</title>
    </head>

    <body>
        <style>
            p {
                margin: 0px !important;
            }
        </style>
        <header class="masthead" style="background-image: url(&quot;${pageContext.request.contextPath}/template/web/assets/img/3915228.jpg&quot;);">
            <div class="overlay"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-10 col-lg-8 mx-auto">
                        <div class="site-heading">
                            <h1 data-aos="fade-down">ABOUT ME</h1><span data-aos="fade-up" class="subheading">I'm
                                #TASS!</span>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <div class="container">
            <div class="row">
                <div class="col-md-10 col-lg-8 mx-auto">
                    <h1><span style="font-size:20px"><strong>Ch&agrave;o mừng bạn đến với Blog của m&igrave;nh!
                                ^^</strong></span></h1>

                    <h2><span style="font-size:20px">Giới thiệu một ch&uacute;t, m&igrave;nh l&agrave; <strong>Tuấn Anh -
                                <u>#TASS</u></strong></span></h2>

                    <p><span style="font-size:20px">Đ&acirc;y l&agrave; sản phẩm <u>web project</u> của m&igrave;nh cho
                            m&ocirc;n Java Web tr&ecirc;n trường của m&igrave;nh.</span></p>

                    <p><span style="font-size:20px">Rất vui v&agrave; hoan ngh&ecirc;nh bạn đến với Blog, h&atilde;y đọc
                            v&agrave; tận hưởng những b&agrave;i viết, hay c&aacute;c b&agrave;i thơ - như một m&oacute;n
                            qu&agrave; d&agrave;nh cho bạn - <em><strong>những người bạn y&ecirc;u mến của m&igrave;nh
                                    &lt;3</strong></em></span></p>

                    <h2 style="font-style:italic"><span style="font-size:20px">---</span><br /> Ch&uacute;c bạn c&oacute; những ph&uacute;t gi&acirc;y vui vẻ!<br /> &nbsp;
                    </h2>

                    <p>&nbsp;</p>

                    <p>&nbsp;</p>

                </div>
            </div>


            <hr>
            <div class="container">
                <div class="row">
                    <div class="col-md-10 col-lg-8 text-center mx-auto">
                        <h1 class="text-uppercase text-center">MY GALLERY</h1>
                        <p>Ừ thì... Cùng tớ dạo qua một vài bức ảnh </p>
                        <p><i>Nhấn vào ảnh để xem mô tả chi tiết nhé ^^</i></p>
                    </div>
                </div>
            </div>
            <hr style="width:50%;">
            <div class="container">
                <div class="row fbox3">
                    <div class="col-sm-4 d-flex justify-content-center align-items-center">
                        <a data-fancybox="gallery" data-caption="Logo tớ nè #TASS" href="${pageContext.request.contextPath}/template/web/assets/img/Logo_TASS.png"><img class="img-fluid" src="${pageContext.request.contextPath}/template/web/assets/img/Logo_TASS.png" alt="My Logo #TASS"></a>
                    </div>
                    <div class="col-sm-4 d-flex justify-content-center align-items-center">
                        <a data-fancybox="gallery" data-caption="Ảnh tớ nè :3" href="${pageContext.request.contextPath}/template/web/assets/img/AvatarProfileTASS.png"><img class="img-fluid" src="${pageContext.request.contextPath}/template/web/assets/img/AvatarProfileTASS.png" alt="Ảnh tớ nè" ></a>
                    </div>
                    <div class="col-sm-4 d-flex justify-content-center align-items-center">
                        <a data-fancybox="gallery" data-caption="Cuốn truyện tớ thích nhất của bác Ánh nè #NXC1CT" href="${pageContext.request.contextPath}/template/web/assets/img/quoteNNa.jpg"><img class="img-fluid" src="${pageContext.request.contextPath}/template/web/assets/img/quoteNNa.jpg" alt="#NXC1CT"></a>
                    </div>
                    <div class="col-sm-4 d-flex justify-content-center align-items-center">
                        <a data-fancybox="gallery" data-caption="CLB JS tớ nè" href="${pageContext.request.contextPath}/template/web/assets/img/js2.png"><img class="img-fluid" src="${pageContext.request.contextPath}/template/web/assets/img/js2.png" alt="JsClub"></a>
                    </div>
                    <div class="col-sm-4 d-flex justify-content-center align-items-center">
                        <a data-fancybox="gallery" data-caption="*Người bạn đồng hành* trên mọi nẻo đường của tớ nè :v" href="${pageContext.request.contextPath}/template/web/assets/img/me.jpeg"><img class="img-fluid" src="${pageContext.request.contextPath}/template/web/assets/img/me.jpeg" alt="tổ bee"></a>
                    </div>
                    <div class="col-sm-4 d-flex justify-content-center align-items-center">
                        <a data-fancybox="gallery" data-caption="Ơ, ảnh tớ tiếp nè :D" href="${pageContext.request.contextPath}/template/web/assets/img/lop10.jpg"><img class="img-fluid" src="${pageContext.request.contextPath}/template/web/assets/img/lop10.jpg" alt="ảnh tớ tiếp nè"></a>
                    </div>
                </div>
            </div>
            <hr>
        </div>



    </body>

</html>