<%-- 
    Document   : post
    Created on : Jul 10, 2020, 6:13:25 PM
    Author     : TASS
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>

<c:url var="APIurl" value="/api-admin-comment"/>
<c:url var ="NewsURL" value="/post"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- comment -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/template/web/assets/css/custom-style-comment.css">
        <!-- comment -->

    </head>
    <body>
        <style>
            p {
                margin: 0px !important;
            }
        </style>
        <header class="masthead" style="background-image: url(&quot;${pageContext.request.contextPath}/template/web/assets/img/home-bg.jpg&quot;);">
            <div class="overlay"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-10 col-lg-8 mx-auto">
                        <div class="site-heading">
                            <h1 data-aos="fade-down">BLOG POST</h1><span data-aos="fade-up" class="subheading">Tớ viết linh
                                tinh ở đây nè ^^</span>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <article>
            <div class="container">
                <div class="row">
                    <div class="col-md-10 col-lg-8 mx-auto">
                        <!--title-->
                        <div class="post-preview" data-aos="zoom-in">
                            <h1 class="text-uppercase text-center text-danger post-title">${model.title}</h1>
                            <p class="post-subtitle text-center post-meta" style="padding-bottom: 0px;margin-bottom: 0px;">
                                "${model.shortDescription}"</p>
                            <p class="post-meta" style="margin: 0px;"> Thể loại&nbsp; <a href="${pageContext.request.contextPath}/blog-post?type=list&categoryCode=${model.categoryCode}">${model.categoryName}</a>
                            </p>
                            <p class="post-meta">Đăng bởi&nbsp;
                                <a href="">
                                    <nobr class="text-uppercase">${model.createdBy}</nobr>
                                    <nobr>
                                </a>&nbsp;ngày
                                <fmt:formatDate pattern="dd/MM/yyyy" value="${model.createdDate}"/>
                                </nobr>
                            </p>
                            <hr>
                            <p>
                                ${model.content}
                            </p>
                        </div>
                        <!--title-->


                        <hr>
                        <hr>
                        <h2 class="section-heading">Về tác giả</h2>
                        <blockquote class="blockquote">
                            <i class="fas fa-quote-left"></i>
                            <p class="mb-0">Tớ là #TASS</p>
                            <p class="mb-0">^^</p>
                            <i class="fas fa-quote-right"></i>
                            <span class=" caption text-muted ">
                                <p>~TASsZz2k~<br />
                                    &quot;You Don&#39;t Know What You Don&#39;t Know&quot;<br />
                                    🔥</p>
                            </span>
                        </blockquote>


                        <!-- <a href="#"> -->
                        <!-- <img class="img-fluid rounded" src="${pageContext.request.contextPath}/template/web/assets/img/home-bg.jpg" style="width: 200px;"> -->
                        <!-- <img src="${pageContext.request.contextPath}/template/web/assets/img/home-bg.jpg" alt="..." class="rounded-circle" style="width: 10%;height:10%;"> -->
                        <!-- </a> -->

                    </div>
                </div>
            </div>
        </article>
        <hr>
        <!-- comment -->
        <div class="container discussion-container ">
            <div class="row ">
                <div class="col-12 ">
                    <div class="comments ">
                        <div class="comments-details ">
                            <span class="total-comments comments-sort ">${comments.totalItems} Comments</span>
                            <span class="dropdown ">
                                <button type="button " class="btn dropdown-toggle " data-toggle="dropdown ">Sort By <span
                                        class="caret "></span></button>
                                <div class="dropdown-menu ">
                                    <a href="# " class="dropdown-item ">Top Comments</a>
                                    <a href="# " class="dropdown-item ">Newest First</a>
                                </div>
                            </span>
                        </div>
                        <div class="comment-box add-comment ">
                            <form id="formAddComment">

                                <span class="commenter-pic">
                                    <c:if test="${not empty currentUser.avatar}">
                                        <a href='<c:url value="/profile?type=edit&userName=${currentUser.userName}"/>'>
                                            <img src="${currentUser.avatar}" class="img-fluid " style="height:100%;width:100%; ">
                                        </a>

                                    </c:if>
                                    <c:if test="${empty currentUser.avatar}">
                                        <img src="template/admin/assets/img/avatars/guest.gif" class="img-fluid " style="height:100%;width:100%; ">
                                    </c:if> 
                                </span>
                                <span class="commenter-name">
                                    <c:if test="${not empty currentUser}">
                                        <a href='<c:url value="/profile?type=edit&userName=${currentUser.userName}"/>' >${currentUser.fullName}</a>
                                        <span class="comment-time" style="color: greenyellow;">Active</span>
                                    </c:if>
                                    <c:if test="${empty currentUser}">
                                        <a href="# ">Guest</a>
                                        <span class="comment-time text-warning">Hãy đăng nhập để comment!</span>
                                    </c:if>
                                </span>
                                <input type="text" placeholder="  Add a public comment " name="content" id='content' 
                                       style="background-color: #ececec;height: 4rem;border-radius: 5px; padding-left: 10px;">

                                <div id="warningMessgase" class="alert alert-danger alert-dismissible invisible" style="display: none; margin-top: 16px;">
                                    Bạn phải <a class="text-uppercase" href='<c:url value="/login?action=login"/>'><strong> Đăng nhập </strong></a> để comment bài viết này! 
                                </div>

                                <input type="hidden" name="userId" id='userId' value="${currentUser.id}">
                                <input type="hidden" name="newsId" id='newsId' value="${model.id}">
                                <button type="button" class="btn btn-danger" id="btnCancel" name="btnCancel">Cancel</button>
                                <button type="button" class="btn btn-primary" id="btnAddComment" name="btnAddComment">Add Comment</button>
                            </form>

                        </div>
                        <!--show comments-->
                        <c:forEach var="item" items="${comments.listResult}">
                            <div class="comment-box ">
                                <span class="commenter-pic ">
                                    <img src="${item.avatarUserComment}"
                                         class="img-fluid " style="height:100%;width:100%; ">
                                </span>
                                <span class="commenter-name ">
                                    <a href="# ">${item.fullNameUserComment}</a> <span class="comment-time ">${item.createdDate}</span>
                                </span>
                                <p class="comment-txt more ">${item.content}</p>
                                <div class="comment-meta ">
                                    <button class="comment-like ">
                                        <i class="fa fa-thumbs-o-up " aria-hidden="true "></i>
                                        13
                                    </button>
                                    <!--<button class="comment-dislike "><i class="fa fa-thumbs-o-down " aria-hidden="true "></i> 149</button>-->
                                    <button class="comment-reply reply-popup ">
                                        <i class="fa fa-reply-all " aria-hidden="true "></i> Reply</button>
                                </div>
                            </div>
                        </c:forEach>
                        <!--show comments-->
                    </div>
                </div>
            </div>
        </div>
        <!-- comment -->
        <script>
            $('body').on('input', "#content", function () {
                console.log($('#content').val());
                var value = $('#content').val();
                if (value != '') {
                    $('#btnAddComment').css("color", "#fff");
                    $('#btnAddComment').css("background-color", "#00657b");
                    $('#btnAddComment').css("border-color", "#00657b");
                    //btn cancel
                    $('#btnCancel').css("color", "#fff");
                    $('#btnCancel').css("background-color", "#bd2130");
                    $('#btnCancel').css("border-color", "#b21f2d");
                } else {
                    $('#btnAddComment').css("color", "");
                    $('#btnAddComment').css("background-color", "");
                    $('#btnAddComment').css("border-color", "");
                    //btn cancel
                    $('#btnCancel').css("color", "");
                    $('#btnCancel').css("background-color", "");
                    $('#btnCancel').css("border-color", "");
                }
//                console.log('Selected Value: ', value);
            });

            $("#formAddComment").submit(function (e) {
                e.preventDefault();
                comment();
            });


            $('#btnAddComment').click(function (e) {
                e.preventDefault();
                comment();
            });

            function comment() {

                var value = $('#content').val();
                if ($("#userId").val() != '') {
                    if (!value.replace(/\s/g, '').length || value.length < 10) {
                        $('#warningMessgase').html("Comment thêm gì đó đi... </br><i style='font-size: 0.8rem;'> ( Trên 10 kí tự nhé! )</i>");
                        $('#warningMessgase').removeClass('invisible');
                        $('#warningMessgase').css("display", "");
                    } else {
                        var data = {};
                        var formData = $('#formAddComment').serializeArray();
                        $.each(formData, function (i, v) {
                            data["" + v.name + ""] = v.value;
                        });
                        addComment(data);
                    }


                } else {
                    $('#warningMessgase').removeClass('invisible');
                    $('#warningMessgase').css("display", "");
                }
            }

            function addComment(data) {
                $.ajax({
                    url: '${APIurl}',
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify(data),
                    dataType: 'json',
                    success: function (result) {
                        console.log(result);
                        window.location.href = "${NewsURL}?type=view&id=" + result.newsId;
                    },
                    error: function (error) {
                        console.log(result);
                        window.location.href = "${NewsURL}?type=view&id=" + result.newsId;
                    }
                });
            }
        </script>
    </body>

</html>