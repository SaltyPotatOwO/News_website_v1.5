<%@page import="java.util.*"%>
<%@page import="model.*"%>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Category</title>
        <!-- Icons -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <!-- Embed Bootstrap -->
        <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
        <!-- Embed Global CSS -->
        <link rel="stylesheet" href="css/styleGlobal.css">
        <!-- Embed newsInfo CSS -->
        <link rel="stylesheet" href="css/styleNewsInfo.css">
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
                <div class="collapse navbar-collapse col-md-6" id="navbarNavDropdown">
                    <ul class="navbar-nav">
                        <%
                            HashMap<Integer ,Category> cat_name = (HashMap<Integer,Category>) session.getAttribute("cat_list");
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
        <%
            News news = (News) request.getAttribute("news");
            HashMap<Integer,User> user_nameList = (HashMap<Integer,User>) request.getAttribute("user_list");
            ArrayList<News> listNews = (ArrayList<News>) request.getAttribute("sameCategoryNews");
            ArrayList<Comments> commentList = (ArrayList<Comments>) request.getAttribute("commentList");
        %>
        <!-- spacer for fixed navbar -->
        <div style="height: 84px;" class="spacer"></div>

        <div class="scroller">
            <!-- HEADING -->
            <div class="heading">
                <div class="container-fluid">
                    <!-- getCategory here -->
                    <a class="heading-category" href="Search?cat_id=<%=news.getCat_id()%>"><%= cat_name.get(news.getCat_id()).getName() %></a>
                    <!-- getTitle here -->
                    <h1 class="heading-title"> <%= news.getTitle() %> </h1>
                </div>
            </div>
            <!-- SUB-HEADING -->
            <div class="sub-heading">
                <div class="container-fluid">
                    <div class="col-md-7 nopadding">
                        <!-- getSubtitle here -->
                        <h4 class="sub-heading-text"><%= news.getSubtitle() %></h4>
                        <div class="author">
                            <a class="author-info" href="publicUserInfo?user_id=<%= news.getUser_id()%>">
                                <!-- Author image here -->
                                <img class="author-image rounded-circle" src="<%= session.getAttribute("location") %><%= news.getImage() %>.webp" alt="">
                                <p class="author-name nopadding">By <span><%= user_nameList.get(news.getUser_id()).getName() %></span></p>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- NEWS CONTENT -->
            <div class="news-content">
                <div class="container-fluid">
                    <div class="col-md-7 nopadding">
                        <div class="news-content-image">
                            <img src="<%= session.getAttribute("location") %><%= news.getImage() %>.webp" alt="">
                        </div>
                        <!-- getText here -->
                        <div class="news-content-text">
                            <p><%= news.getContent()%> </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

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