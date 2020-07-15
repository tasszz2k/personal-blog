<%-- 
    Document   : edit
    Created on : Jul 1, 2020, 2:18:36 PM
    Author     : TASS
--%>
<%@include  file="/common/taglib.jsp" %>
<c:url var="APIurl" value="/api-admin-comment"/>
<c:url var ="CommentURL" value="/admin-comment"/>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
        <title>Update Comment</title>
    </head>
    <body>
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


            <h3 class="text-dark mb-4">Update Comment</h3>

            <div class="card shadow mb-5">
                <div class="card-header py-3">
                    <div class="card-body text-center shadow">
                        <img class="rounded-circle mb-3 mt-4" src="${pageContext.request.contextPath}/template/admin/assets/img/article-icon.jpg" width="160" height="160">
                        <div class="mb-3"><button class="btn btn-primary btn-sm" type="button">Comment</button></div>
                    </div>

                </div>
                <div class="card shadow mb-3">
                    <div class="card-header py-3">
                        <p class="text-primary m-0 font-weight-bold">Comment</p>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <label for="shortDescription"><strong>Comment Date</strong></label>
                            <input class="form-control" type="text" placeholder="" name="" id="" value="${model.createdDate}" readonly="">
                        </div>
                        <div class="form-group">
                            <label for="shortDescription"><strong>Comment By</strong></label>
                            <input class="form-control" type="text" placeholder="" name="" id="" value="${model.createdBy}" readonly="">
                        </div>
                        <div class="form-group">
                            <label for="shortDescription"><strong>Full Name</strong></label>
                            <input class="form-control" type="text" placeholder="" name="" id="" value="${model.fullNameUserComment}" readonly="">
                        </div>
                        <div class="form-group">
                            <label for="shortDescription"><strong>Title Post</strong></label>
                            <input class="form-control" type="text" placeholder="" name="" id="" value="${model.titleNewsComment}" readonly="">
                        </div>

                    </div>
                </div>

                <div class="card-body">
                    <div class="row">
                        <div class="col-md-12">
                            <form id="formSubmit">
                                <div class="form-group">
                                    <label for=""><strong>Content</strong><br></label>
                                    <input type='text' class="form-control" rows="5" name="content" id="content" value="${model.content}"/>
                                </div>
                                <input type='hidden' id='id' name="id" value="${model.id}"/>
                            </form>

                            <div class="form-group">
                                <div class="custom-control custom-switch"><input class="custom-control-input" type="checkbox" id="formCheck-1"><label class="custom-control-label" for="formCheck-1"><strong>Confirm</strong></label></div>
                            </div>
                            <div class="form-group">

                                <input class="btn btn-primary btn-sm btn-bold" type="button" value="Update" id="btnUpdate"/>

                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
        <script>

            $('#btnUpdate').click(function (e) {
                if ($("#formCheck-1").is(':checked')) {
                    e.preventDefault();

                    var data = {};
                    var formData = $('#formSubmit').serializeArray();
                    $.each(formData, function (i, v) {
                        data["" + v.name + ""] = v.value;
                    });

                }
                updateComment(data);
            });


            function updateComment(data) {
                $.ajax({
                    url: '${APIurl}',
                    type: 'PUT',
                    contentType: 'application/json',
                    data: JSON.stringify(data),
                    dataType: 'json',
                    success: function (result) {
                        console.log(result);
                        window.location.href = "${CommentURL}?type=update&id=" + result.id + "&message=update_success";
                    },
                    error: function (error) {
                        console.log(result);
                        window.location.href = "${CommentURL}?type=list&maxPageItem=5&page=1&message=error_system";
                    }
                });
            }
        </script>                  

    </body>
</html>
