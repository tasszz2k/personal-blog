<%-- 
    Document   : login
    Created on : Jun 29, 2020, 11:40:18 PM
    Author     : TASS
--%>
    <%@include  file="/common/taglib.jsp" %>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
            <!DOCTYPE html>
            <html>

            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>Login</title>
            </head>

            <body>
                <div class="container">
                    <c:if test="${not empty message}">
                        <div class="alert alert-${alert}">
                            <p class="text-center" style="margin-bottom: 0px;">
                                <strong>${message}</strong>
                            </p>
                        </div>
                    </c:if>

                    <div class="row justify-content-center">
                        <div class="col-md-9 col-lg-12 col-xl-10">
                            <div class="card shadow-lg o-hidden border-0 my-5">
                                <div class="card-body p-0">
                                    <div class="row">
                                        <div class="col-lg-6 d-none d-lg-flex">
                                            <div class="flex-grow-1 bg-login-image" style="background-image: url(&quot;${pageContext.request.contextPath}/template/admin/assets/img/dogs/image3.jpeg&quot;);"></div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="p-5">
                                                <div class="text-center">
                                                    <h4 class="text-dark mb-4">Login</h4>
                                                </div>
                                                <form action="<c:url value='/login'/>" class="user" method="post">
                                                    <div class="form-group"><input class="form-control form-control-user" type="username" id="exampleInputUsername" aria-describedby="username" placeholder="Username" name="userName" required></div>
                                                    <div class="form-group"><input class="form-control form-control-user" type="password" id="exampleInputPassword" placeholder="Password" name="password" required></div>
                                                    <div class="form-group">
                                                        <div class="custom-control custom-checkbox small">
                                                            <div class="form-check">
                                                                <input class="form-check-input custom-control-input" type="checkbox" id="formCheck-1" checked>
                                                                <label class="form-check-label custom-control-label" for="formCheck-1">Remember Me</label></div>
                                                        </div>
                                                    </div><button class="btn btn-primary btn-block text-white btn-user" type="submit">Login</button>
                                                    <hr><a class="btn btn-primary btn-block text-white btn-google btn-user" role="button"><i class="fab fa-google"></i>&nbsp; Login with Google</a><a class="btn btn-primary btn-block text-white btn-facebook btn-user"
                                                        role="button"><i class="fab fa-facebook-f"></i>&nbsp; Login with Facebook</a>
                                                    <hr>
                                                    <input type="hidden" value="login" name="action" />
                                                </form>
                                                <div class="text-center"><a class="small" href="forgot-password.html">Forgot Password?</a></div>
                                                <div class="text-center"><a class="small" href='<c:url value="/register"/>'>Create an Account!</a></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </body>

            </html>