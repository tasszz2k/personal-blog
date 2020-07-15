<%-- 
    Document   : editPhoto
    Created on : Jul 15, 2020, 3:26:49 PM
    Author     : TASS
--%>

<%@include  file="/common/taglib.jsp" %>
<c:url var="APIurl" value="/api-admin-photo"/>
<c:url var ="PhotoAPI" value="/admin-photo"/>
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


            <c:if test="${not empty photo.id}">
                <h3 class="text-dark mb-4">Edit Photo</h3>
            </c:if>
            <c:if test="${empty photo.id}">
                <h3 class="text-dark mb-4">Add photo</h3>
            </c:if>

            <div class="card shadow mb-5">
                <div class="card-header py-3">
                    <div class="card-body text-center shadow">
                        <img class=" mb-3 mt-4" src="${photo.image}"  height="200">
                        <div class="mb-3"><button class="btn btn-primary btn-sm" type="button">Photo</button></div>
                    </div>

                </div>
                <div class="card shadow mb-3">
                    <form id="formSubmit">
                        <div class="card-header py-3">
                            <p class="text-primary m-0 font-weight-bold">Photo</p>
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <label for="shortDescription"><strong>Link image</strong></label>
                                <input class="form-control" type="text" placeholder="Paste link image here" name="image" id="image" value="${photo.image}" >
                            </div>
                            <div class="form-group">
                                <label for="shortDescription"><strong>Title</strong></label>
                                <input class="form-control" type="text" placeholder="title" name="title" id="title" value="${photo.title}" >
                            </div>
                            <div class="form-group">
                                <label for="shortDescription"><strong>Description</strong></label>
                                <input class="form-control" type="text" placeholder="caption" name="shortDescription" id="shortDescription" value="${photo.shortDescription}" >
                            </div>
                            <div class="form-group">
                                <label for="shortDescription"><strong>Created Date</strong></label>
                                <input class="form-control" type="text" placeholder="" name="createdDate" id="createdDate" value="${photo.createdDate}" readonly="">
                            </div>
                            <div class="form-group">
                                <label for="shortDescription"><strong>Created By</strong></label>
                                <input class="form-control" type="text" placeholder="" name="createdBy" id="createdBy" value="${photo.createdBy}" readonly="">
                            </div>

                            <c:if test="${not empty photo.id}">
                                <div class="form-group">
                                    <label for="shortDescription"><strong>Modified Date</strong></label>
                                    <input class="form-control" type="text" placeholder="" name="modifiedDate" id="modifiedDate" value="${photo.modifiedDate}" readonly="">
                                </div>
                                <div class="form-group">
                                    <label for="shortDescription"><strong>Modified By</strong></label>
                                    <input class="form-control" type="text" placeholder="" name="modifiedBy" id="modifiedBy" value="${photo.modifiedBy}" readonly="">
                                </div>
                            </c:if>
                        </div
                        <!--idd-->
                        <input type="hidden" name="id" id="id" value="${photo.id}"/>
                    </form>

                </div>

                <div class="card-body">
                    <div class="row">
                        <div class="col-md-12">

                            <div class="form-group">
                                <div class="custom-control custom-switch">
                                    <input class="custom-control-input" type="checkbox" id="formCheck-1">
                                    <label class="custom-control-label" for="formCheck-1">
                                        <strong>Confirm</strong></label>
                                </div>
                            </div>
                            <div class="form-group">
                                <c:if test="${not empty photo.id}">
                                    <input class="btn btn-primary btn-sm btn-bold" type="button" value="Update" id="btnAddOrUpdate"/>
                                </c:if>
                                <c:if test="${empty photo.id}">
                                    <input type="button" class="btn btn-primary btn-sm btn-bold" value="Add" id="btnAddOrUpdate"/>
                                </c:if>                            
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
        <script>

            $('#btnAddOrUpdate').click(function (e) {
                if ($("#formCheck-1").is(':checked')) {
                    e.preventDefault();

                    var data = {};
                    var formData = $('#formSubmit').serializeArray();
                    $.each(formData, function (i, v) {
                        data["" + v.name + ""] = v.value;
                    });
                    var id = $('#id').val();
                    if (id == "") {
                        add(data);
                    } else {
                        update(data);
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
                        window.location.href = "${PhotoAPI}?type=edit&id=" + result.id + "&message=update_success";
                    },
                    error: function (error) {
                        console.log(result);
                        window.location.href = "${PhotoAPI}?type=list&message=error_system";
                    }
                });
            }

            function add(data) {
                $.ajax({
                    url: '${APIurl}',
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify(data),
                    dataType: 'json',
                    success: function (result) {
                        console.log(result);
                        window.location.href = "${PhotoAPI}?type=edit&id=" + result.id + "&message=insert_success";
                    },
                    error: function (error) {
                        console.log(result);
                        window.location.href = "${PhotoAPI}?type=list&message=error_system";
                    }
                });
            }
        </script>                  

    </body>
</html>

