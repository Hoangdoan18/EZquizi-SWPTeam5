<%-- 
    Document   : AdminLogin
    Created on : Oct 3, 2021, 8:21:39 PM
    Author     : USER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ----------> 
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link href="./css/style2.css" rel="stylesheet" type="text/css"/>
        <title>Admin Login</title>
    </head>
    <body>
        
        <div class="container">  
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <div class="panel panel-login">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-12">
                                    <a href="#" class="active" id="login-form-link">Login</a>                            
                                </div>
                            </div>
                            <hr>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <form id="login-form" action="login" method="post" role="form" style="display: block;">
                                        <div class="form-group">
                                            <input type="text" name="user" id="username" tabindex="1" class="form-control" placeholder="Account" value="${user}">
                                        </div>

                                        <div class="form-group">
                                            <input type="password" name="pass" id="password" tabindex="2" class="form-control" placeholder="Password" value="${pass}">                                 
                                        </div>
                                        <div class="form-group text-center">

                                            <input name="remember" value="1" type="checkbox" class="form-check-input" id="exampleCheck1">
                                            <label class="form-check-label" for="exampleCheck1">Remember Password</label>
                                        </div>

                                        <p class="text-danger">${mess}</p>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Login">
                                                </div>
                                                <div class="col-sm-6">
                                                    <a class="form-control btn btn-register" href="signup">Sign Up</a>
                                                </div>
                                            </div>
                                        </div>                 
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body> 
</html>
