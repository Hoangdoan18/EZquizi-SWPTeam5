<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Login</title>
        <!-- Bootstrap 4 CSS CDN -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.min.css" />
        <!-- Fontawesome CSS CDN -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" />
        <link rel="stylesheet" href="css/style.css" />
    </head>
    <body class="bg-info">
        <div class="container">
            <!-- Login Form Start -->
            <div class="row justify-content-center wrapper" id="login-box">
                <div class="col-lg-10 my-auto myShadow">
                    <div class="row">
                        <div class="col-lg-7 bg-white p-4">
                            <h1 class="text-center font-weight-bold text-primary">Sign in with Account</h1>
                            <hr class="my-3" />
                            <form action="login" method="post" class="px-3" id="login-form">
                                <div class="input-group input-group-lg form-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text rounded-0"><i class="fa fa-user-circle fa-lg fa-fw"></i></span>
                                    </div>
                                    <!--                  <input type="email" id="email" name="email" class="form-control rounded-0" placeholder="E-Mail" required />-->
                                    <input type="text" name="user" id="username" tabindex="1" class="form-control" placeholder="Account" value="${user}">
                                </div>
                                <div class="input-group input-group-lg form-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text rounded-0"><i class="fas fa-key fa-lg fa-fw"></i></span>
                                    </div>
                                    <input type="password" name="pass" id="password" tabindex="2" class="form-control" placeholder="Password" value="${pass}">  
                                </div>
                                 <p class="text-danger">${mess}</p>
                                <div class="form-group clearfix">
                                    <div class="custom-control custom-checkbox float-left">
                                        <input type="checkbox" class="custom-control-input" id="customCheck" name="remember" />
                                        <label class="custom-control-label" for="customCheck">Remember me</label>
                                    </div>
                                    <div class="forgot float-right">
                                        <a href="#" id="forgot-link">Forgot Password?</a>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input type="submit" id="login-btn" value="Sign In" class="btn btn-primary btn-lg btn-block myBtn" />
                                </div>
                            </form>
                        </div>
                        <div class="col-lg-5 d-flex flex-column justify-content-center myColor p-4">
                            <h1 class="text-center font-weight-bold text-white">Hello Students!</h1>
                            <hr class="my-3 bg-light myHr" />
                            <p class="text-center font-weight-bolder text-light lead">Enter your personal details and start your journey with us!</p>
                            <a href="signup" class="btn btn-outline-light btn-lg align-self-center font-weight-bolder mt-4 myLinkBtn" id="register-link">Sign Up</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Forgot Password Form Start -->
            <div class="row justify-content-center wrapper" id="forgot-box" style="display: none;">
                <div class="col-lg-10 my-auto myShadow">
                    <div class="row">
                        <div class="col-lg-7 bg-white p-4">
                            <h1  class="text-center font-weight-bold text-primary">Forgot Your Password?</h1>
                            <hr class="my-3" />
                            <p class="lead text-center text-secondary">To reset your password, enter the registered e-mail address and we will send you password reset instructions on your e-mail!</p>
                            <form action="EmailControl" method="post" class="px-3" id="forgot-form">
                                <div id="forgotAlert"></div>
                                <div class="input-group input-group-lg form-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text rounded-0"><i class="far fa-envelope fa-lg"></i></span>
                                    </div>
                                    <input type="email" id="femail" name="email" class="form-control rounded-0" placeholder="E-Mail" required />
                                </div>
                                <div class="form-group">
                                    <input type="submit" id="forgot-btn" value="Reset Password" class="btn btn-primary btn-lg btn-block myBtn" />
                                </div>
                            </form>
                        </div>
                        <div class="col-lg-5 d-flex flex-column justify-content-center myColor p-4">
                            <h1 class="text-center font-weight-bold text-white">Reset Password!</h1>
                            <hr class="my-4 bg-light myHr" />
                            <button class="btn btn-outline-light btn-lg font-weight-bolder myLinkBtn align-self-center" id="back-link">Back</button>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Forgot Password Form End -->
        </div>
        <!-- jQuery CDN -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="js/script.js"></script>
    </body>