<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Responsive Login, Registration & Forgot Form</title>
        <!-- Bootstrap 4 CSS CDN -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.min.css" />
        <!-- Fontawesome CSS CDN -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" />
        <link rel="stylesheet" href="css/style.css" />
    </head>
    <body class="bg-info">
        <div class="container">
<!--             Registration Form Start -->
            <div class="row justify-content-center wrapper" id="register-box" style="display: none;">
                <div class="col-lg-10 my-auto myShadow">
                    <div class="row">
                        <div class="col-lg-5 d-flex flex-column justify-content-center myColor p-4">
                            <h1 class="text-center font-weight-bold text-white">Welcome Back!</h1>
                            <hr class="my-4 bg-light myHr" />
                            <p class="text-center font-weight-bolder text-light lead">To keep connected with us please login with your personal info.</p>
                            <a href="login" class="btn btn-outline-light btn-lg font-weight-bolder mt-4 align-self-center myLinkBtn" id="login-link">Sign In</a>
                        </div>
                        <div class="col-lg-7 bg-white p-4">
                            <h1 class="text-center font-weight-bold text-primary">Create Account</h1>
                            <hr class="my-3" />
                            <form action="signup" method="post" class="px-3" id="register-form">
                                <div class="input-group input-group-lg form-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text rounded-0"><i class="far fa-user fa-lg fa-fw"></i></span>
                                    </div>
                                    <input type="text" name="newuser" id="username" class="form-control rounded-0" placeholder="User Name" required />
                                </div>
                                <p class="text-danger">${mess1}</p>
                                <div class="input-group input-group-lg form-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text rounded-0"><i class="far fa-envelope fa-lg fa-fw"></i></span>
                                    </div>
                                    <input type="email" id="newEmail" name="newemail" class="form-control rounded-0" placeholder="E-Mail" required />
                                </div>
                                <div class="input-group input-group-lg form-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text rounded-0"><i class="fa fa-phone fa-lg fa-fw"></i></span>
                                    </div>
                                    <input type="text" id="newPhone" pattern="[0-9]{9,10}" name="newphone" class="form-control rounded-0" placeholder="Phone" required />
                                </div>
                                <div class="input-group input-group-lg form-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text rounded-0"><i class="fa fa-birthday-cake fa-lg fa-fw"></i></span>
                                    </div>
                                    <input type="text" id="newAge" name="newage" class="form-control rounded-0" placeholder="Age" required />
                                </div>
                                <div class="input-group input-group-lg form-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text rounded-0"><i class="fa fa-id-badge fa-lg fa-fw"></i></span>
                                    </div>
                                    <input type="text" id="newName" name="newname" class="form-control rounded-0" placeholder="Name" required />
                                </div>
                                <div class="input-group input-group-lg form-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text rounded-0"><i class="fas fa-key fa-lg fa-fw"></i></span>
                                    </div>
                                    <input type="password" name="newpass" id="password"  class="form-control rounded-0"  placeholder="Password" required />
                                </div>
                                <p class="text-danger">${mess2}</p>
                                <div class="input-group input-group-lg form-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text rounded-0"><i class="fas fa-key fa-lg fa-fw"></i></span>
                                    </div>
                                    <input type="password" name="repass" id="confirm-password" class="form-control rounded-0"  placeholder="Confirm Password" required />
                                </div>
                                <p class="text-danger">${mess3}</p>
                              
                                <div class="form-group">
                                    <input type="submit" id="register-btn" value="Sign Up" class="btn btn-primary btn-lg btn-block myBtn" />
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Registration Form End -->
            ${alert}
        </div>
        <!-- jQuery CDN -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="js/script.js"></script>
    </body>