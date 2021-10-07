<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Change Password Form</title>
        <!-- Bootstrap 4 CSS CDN -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.min.css" />
        <!-- Fontawesome CSS CDN -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" />
        <link rel="stylesheet" href="css/style.css" />
    </head>
    <body class="bg-info">
        <div class="container">
            <!-- Login Form Start -->
            <div class="row justify-content-center wrapper" id="changepw-form-box">
                <div class="col-lg-10 my-auto myShadow">
                    <div class="row">
                        <div class="col-lg-7 bg-white p-4">
                            <form action="ResetPasswordServlet?username=<%= request.getParameter("username")%>" method="post" class="px-3" id="changepw-form">
                                <div class="input-group input-group-lg form-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text rounded-0"><i class="fas fa-key fa-lg fa-fw"></i></span>
                                    </div>
                                    <input type="password" name="newpass" id="password"  class="form-control rounded-0"  placeholder="Your New Password" required />
                                </div>
                                <div class="input-group input-group-lg form-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text rounded-0"><i class="fas fa-key fa-lg fa-fw"></i></span>
                                    </div>
                                    <input type="password" name="newpass2" id="confirm-password" class="form-control rounded-0"  placeholder="Confirm Password" required />
                                </div>
                                <p class="text-danger">${mess4}</p>
                                <div class="form-group">
                                    <input type="submit" id="login-btn" value="Reset Your Password" class="btn btn-primary btn-lg btn-block myBtn" />
                                </div>
                            </form>
                        </div>
                        <div class="col-lg-5 d-flex flex-column justify-content-center myColor p-4">
                            <p class="text-center font-weight-bolder text-light lead">Enter your new password here to continue your study!</p>
                        </div>
                    </div>
                </div>
            </div>
        </body>