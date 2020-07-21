<%-- 
    Document   : privateMessage
    Created on : Jul 21, 2020, 9:55:25 AM
    Author     : TASS
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>

<c:url var="APIurl" value="/api-admin-message"/>
<c:url var ="MessageURL" value="/message"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <style>
            .container-fluid{
                font-family: Open Sans,Helvetica Neue,Helvetica,Arial,sans-serif;
            }
        </style>

        <!-- ============================================== -->
        <header class="masthead" style="background-image:url('${pageContext.request.contextPath}/template/admin/assets/img/message.png');">
            <div class="overlay"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-10 col-lg-8 mx-auto">
                        <div class="site-heading">
                            <h1 data-aos="fade-down" style="font-size: 70px;">Hello 
                                <c:if test="${not empty currentUser.fullName}">
                                    ${currentUser.fullName}
                                </c:if>
                                <c:if test="${empty currentUser.fullName}">
                                    Guest
                                </c:if>

                            </h1>
                            <span data-aos="fade-up" class="subheading">Let's send secret message to me</span>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <div class="container-fluid">
            <c:if test="${not empty message}">
                <div class="alert alert-${alert}">
                    <p class="text-center" style="margin-bottom: 0px;">
                        <strong>${message}</strong>
                    </p>
                </div>
            </c:if>
            <c:if test="${not empty messageResponse}">
                <div class="alert alert-${alert}">
                    ${messageResponse}
                </div>
            </c:if>
            <h3 class="text-dark mb-4">Secret message</h3>


            <form id="formSubmit">
                <div class="card shadow mb-5">
                    <div class="card-header py-3">
                        <div class="card-body text-center shadow">
                            <img class="rounded-circle mb-3 mt-4" src="${pageContext.request.contextPath}/template/admin/assets/img/mail.jpg" width="160" height="160">
                        </div>

                    </div>

                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-12">

                                <div class="form-group">
                                    <label for=""><strong>Message</strong><br></label>
                                    <textarea class="form-control" rows="5" name="content" id="content"></textarea>
                                </div>
                                <div class="form-group">
                                    <div class="custom-control custom-switch"><input class="custom-control-input" type="checkbox" id="formCheck-1"><label class="custom-control-label" for="formCheck-1"><strong>Confirm</strong></label></div>
                                </div>
                                <div class="form-group">

                                    <input type="button" class="btn btn-primary btn-sm btn-bold" value="Send" id="btnAdd"/>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-header py-3">
                        <div class="card-body shadow">
                            <div class="table-responsive table mt-2" id="dataTable" role="grid" aria-describedby="dataTable_info">
                                <table class="table my-0" id="dataTable">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Nội dung</th>
                                            <th scope="col">Ngày gửi</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:set var="index" value="1" />
                                        <c:forEach var="item" items="${messageModel.listResult}">
                                            <tr>
                                                <td >${index}</td>
                                                <td>${item.content}</td>
                                                <td >${item.createdDate}</td>
                                            </tr>
                                            <c:set var="index" value="${index+1}" />
                                        </c:forEach>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Nội dung</th>
                                            <th scope="col">Ngày gửi</th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                        <!--                        <div class="col-md-6 align-self-center">
                                                    <p id="dataTable_info" class="dataTables_info" role="status" aria-live="polite">Show ${comments.totalItems} Comments(s)</p>
                                                </div>-->
                    </div>
                </div>
            </form>
        </div>
        <script>
            var editor = '';
            $(document).ready(function () {
                editor = CKEDITOR.replace('content');
            });

            $('#btnAdd').click(function (e) {
                if ($("#formCheck-1").is(':checked')) {
                    e.preventDefault();
                    var data = {};
                    var formData = $('#formSubmit').serializeArray();
                    $.each(formData, function (i, v) {
                        data["" + v.name + ""] = v.value;
                    });
                    data["content"] = editor.getData();
                    sendMessage(data);
                }
            });

            function sendMessage(data) {
                $.ajax({
                    url: '${APIurl}',
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify(data),
                    dataType: 'json',
                    success: function (result) {
                        console.log(result);
                        window.location.href = "${MessageURL}?&message=send_message_success";
                    },
                    error: function (error) {
                        console.log(result);
                        window.location.href = "${MessageURL}?message=error_system";
                    }
                });
            }
        </script>            
    </body>
</html>
