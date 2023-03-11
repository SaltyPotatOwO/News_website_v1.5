
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
        <!-- Embed category CSS -->
        <link rel="stylesheet" href="css/styleCategory.css">
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
        <%
            ArrayList<News> news_list = (ArrayList<News>) request.getAttribute("listNews");
            HashMap<Integer,User> user_nameList = (HashMap<Integer,User>) request.getAttribute("user_list");
        %>
        <!-- HEADING -->
        <div class="text-center">
            <h1><%= cat_name.get(news_list.get(0).getCat_id()).getName() %></h1>
        </div>
        <div class="text-center" style="font-weight: normal">
            <h2><%= cat_name.get(news_list.get(0).getCat_id()).getDes() %></h2>
        </div>
        <%             
            for (int idx = 0; idx < news_list.size(); idx++) {
        %>
        <!-- MAIN-CONTENT -->
        <div class="container-fluid">
            <!-- 4 rows of news -->
            <div class="row nopadding">
                <div class="card col-md-4 nopadding">
                    <img src="<%= session.getAttribute("location") %><%= news_list.get(idx).getImage() %>.webp" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h3 class="card-title"><%= news_list.get(idx).getTitle()%></h3>
                        <p class="card-text"><%= news_list.get(idx).getSubtitle()%></p>
                        <h6 class="card-text"><%= user_nameList.get(news_list.get(idx).getUser_id()).getName() %></h6>
                    </div>
                </div>
                <%}%>
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