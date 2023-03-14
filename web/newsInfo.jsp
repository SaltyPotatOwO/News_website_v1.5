<%@page import="java.util.*"%>
<%@page import="model.*"%>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>News Info</title>
        <!-- Icons -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <!-- Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
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
                <div class="navbar-logo col-md-1">
                    <a class="navbar-brand" href="#">
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
                        <c:forEach items="<%= cat_name %>" var = "cat_name" begin="1" end="6">
                            <div class="nav-item">
                                <a class="nav-link hover-animation-underline" href="Search?cat_id=<c:out value="${cat_name.key}"/>"  ><c:out value="${cat_name.value.getName()}"/></a>
                            </div>
                        </c:forEach>
                    </ul>
                </div>
                <!-- NAVBAR SEARCH -->
                <div class="col-md-3 navbar-search">
                    <form action="Search">
                        <input style="width: 100%;" type="text" name="title" placeholder="Search anything">
                        <button style="border: 0px;" type="submit" class="rounded-circle nopadding">
                            <i class="material-icons hover-animation-grow">search</i>
                        </button>
                    </form>
                </div>

                <!-- NAVBAR PROFILE -->
                <div class="col-md-2 navbar-login navbar-collapse" id="navbarNavDropdown">
                    <% String user = "user";
                         int ID = 0;
                         if (session.getAttribute("user") != null) {  
                        User user1 = (User)session.getAttribute("user");
                        user = user1.getName();
                        ID = user1.getId();
                        }%>
                    <p class="nopadding">Hello, <%= user %></p>
                    <ul class="navbar-nav">
                        <li class="nav-item dropdown">
                            <a class="dropdown-toggle" href="#" id="navbarDropdownMenuLink" id="navbar-icon-user"
                               role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="material-icons hover-animation-grow">person</i>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownMenuLink">
                                <!-- cái này th?ng nào làm jsp thì phân lo?i theo ki?u ng??i dùng -->
                                <% if (session.getAttribute("user") == null) {  %>
                                <li><a class="dropdown-item" href="login.jsp">Login</a></li>
                                <li><a class="dropdown-item" href="login.jsp">Sign up</a></li>
                                    <%} else{ %>
                                <li><a class="dropdown-item" href="UserLogout">Log out</a></li>
                                <li><a class="dropdown-item" href="Profile?id=<%= ID %>">Profile</a></li>
                                    <%}%>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- spacer for fixed navbar -->
        <div style="height: 84px;" class="spacer"></div>
        <%
            News news = (News) request.getAttribute("news");
            HashMap<Integer, User> user_nameList = (HashMap<Integer, User>) request.getAttribute("user_list");
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
                    <a class="heading-category" href="Search?cat_id=<%=news.getCat_id()%>"><%= cat_name.get(news.getCat_id()).getName()%></a>
                    <!-- getTitle here -->
                    <h1 class="heading-title"> <%= news.getTitle()%> </h1>
                </div>
            </div>
            <!-- SUB-HEADING -->
            <div class="sub-heading">
                <div class="container-fluid">
                    <div class="col-md-7 nopadding">
                        <!-- getSubtitle here -->
                        <h4 class="sub-heading-text"><%= news.getSubtitle()%></h4>
                        <div class="author">
                            <a class="author-info" href="publicUserInfo?user_id=<%= news.getUser_id()%>">
                                <!-- Author image here -->
                                <img class="author-image rounded-circle" src="<%= session.getAttribute("location")%><%= news.getImage()%>.webp" alt="">
                                <p class="author-name nopadding">By <span><%= user_nameList.get(news.getUser_id()).getName()%></span></p>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <c:if test="${( sessionScope.user.isIsAdmin() )}" >
                <form action="DeleteNews" method="post">
                    <input type="hidden" name="news_id" value="<%= news.getNews_id() %>">
                    <input type="submit" value="Delete">
                </form>
            </c:if>
            <!-- NEWS CONTENT -->
            <div class="news-content">
                <div class="container-fluid">
                    <div class="col-md-7 nopadding">
                        <div class="news-content-image">
                            <img src="<%= session.getAttribute("location")%><%= news.getImage()%>.webp" alt="">
                        </div>
                        <!-- getText here -->
                        <div class="news-content-text">
                            <p><%= news.getContent()%> </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- COMMENTS -->
        <c:if test="${sessionScope.user.getId() != null}">
            <form action="InsertComment" method="post">
                <input type="hidden"    name="user_id" value="${sessionScope.user.getId()}" %>
                <input type="hidden" name="news_id" value="<%= news.getNews_id()%>">
                <textarea id="comment" name="comment_content" placeholder="Comment something..." required></textarea>
                <input type="submit" value="Submit">
            </form>    
        </c:if>
        <table border='1px' style='width: 500px; font-size: 20px;' >
            <%
                for (Comments comments : commentList) {
            %>  
            <c:if test="${(requestScope.update_id.getComment_id() == null)}">  
                <tr>
                    <td>
                        User:
                        <a href="publicUserInfo?user_id=<%= comments.getUser_id()%>">
                            <%= user_nameList.get(comments.getUser_id()).getName()%>
                        </a>
                    </td>

                    <td> <%= comments.getCommment_content()%></td>
                    <td>
                        <c:if test="${( sessionScope.user.getId() != comments.getUser_id() or sessionScope.user.isIsAdmin() )}" >
                            <form action="DeleteComment" method="post">
                                <input type="hidden" name="comment_id" value="<%= comments.getComment_id()%>">
                                <input type="hidden" name="news_id" value="<%= news.getNews_id() %>">
                                <input type="submit" value="Delete">
                            </form>
                        </c:if>
                    </td>
                    <td>
                        <c:if test="${( sessionScope.user.getId() != comments.getUser_id())}" >
                            <form action="UpdateComment" method="post">
                                <input type="hidden" name="comment_id" value="<%= comments.getComment_id()%>" %>
                                <input type="hidden" name="news_id" value="<%= news.getNews_id()%>">
                                <input type="submit" name="action" value="UpdateRequest">
                            </form>
                        </c:if>
                    </td>
                </tr>
            </c:if>  
            <%
                }
            %>

        </table>
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