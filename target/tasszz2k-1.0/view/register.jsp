<%-- 
    Document   : login
    Created on : Jun 29, 2020, 11:40:18 PM
    Author     : TASS
--%>
<%@include  file="/common/taglib.jsp" %>
<c:url var="APIurl" value="/api-admin-user"/>
<c:url var ="LoginURL" value="/login"/>
<c:url var ="RegisterURL" value="/register"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
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

            <div class="card shadow-lg o-hidden border-0 my-5">
                <div class="card-body p-0">
                    <div class="row">
                        <div class="col-lg-5 d-none d-lg-flex">
                            <div class="flex-grow-1 bg-register-image" style="background-image: url(&quot;${pageContext.request.contextPath}/template/admin/assets/img/dogs/image2.jpeg&quot;);"></div>
                        </div>
                        <div class="col-lg-7">
                            <div class="p-5">
                                <div class="text-center">
                                    <h4 class="text-dark mb-4">Create an Account!</h4>
                                </div>
                                <form class="user" id='formSubmit'>
                                    <div class="form-group row">
                                        <div class="col-sm-12 mb-6 mb-sm-0"><input class="form-control form-control-user" type="text" id="fullName" placeholder="Full Name" name="fullName" required=""></div>
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control form-control-user" type="text" placeholder="Username" name="userName" id="userName" required=""></div>
                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0"><input class="form-control form-control-user" type="password" id="password" placeholder="Password" name="password" required=""></div>
                                        <div class="col-sm-6"><input class="form-control form-control-user" type="password" id="password_repeat" placeholder="Repeat Password" name="password_repeat" required=""></div>
                                    </div><input class="btn btn-primary btn-block text-white btn-user" type="button" id="btnRegister" value="Register Account"/>
                                    <hr><a class="btn btn-primary btn-block text-white btn-google btn-user" role="button"><i class="fab fa-google"></i>&nbsp; Register with Google</a>
                                    <a class="btn btn-primary btn-block text-white btn-facebook btn-user" role="button"><i class="fab fa-facebook-f"></i>&nbsp; Register with Facebook</a>
                                    <hr>
                                    <input type="hidden" id="status" name="status" value="1"/>
                                </form>
                                <div class="text-center"><a class="small" href="forgot-password.html">Forgot Password?</a></div>
                                <div class="text-center"><a class="small" href='<c:url value="/login?action=login"/>'>Already have an account? Login!</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $('#btnRegister').click(function (e) {
                if ($('#password').val() === $('#password_repeat').val()) {
                    e.preventDefault();
                    // var title = $('#title').val();
                    // var categoryCode = $('#categoryCode').val();
                    // var shortDescription = $('#shortDescription').val();
                    // var thumbnail = $('#thumbnail').val();
                    // var content = $('#content').val();
                    var data = {};
                    var formData = $('#formSubmit').find('input[name!=password_repeat]').serializeArray();
                    $.each(formData, function (i, v) {
                        data["" + v.name + ""] = v.value;
                    });
                    register(data);
                    console.log(data);
                    // $('#formSubmit').submit();
                } else {
                    window.location.href = "${RegisterURL}?action=register&message=password_not_match&alert=danger";
                }

            });

            function register(data) {
                $.ajax({
                    url: '${APIurl}',
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify(data),
                    dataType: 'json',
                    success: function (result) {
                        console.log(result);
                        if (result != null) {
                            window.location.href = "${LoginURL}?action=login&message=register_success&alert=success";
                        } else {
                            window.location.href = "${RegisterURL}?action=register&message=register_fail&alert=danger";
                        }
                    },
                    error: function (error) {
                        window.location.href = "${RegisterURL}?action=register&message=register_fail&alert=danger";
                    }
                });
            }


        </script>  
    </body>
</html>
