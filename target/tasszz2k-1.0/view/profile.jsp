<%-- 
    Document   : profile
    Created on : Jul 11, 2020, 9:00:43 PM
    Author     : TASS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<c:url var="APIurl" value="/api-admin-user"/>
<c:url var="ProfileURL" value="/profile"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <style>
            .container{
                font-family: Open Sans,Helvetica Neue,Helvetica,Arial,sans-serif;
            }
        </style>

        <!-- ============================================== -->
        <header class="masthead" style="background-image:url('${pageContext.request.contextPath}/template/web/assets/img/powder-pastel-background-design_23-2148590939.jpg');">
            <div class="overlay"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-10 col-lg-8 mx-auto">
                        <div class="site-heading">
                            <h1 data-aos="fade-down" style="font-size: 70px;">Hello ${currentUser.fullName}</h1><span data-aos="fade-up" class="subheading">This is your profile</span>
                        </div>
                    </div>
                </div>
            </div>
        </header>




        <div class="container">
            <h3 class="text-dark mb-4">Your Profile</h3>
            <c:if test="${not empty message}">
                <div class="alert alert-${alert}">
                    <p class="text-center" style="margin-bottom: 0px; margin-bottom: 0px;margin-top: 0px;">
                        <strong>${message}</strong>
                    </p>
                </div>
            </c:if>
            <form id="formSubmit">
                <div class="card shadow mb-5">
                    <div class="card-header py-3">
                        <div class="card-body text-center shadow"><img class="rounded-circle mb-3 mt-4" src="${currentUser.avatar}" width="160" height="160">
                            <div class="mb-3"><button class="btn btn-primary btn-sm" type="button">Change
                                    Photo</button></div>
                        </div>
                    </div>
                    <div class="card shadow mb-3">
                        <div class="card-header py-3">
                            <p class="text-primary m-0 font-weight-bold">Information</p>
                        </div>
                        <div class="card-body">
                            <div class="form-group"><label for="title"><strong>Username</strong></label>
                                <input class="form-control" type="text" placeholder="Username" name="userName" id="userName" value="${currentUser.userName}" readonly required=""></div>
                            <div class="form-group"><label for="category"><strong>Full Name</strong></label>
                                <input class="form-control" type="text" placeholder="Full Name" name="fullName" id="fullName" value="${currentUser.fullName}" required="">
                            </div>
                            <div class="form-group"><label for="description"><strong>Register Date</strong></label>
                                <input class="form-control" type="text" placeholder="Register Date" name="createdDate" id="createdDate" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${currentUser.createdDate}"/>" readonly="" required=""></div>
                            <div class="form-group"><label for="thumbnail"><strong>Link Avatar</strong></label>
                                <input class="form-control" type="text" placeholder="Paste link avatar here" name="avatar" id="avatar" value="${currentUser.avatar}" required="">    
                            </div>
                        </div>
                    </div>

                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-12">
                                <label for="title"><strong>Password</strong></label>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0"><input class="form-control form-control-user" type="password" id="password" placeholder="Password" name="password" required="required"></div>
                                    <div class="col-sm-6"><input class="form-control form-control-user" type="password" id="password_repeat" placeholder="Repeat Password" name="password_repeat" required="required"></div>
                                </div>
                                <div class="form-group">
                                    <div class="custom-control custom-switch">
                                        <input class="custom-control-input" type="checkbox" id="formCheck-1" required="">
                                        <label class="custom-control-label" for="formCheck-1"><strong>Confirm</strong></label></div>
                                </div>
                                <div class="form-group"><button class="btn btn-primary btn-sm" type="button" id="btnUpdate">Save Settings</button></div>

                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <!-- ====================================================== -->
        <script>
            $('#btnUpdate').click(function (e) {
                if ($("#formCheck-1").is(':checked')) {
                    if ($('#password').val() === $('#password_repeat').val()) {
                        console.log("same password");
                        e.preventDefault();

                        var data = {};
                        data["userName"] = $('#userName').val();
                        data["fullName"] = $('#fullName').val();
                        data["password"] = $('#password').val();
                        data["avatar"] = $('#avatar').val();

                        update(data);
                        console.log(data);
                    } else {
                        console.log("password and password repeat not match");
                        window.location.href = "${ProfileURL}?type=edit&userName=" + $('#userName').val() + "&message=password_not_match&alert=danger";
                    }
                }

            });

            function update(data) {
                $.ajax({
                    url: '${APIurl}',
                    type: 'PUT',
                    contentType: 'application/json',
                    data: JSON.stringify(data),
                    dataType: 'json',
                    success: function (result) {
                        console.log(result);
                        if (result != null) {
                            window.location.href = "${ProfileURL}?type=edit&userName=" + result.userName + "&message=update_information_success&alert=success";
                        } else {
                            window.location.href = "${ProfileURL}?type=edit&userName=" + $('#userName').val() + "&message=update_information_fail&alert=danger";
                        }
                    },
                    error: function (error) {
                        window.location.href = "${ProfileURL}?type=edit&userName=" + $('#userName').val() + "&message=update_information_fail&alert=danger";
                    }
                });
            }
        </script>
    </body>
</html>
