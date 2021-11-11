<%-- 
    Document   : header
    Created on : Sep 17, 2021, 11:14:38 PM
    Author     : USER
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Header </title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/startbootstrap-sb-admin-2/4.0.5/css/sb-admin-2.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
        <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
        <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
        <link rel="stylesheet" href="assets/fonts/fontawesome5-overrides.min.css">
        <link rel="stylesheet" href="assets/css/icon-star-empty.css">
        <link rel="stylesheet" href="assets/css/Pages-Navbar.css">
        <link rel="stylesheet" href="assets/css/Search-Input-responsive.css">
        <style>
            .dropdown:hover>.dropdown-menu {
                display: block;
            }

            .dropdown>.dropdown-toggle:active {
                /*Without this, clicking will make it sticky*/
                pointer-events: none;
            }
        </style>
    </head>

    <body id="page-top" style="border-color: rgba(19,31,36,0.91);">
        <div class="fluid-container" style="padding: 0px;">
            <c:if test="${account!=null}">
                <nav class="navbar navbar-light navbar-expand-md sticky-top navigation-clean white-links" style="background: rgb(82,58,133); color: white;">
                    <div class="container"><a class="navbar-brand" id="company-name" href="index.jsp">Ezquiz</a><button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1" onclick="SetNavBackground();"><span class="sr-only">Toggle navigation</span><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24" fill="none" style="color: white;font-size: 30px;">
                            <path d="M2 6C2 5.44772 2.44772 5 3 5H21C21.5523 5 22 5.44772 22 6C22 6.55228 21.5523 7 21 7H3C2.44772 7 2 6.55228 2 6Z" fill="currentColor"></path>
                            <path d="M2 12.0322C2 11.4799 2.44772 11.0322 3 11.0322H21C21.5523 11.0322 22 11.4799 22 12.0322C22 12.5845 21.5523 13.0322 21 13.0322H3C2.44772 13.0322 2 12.5845 2 12.0322Z" fill="currentColor"></path>
                            <path d="M3 17.0645C2.44772 17.0645 2 17.5122 2 18.0645C2 18.6167 2.44772 19.0645 3 19.0645H21C21.5523 19.0645 22 18.6167 22 18.0645C22 17.5122 21.5523 17.0645 21 17.0645H3Z" fill="currentColor"></path>
                            </svg></button>
                        <div class="collapse navbar-collapse" id="navcol-1">
                            <form action="SubjectListServlet" class="float-left float-md-right mr-auto mt-5 mt-md-0 search-area">
                                <div class="float-left float-md-right mr-auto mt-5 mt-md-0 search-area">
                                    <button class="fas fa-search float-left search-icon" style="background: transparent; border: 0px;"></button>
                                    <input class="float-left float-sm-right custom-search-input" type="search" name="s" placeholder="Type to filter by address">
                                </div>
                            </form>
                            <ul class="navbar-nav">
                                <li class="nav-item"></li>
                                <li class="nav-item"></li>
                                <li class="nav-item"></li>
                                <li class="nav-item"><a class="btn btn-info move-left-xs-sm-md mr-md-3 mb-3 mb-md-0" role="button" href="creator">Create</a></li>
                                <li class="nav-item"></li>
                                <li class="nav-item dropdown"><a class="dropdown-toggle nav-link" aria-expanded="false" data-toggle="dropdown" href="#">My Subject</a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="#" style="color: rgb(0,0,0);">First Item</a>
                                        <a class="dropdown-item" href="subscribeList" style="color: rgb(0,0,0);">Second Item</a>
                                        <a class="dropdown-item" href="#" style="color: rgb(0,0,0);">Third Item</a></div>
                                </li>
                                <li class="nav-item dropdown"><a class="dropdown-toggle nav-link" aria-expanded="false" data-toggle="dropdown" href="#">List Subject</a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="SubjectListServlet?c=0&u=&sort=0&s=" style="color: rgb(0,0,0);">All Subject</a>
                                        <a class="dropdown-item" href="ListDoingServlet?u=${account.username}&c=0&sort=0&sub=1&d=0" style="color: rgb(0,0,0);">Subscribe List</a>
                                        <a class="dropdown-item" href="ListDoingServlet?u=${account.username}&c=0&sort=0&sub=0&d=1" style="color: rgb(0,0,0);">Doing List</a>
                                        <a class="dropdown-item" href="YourOwnSubject?u=${account.username}&c=0&sort=0&sub=0&s=" style="color: rgb(0,0,0);">My Own Subject</a></div>
                                </li>
                                <li class="nav-item dropdown"><a class="dropdown-toggle nav-link" aria-expanded="false" data-toggle="dropdown" href="#">Hello ${account.name}</a>
                                    <div class="dropdown-menu"><a class="dropdown-item" href="UserProfile.jsp" style="color: rgb(0,0,0);">Profile</a>
                                        <a class="dropdown-item" href="#" style="color: rgb(0,0,0);">Second Item</a>
                                        <a class="dropdown-item" href="logout" style="color: rgb(0,0,0);">Log_out</a></div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </c:if>
            <c:if test="${admin!=null}">
                <nav class="navbar navbar-light navbar-expand-md sticky-top navigation-clean white-links" style="background: rgb(82,58,133); color: white;">
                    <div class="container"><a class="navbar-brand" id="company-name" href="index.jsp">EZquiz</a><button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1" onclick="SetNavBackground();"><span class="sr-only">Toggle navigation</span><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24" fill="none" style="color: white;font-size: 30px;">
                            <path d="M2 6C2 5.44772 2.44772 5 3 5H21C21.5523 5 22 5.44772 22 6C22 6.55228 21.5523 7 21 7H3C2.44772 7 2 6.55228 2 6Z" fill="currentColor"></path>
                            <path d="M2 12.0322C2 11.4799 2.44772 11.0322 3 11.0322H21C21.5523 11.0322 22 11.4799 22 12.0322C22 12.5845 21.5523 13.0322 21 13.0322H3C2.44772 13.0322 2 12.5845 2 12.0322Z" fill="currentColor"></path>
                            <path d="M3 17.0645C2.44772 17.0645 2 17.5122 2 18.0645C2 18.6167 2.44772 19.0645 3 19.0645H21C21.5523 19.0645 22 18.6167 22 18.0645C22 17.5122 21.5523 17.0645 21 17.0645H3Z" fill="currentColor"></path>
                            </svg></button>
                        <div class="collapse navbar-collapse" id="navcol-1">
                            <form action="SubjectListServlet" class="float-left float-md-right mr-auto mt-5 mt-md-0 search-area">
                                <div class="float-left float-md-right mr-auto mt-5 mt-md-0 search-area">
                                    <button class="fas fa-search float-left search-icon" style="background: transparent; border: 0px;"></button>
                                    <input class="float-left float-sm-right custom-search-input" type="search" name="s" placeholder="Type to filter by address">
                                </div>
                            </form>
                            <ul class="navbar-nav">
                                <li class="nav-item"></li>
                                <li class="nav-item"></li>
                                <li class="nav-item"></li>
                                <li class="nav-item"><a class="btn btn-info move-left-xs-sm-md mr-md-3 mb-3 mb-md-0" role="button" href="creator">Create</a></li>
                                <li class="nav-item"></li>
                                <li class="nav-item dropdown"><a class="dropdown-toggle nav-link" aria-expanded="false" data-toggle="dropdown" href="#">List Subject</a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="SubjectListServlet?c=0&u=&sort=0&s=" style="color: rgb(0,0,0);">All Subject</a>
                                        <a class="dropdown-item" href="ListDoingServlet?u=${admin.username}&c=0&sort=0&sub=1&d=0" style="color: rgb(0,0,0);">Subscribe List</a>
                                        <a class="dropdown-item" href="ListDoingServlet?u=${admin.username}&c=0&sort=0&sub=0&d=1" style="color: rgb(0,0,0);">Doing List</a>
                                        <a class="dropdown-item" href="YourOwnSubject?u=${admin.username}&c=0&sort=0&sub=0&s=" style="color: rgb(0,0,0);">My Own Subject</a>
                                    </div>
                                </li>

                                <li class="nav-item dropdown"><a class="dropdown-toggle nav-link" aria-expanded="false" data-toggle="dropdown" href="#">Hello ${admin.name}</a>
                                    <div class="dropdown-menu"><a class="dropdown-item" href="AdminDashboard.jsp" style="color: rgb(0,0,0);">Dashboard</a>
                                        <a class="dropdown-item" href="#" style="color: rgb(0,0,0);">Second Item</a>
                                        <a class="dropdown-item" href="logout" style="color: rgb(0,0,0);">Log_out</a></div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </c:if>
            <c:if test="${account==null && admin==null}">
                <div id="wrapper">
                    <div class="d-flex flex-column" id="content-wrapper">
                        <div id="content"></div>
                    </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
                </div>
                <div class="container-fluid" style="padding: 0px;">
                    <nav class="navbar navbar-light navbar-expand-md sticky-top navigation-clean white-links" style="background:rgb(82,58,133);color: white;">
                        <div class="container"><a class="navbar-brand" id="company-name" href="index.jsp">EZquiz</a><button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1" onclick="SetNavBackground();"><span class="sr-only">Toggle navigation</span><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24" fill="none" style="color: white;font-size: 30px;">
                                <path d="M2 6C2 5.44772 2.44772 5 3 5H21C21.5523 5 22 5.44772 22 6C22 6.55228 21.5523 7 21 7H3C2.44772 7 2 6.55228 2 6Z" fill="currentColor"></path>
                                <path d="M2 12.0322C2 11.4799 2.44772 11.0322 3 11.0322H21C21.5523 11.0322 22 11.4799 22 12.0322C22 12.5845 21.5523 13.0322 21 13.0322H3C2.44772 13.0322 2 12.5845 2 12.0322Z" fill="currentColor"></path>
                                <path d="M3 17.0645C2.44772 17.0645 2 17.5122 2 18.0645C2 18.6167 2.44772 19.0645 3 19.0645H21C21.5523 19.0645 22 18.6167 22 18.0645C22 17.5122 21.5523 17.0645 21 17.0645H3Z" fill="currentColor"></path>
                                </svg></button>
                            <div class="collapse navbar-collapse" id="navcol-1">
                                <form action="SubjectListServlet" class="float-left float-md-right mr-auto mt-5 mt-md-0 search-area">
                                    <div class="float-left float-md-right mr-auto mt-5 mt-md-0 search-area">
                                        <input type="hidden" value="0" name="c" />
                                        <input type="hidden" value="0" name="sort" />
                                        <input type="hidden" value="" name="username" />
                                        <input class="float-left float-sm-right custom-search-input" type="search" name="s" placeholder="Type to filter by address">
                                        <button class="fas fa-search float-left search-icon" style="background: transparent; border: 0px;"></button>
                                    </div>
                                </form>
                                <ul class="navbar-nav col-sm-12 col-md-4">
                                    <li class="nav-item dropdown"><a class="dropdown-toggle nav-link" aria-expanded="false" data-toggle="dropdown" href="#">List Subject</a>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item" href="SubjectListServlet?c=0&u=&sort=0&s=" style="color: rgb(0,0,0);">All Subject</a>
                                        </div>
                                    </li>
                                    <li class="nav-item"><a class="btn btn-info move-left-xs-sm-md mr-md-2 mb-2 mb-md-0" role="button" href="login.jsp">Login</a></li>
                                    <li class="nav-item"><a class="btn btn-success move-left-xs-sm-md" role="button" href="signup.jsp">Sign Up</a></li>
                                </ul>
                            </div>
                        </div>
                    </nav>
                </div>
            </c:if>

        </div>
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/bs-init.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
        <script src="assets/js/theme.js"></script>
    </body>

</html>