<%@page import="model.User"%>
<%@page import="model.Category"%>
<%@page import="java.util.*"  %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>UserInfo</title>
        <!-- Icons -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <!-- Embed Bootstrap -->
        <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
        <!-- Embed Global CSS -->
        <link rel="stylesheet" href="css/styleGlobal.css">
        <!-- Embed category CSS -->
        <link rel="stylesheet" href="css/styleCategory.css">
        <!-- Embed userInfo CSS -->
        <link rel="stylesheet" href="css/styleUserInfo.css">

    </head>

    <body>
        <!-- NAVBAR -->
        <nav class="navbar navbar-expand-lg fixed-top">
            <div class="container-fluid">
                <!-- NAVBAR -->
                <div class="navbar-logo col-md-3">
                    <a class="navbar-brand" href="index.html">
                        <img style="width: 100px;" src="image/branding/vice logo.png" alt="">
                    </a>
                </div>
                <!-- NAVBAR TOOGLER -->
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
                        aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <!-- NAVBAR CATEGORY -->
                <div class="collapse navbar-collapse col-md-5" id="navbarNavDropdown">
                    <ul class="navbar-nav">
                        <%
                            HashMap<Integer,Category> cat_name = (HashMap<Integer,Category>) session.getAttribute("cat_list");
                        %>
                        <c:forEach items="<%= cat_name %>" var = "cat_name" >
                            <div class="nav-item">
                                <a class="nav-link hover-animation-underline" href="Search?cat_id=<c:out value="${cat_name.key}"/>"  ><c:out value="${cat_name.value.getName()}"/></a>
                            </div>
                        </c:forEach>
                    </ul>
                </div>
                <!-- NAVBAR LOGIN -->
                <div class="navbar-login col-md-3">
                    <a href="" id="navbar-icon-user">
                        <i class="material-icons hover-animation-grow">person</i>
                    </a>
                </div>
            </div>
        </nav>

        <!-- spacer for fixed navbar -->
        <div style="height: 84px;" class="spacer"></div>

        <div class="container-fluid user-info">
            <div class="row nopadding">
                <div class="col-md-6 user-info-main">
                    <div class="user-info-main-image">
                        <img class="rounded-circle" src="image/user/alan wong.webp" alt="">
                    </div>
                    <div class="user-info-main-text">
                        <h1><c:out value="${sessionScope.user.getUname()}"/></h1>
                        <h4>alan.wong@vice.com</h4>
                    </div>
                </div>
                <div class="col-md-6 container-fluid user-info-detail">
                    <div class="user-info-detail-body">
                        <a href="editUserInfo.jsp">
                            <i style="color: black;" class="material-icons">settings</i>
                            <span>Edit</span>
                        </a>
                        <% User user1 = (User)session.getAttribute("user"); %>
                        <p><span>Id: </span><%= user1.getId() %></p>
                        <p><span>Username: </span><%= user1.getUname() %></p>
                        <p><span>Real Name: </span> <%= user1.getName()%></p>
                        <p><span>Gender: </span> <%= user1.getGender()%></p>
                        <p><span>Date Of Birth: </span> <%= user1.getDob()%></p>
                    </div>
                </div>
            </div>
        </div>

        <!-- SAVED NEWS TITLE -->
        <div class="latest-title user-info-titles nopadding">
            <h1>SAVED</h1>
            <h1>NEWS</h1>
        </div>
        <!-- SAVED NEWS -->
        <div class="container-fluid">
            <div class="row nopadding">
                <c:forEach var="saved_news" items="${requestScope.saved_news}">
                <div class="card col-md-4 nopadding">
                    <img src="<c:out value="${sessionScope.location}"/><c:out value="${saved_news.getImage()}"/>.webp" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h3 class="card-title"><c:out value="${saved_news.getTitle()}"/></h3>
                        <p class="card-text"><c:out value="${saved_news.getSubtitle()}"/></p>
                        <h6 class="card-text"><c:out value="${saved_news.getUser_id()}"/></h6>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>

        <!-- PAGING NAVIGATOR -->
        <div class="paging-nav">
            <div class="paging-prev">
                <h4>Newer</h4>
            </div>
            <div class="paging-progress">
                <h4>1</h4>
                <h4>5</h4>
            </div>
            <div class="paging-next">
                <h4>Older</h4>
            </div>
        </div>
        <c:if test="${sessionScope.user.isIsAdmin()}">
        <!-- <AUTHOR NAME>'s NEWS TITLE -->
        <div class="latest-title user-info-titles nopadding">
            <h1>Your</h1>
            <h1>NEWS</h1>
        </div>

        <!-- <AUTHOR NAME>'s NEWS -->
            <div class="container-fluid">
                <div class="row nopadding">
                    <c:if test="${sessionScope.user.isIsAdmin()}">
                    <c:forEach var="posted" items="${requestScope.posted_news}" >
                    <div class="card col-md-4 nopadding">
                        <img src="<c:out value="${sessionScope.location}"/><c:out value="${posted.getImage()}"/>.webp" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h3 class="card-title"><c:out value="${posted.getTitle()}"/></h3>
                            <p class="card-text"><c:out value="${posted.getSubtitle()}"/></p>
                            <h6 class="card-text"><c:out value="${posted.getUser_id()}"/></h6>
                        </div>
                    </div>
                    </c:forEach>
                    </c:if>
                </div>
            </div>

            <!-- PAGING NAVIGATOR -->
            <div class="paging-nav">
                <div class="paging-prev">
                    <h4>Newer</h4>
                </div>
                <div class="paging-progress">
                    <h4>1</h4>
                    <h4>5</h4>
                </div>
                <div class="paging-next">
                    <h4>Older</h4>
                </div>
            </div>
        </c:if>
        <!-- FOOTER -->
        <div class="footer">
            <img class="rotate" style="width: 100px;" src="image/branding/VMG-logo-updated.png" alt="">
            <ul>
                <li>Tr?n Th? Hùng</li>
                <li>Lý Th? L??ng</li>
                <li>Phùng Phúc Lâm</li>
                <li>Nguy?n Hoàng Hi?p</li>
                <li>Nguy?n Chí Trung</li>
            </ul>
            <p>@ 2023 PRj301 HE1725</p>
        </div>
    </body>

</html>