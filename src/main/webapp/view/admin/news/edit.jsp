<%-- 
    Document   : edit
    Created on : Jul 1, 2020, 2:18:36 PM
    Author     : TASS
--%>
<%@include  file="/common/taglib.jsp" %>
<c:url var="APIurl" value="/api-admin-news"/>
<c:url var ="NewsURL" value="/admin-news"/>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
        <title>Edit Article</title>
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
            <c:if test="${not empty model.id}">
                <h3 class="text-dark mb-4">Edit Article</h3>
            </c:if>
            <c:if test="${empty model.id}">
                <h3 class="text-dark mb-4">Add Article</h3>
            </c:if>

            <form id="formSubmit">
                <div class="card shadow mb-5">
                    <div class="card-header py-3">
                        <div class="card-body text-center shadow">
                            <img class="rounded-circle mb-3 mt-4" src="${pageContext.request.contextPath}/template/admin/assets/img/article-icon.jpg" width="160" height="160">
                            <div class="mb-3"><button class="btn btn-primary btn-sm" type="button">Change Photo</button></div>
                        </div>

                    </div>
                    <div class="card shadow mb-3">
                        <div class="card-header py-3">
                            <p class="text-primary m-0 font-weight-bold">Article</p>
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <label for="title"><strong>Title</strong></label>
                                <input class="form-control" type="text" placeholder="Title" name="title" id="title" value="${model.title}">
                            </div>
                            <div class="form-group">
                                <label for="categoryCode"><strong>Category</strong></label>
                                <select class="form-control" id="categoryCode" name="categoryCode">
                                    <c:if test="${empty model.categoryCode}">
                                        <option>>> Select category <<</option>
                                        <c:forEach var="item" items="${categories}">
                                            <option value="${item.code}">
                                                ${item.name}
                                            </option>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${not empty model.categoryCode}">
                                        <c:forEach var="item" items="${categories}">
                                            <option value="${item.code}" <c:if test="${item.code == model.categoryCode}">selected="selected"</c:if>>
                                                ${item.name}
                                            </option>
                                        </c:forEach>
                                        <option>>> Select category <<</option>
                                    </c:if>

                                </select>
                            </div>
                            <div class="form-group">
                                <label for="shortDescription"><strong>Description</strong></label>
                                <input class="form-control" type="text" placeholder="Description" name="shortDescription" id="shortDescription" value="${model.shortDescription}">
                            </div>
                            <div class="form-group">
                                <label for="thumbnail"><strong>Thumbnail</strong></label>
                                <input class="form-control" type="text" placeholder="Thumbnail" name="thumbnail" id="thumbnail" value="${model.thumbnail}">
                            </div>
                        </div>
                    </div>

                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-12">

                                <div class="form-group">
                                    <label for=""><strong>Content</strong><br></label>
                                    <textarea class="form-control" rows="5" name="content" id="content">${model.content}</textarea>
                                    <!-- <textarea rows="" cols="" id="content" name="content" style="width: 820px;height: 175px">${model.content}</textarea> -->
                                </div>
                                <div class="form-group">
                                    <div class="custom-control custom-switch"><input class="custom-control-input" type="checkbox" id="formCheck-1"><label class="custom-control-label" for="formCheck-1"><strong>Confirm</strong></label></div>
                                </div>
                                <div class="form-group">
                                    <c:if test="${not empty model.id}">
                                        <input class="btn btn-primary btn-sm btn-bold" type="button" value="Update" id="btnAddOrUpdateNews"/>
                                    </c:if>
                                    <c:if test="${empty model.id}">
                                        <input type="button" class="btn btn-primary btn-sm btn-bold" value="Add" id="btnAddOrUpdateNews"/>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-header py-3">
                        <div class="card-body text-center shadow">
                            <div class="table-responsive table mt-2" id="dataTable" role="grid" aria-describedby="dataTable_info">
                                <table class="table my-0" id="dataTable">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col"><input type="checkbox" id="checkAll"></th>
                                            <th scope="col">ID</th>
                                            <th scope="col">Content</th>
                                            <th scope="col">User ID</th>
                                            <th scope="col">Post ID</th>
                                            <th scope="col">Comment Date</th>
                                            <th scope="col">Comment By</th>
                                            <th scope="col">Full Name</th>
                                            <th scope="col">Title Post</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:set var="index" value="1" />
                                        <c:forEach var="item" items="${comments.listResult}">
                                            <tr>
                                                <th scope="row">${index}</th>
                                                <th scope="row"><input type="checkbox" id="checkbox_${item.id}" value="${item.id}"></th>
                                                <td>${item.id}</td>
                                                <td>${item.content}</td>
                                                <td>${item.userId}</td>
                                                <td>${item.newsId}</td>
                                                <td>${item.createdDate}</td>
                                                <td>${item.createdBy}</td>
                                                <td>${item.fullNameUserComment}</td>
                                                <td>${item.titleNewsComment}</td>
                                                <td>
                                                    <c:url var="editURL" value="/admin-news">
                                                        <c:param name="type" value="edit" />
                                                        <c:param name="id" value="${item.id}" />
                                                    </c:url>
                                                    <a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip" title="Update article" href="#">
                                                        <i class="fa fa-edit" aria-hidden="true"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                            <c:set var="index" value="${index+1}" />
                                        </c:forEach>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col"><input type="checkbox" id="checkAll"></th>
                                            <th scope="col">ID</th>
                                            <th scope="col">Content</th>
                                            <th scope="col">User ID</th>
                                            <th scope="col">Post ID</th>
                                            <th scope="col">Comment Date</th>
                                            <th scope="col">Comment By</th>
                                            <th scope="col">Full Name</th>
                                            <th scope="col">Title Post</th>
                                        </tr>
                                    </tfoot>
                                </table>


                            </div>
                        </div>
                        <div class="col-md-6 align-self-center">
                            <p id="dataTable_info" class="dataTables_info" role="status" aria-live="polite">Show ${comments.totalItems} Comments(s)</p>
                        </div>
                    </div>
                </div>
                <input type="hidden" name="id" id="id" value="${model.id}"/>
            </form>
        </div>
        <script>
            var editor = '';
            $(document).ready(function () {
                editor = CKEDITOR.replace('content');
            });

            $('#btnAddOrUpdateNews').click(function (e) {
                if ($("#formCheck-1").is(':checked')) {
                    e.preventDefault();
                    // var title = $('#title').val();
                    // var categoryCode = $('#categoryCode').val();
                    // var shortDescription = $('#shortDescription').val();
                    // var thumbnail = $('#thumbnail').val();
                    // var content = $('#content').val();
                    var data = {};
                    var formData = $('#formSubmit').serializeArray();
                    $.each(formData, function (i, v) {
                        data["" + v.name + ""] = v.value;
                    });
                    data["content"] = editor.getData();
                    var id = $('#id').val();
                    if (id == "") {
                        addNews(data);
                    } else {
                        updateNews(data);
                    }
                    // console.log(data);
                    // $('#formSubmit').submit();
                }

            });

            function addNews(data) {
                $.ajax({
                    url: '${APIurl}',
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify(data),
                    dataType: 'json',
                    success: function (result) {
                        console.log(result);
                        window.location.href = "${NewsURL}?type=edit&id=" + result.id + "&message=insert_success";
                    },
                    error: function (error) {
                        console.log(result);
                        window.location.href = "${NewsURL}?type=list&maxPageItem=5&page=1&message=error_system";
                    }
                });
            }
            function updateNews(data) {
                $.ajax({
                    url: '${APIurl}',
                    type: 'PUT',
                    contentType: 'application/json',
                    data: JSON.stringify(data),
                    dataType: 'json',
                    success: function (result) {
                        console.log(result);
                        window.location.href = "${NewsURL}?type=edit&id=" + result.id + "&message=update_success";
                    },
                    error: function (error) {
                        console.log(result);
                        window.location.href = "${NewsURL}?type=list&maxPageItem=5&page=1&message=error_system";
                    }
                });
            }
        </script>                  

    </body>
</html>
