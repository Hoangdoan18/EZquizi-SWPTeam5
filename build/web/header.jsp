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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">    
        <div class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <c:if test="${sessionScope.account == null}">
                        <div class="navbar-header">
                            <button class="navbar-toggle" data-target="#mobile_menu" data-toggle="collapse"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                            <a href="#" class="navbar-brand">EzQuizi</a>
                        </div>
                        
                        <div class="navbar-collapse collapse" id="mobile_menu">
                            <ul class="nav navbar-nav">
                                <li class="active"><a href="#">Home</a></li>
                                <li><a href="#" class="dropdown-toggle" data-toggle="dropdown">My Subject <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">About One</a></li>
                                        <li><a href="#">About Two</a></li>
                                        <li><a href="#">About Three</a></li>
                                        
                                    </ul>
                                <li><a href="#">Create</a></li>
                            </ul>
                            <ul class="nav navbar-nav">
                                <li>
                                    <form action="" class="navbar-form">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <input type="search" name="search" id="" placeholder="Search Anything Here..." class="form-control">
                                                <span class="input-group-addon"><span class="glyphicon glyphicon-search"></span></span>
                                            </div>
                                        </div>
                                    </form>
                                </li>
                            </ul>
                                
                            <ul class="nav navbar-nav navbar-right">
                                <!--Login Algorithm-->
                                <!--<li><a href="#"><span class="glyphicon glyphicon-user"></span> Profile</a></li>-->
                                
                                <li><a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-log-in"></span> Login / Sign Up <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="login.jsp">Login</a></li>
                                        <li><a href="signup.jsp">Sign Up</a></li>
                                        <li><a href="AdminLogin.jsp">Admin Login</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        </c:if>
                        <c:if test="${sessionScope.account != null}">
                            <div class="navbar-header">
                            <button class="navbar-toggle" data-target="#mobile_menu" data-toggle="collapse"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                            <a href="#" class="navbar-brand">EzQuizi</a>
                        </div>
                        
                        <div class="navbar-collapse collapse" id="mobile_menu">
                            <ul class="nav navbar-nav">
                                <li class="active"><a href="#">Home</a></li>
                                <li><a href="#" class="dropdown-toggle" data-toggle="dropdown">My Subject <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">About One</a></li>
                                        <li><a href="#">About Two</a></li>
                                        <li><a href="#">About Three</a></li>
                                        
                                    </ul>
                                <li><a href="#">Create</a></li>
                            </ul>
                            <ul class="nav navbar-nav">
                                <li>
                                    <form action="" class="navbar-form">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <input type="search" name="search" id="" placeholder="Search Anything Here..." class="form-control">
                                                <span class="input-group-addon"><span class="glyphicon glyphicon-search"></span></span>
                                            </div>
                                        </div>
                                    </form>
                                </li>
                            </ul>

                            <ul class="nav navbar-nav navbar-right">
                                
                                <li><a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span> Hello ${account.name}<span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="UsersProfile.jsp">User Profile</a></li>
                                        <li><a href="logout">Log_out</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </body>
</html>
