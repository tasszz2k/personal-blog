<%-- 
    Document   : listAccount
    Created on : Jul 11, 2020, 2:14:32 PM
    Author     : TASS
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <body>
        <div class="container-fluid">
            <c:if test="${not empty messageResponse}">
                <div class="alert alert-${alert}">
                    <p class="text-center" style="margin-bottom: 0px;">
                        <strong>${messageResponse}</strong>
                    </p>
                </div>
            </c:if>
            <form action="<c:url value='/admin-user'/>" id="formSubmit" method="get">
                <h3 class="text-dark mb-4">User Management</h3>
                <div class="card shadow">
                    <div class="card-header py-3">
                        <div class="row">
                            <div class="col-md-10">
                                <p class="text-primary m-0 font-weight-bold" style="padding-top: 7px;">List of all users</p>
                            </div>

                            <!-- add + delete article -->

                            <div class="col-md-2">
                                <div class="widget-box table-filter">
                                    <div class="table-btn-controllers">
                                        <div class="pull-right tableTools-container">
                                            <div class="dt-buttons btn-overlap btn-group">
                                                <a flag="info" class="dt-button buttons-colvis btn btn-white btn-primary btn-bold" data-toggle="tooltip" title="Add new article" title="Add article" href='#'>
                                                    <span>
                                                        <i class="fas fa-plus"> </i>
                                                    </span>
                                                </a>
                                                <button id="btnDelete" type="button" class="dt-button buttons-html5 btn btn-white btn-primary btn-bold" data-toggle="tooltip" title="Delete article(s)">
                                                    <span>
                                                        <i class="fas fa-trash-alt"></i>
                                                    </span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!-- add + delete article -->
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6 text-nowrap">
                                <div id="dataTable_length" class="dataTables_length" aria-controls="dataTable">
                                    <label>Show&nbsp;<select
                                            class="form-control form-control-sm custom-select custom-select-sm">
                                            <option value="5" selected="">5</option>
                                            <option value="10">10</option>
                                            <option value="20">20</option>
                                            <option value="50">50</option>
                                        </select>&nbsp;</label></div>
                            </div>
                            <div class="col-md-6">
                                <div class="text-md-right dataTables_filter" id="dataTable_filter"><label><input
                                            type="search" class="form-control form-control-sm" aria-controls="dataTable"
                                            placeholder="Search"></label></div>
                            </div>
                        </div>
                        <div class="table-responsive table mt-2" id="dataTable" role="grid" aria-describedby="dataTable_info">
                            <table class="table my-0" id="dataTable">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col"><input type="checkbox" id="checkAll"></th>
                                        <th scope="col">ID</th>
                                        <th scope="col">Username</th>
                                        <th scope="col">Password</th>
                                        <th scope="col">Full Name</th>
                                        <th scope="col">Status</th>
                                        <th scope="col">Created Date</th>
                                        <th scope="col">Options</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set var="index" value="1" />
                                    <c:forEach var="item" items="${currentUser.listResult}">
                                        <tr>
                                            <th scope="row">${(currentUser.page-1)*5+index}</th>
                                            <th scope="row"><input type="checkbox" id="checkbox_${item.id}" value="${item.id}"></th>
                                            <td>${item.id}</td>
                                            <td>${item.userName}</td>
                                            <td>${item.password}</td>
                                            <td>${item.fullName}</td>
                                            <td>${item.status}</td>
                                            <td>
                                                <fmt:formatDate pattern="dd/MM/yyyy" value="${item.createdDate}" />
                                            </td>


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
                                        <th scope="col">Username</th>
                                        <th scope="col">Password</th>
                                        <th scope="col">Full Name</th>
                                        <th scope="col">Status</th>
                                        <th scope="col">Created Date</th>
                                        <th scope="col">Options</th>
                                    </tr>
                                </tfoot>
                            </table>
                            <input type="hidden" value="" id="page" name="page" />
                            <input type="hidden" value="" id="maxPageItem" name="maxPageItem" />
                            <input type="hidden" value="" id="sortBy" name="sortBy" />
                            <input type="hidden" value="" id="sortType" name="sortType" />
                            <input type="hidden" value="list" id="type" name="type" />
                        </div>
                        <div class="row">
                            <div class="col-md-6 align-self-center">
                                <p id="dataTable_info" class="dataTables_info" role="status" aria-live="polite">Showing ${(currentUser.page-1)*5+1} to ${(currentUser.page-1)*5+index-1} of ${currentUser.totalItems}</p>
                            </div>
                            <div class="col-md-6">
                                <nav class="d-lg-flex justify-content-lg-end dataTables_paginate paging_simple_numbers">
                                    <ul class="pagination" id="pagination"></ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>

        <!--main content-->
        <script type="text/javascript">
            var totalPages = ${currentUser.totalPages}; //50
            var currentPage = ${currentUser.page}; //1
            var limit = 5; //; 
            $(function () {
                window.pagObj = $("#pagination")
                        .twbsPagination({
                            totalPages: totalPages,
                            visiblePages: 5,
                            startPage: currentPage,
                            onPageClick: function (event, page) {
                                if (currentPage != page) {
                                    //console.info(page + " (from options)");
                                    $("#maxPageItem").val(limit);
                                    $("#page").val(page);
                                    $("#sortBy").val('id');
                                    $("#sortType").val('desc');
                                    $("#type").val('list');
                                    $("#formSubmit").submit();
                                }
                            },
                        })
                        .on("page", function (event, page) {
                            console.info(page + " (from event listening)");
                        });
            });
            $("#checkAll").click(function () {
                $('input:checkbox').not(this).prop('checked', this.checked);
            });
        </script>
    </body>

</html>