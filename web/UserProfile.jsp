<%-- 
    Document   : contact
    Created on : Jun 6, 2021, 7:37:42 PM
    Author     : laptop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Profile</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/startbootstrap-sb-admin-2/4.0.5/css/sb-admin-2.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
        <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
        <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
        <link rel="stylesheet" href="assets/fonts/fontawesome5-overrides.min.css">
        <link rel="stylesheet" href="assets/css/icon-star-empty.css">
        <script>
            function check() {
                var password = document.getElementById("password").value;
                var oldpass = document.getElementById("oldpass").value;
                var newpass = document.getElementById("newpass").value;
                var confirm = document.getElementById("confirm").value;
                if (oldpass == password) {
                    if (newpass == confirm) {
                        alert("Password will be changed");
                        return true;
                    } else {
                        alert("Confirm password not match! Change will not be changed");
                        return false;
                    }
                } else {
                    alert("Wrong password! Change will not be changed");
                    return false;
                }
            }
        </script>
        <jsp:include page="header.jsp"/>
    </head>

    <body id="page-top" >

        <div id="wrapper" style="padding-top: 40px">
            <div class="d-flex flex-column" id="content-wrapper">
                <div id="content">
                    <div class="container-fluid">
                        <h3 class="text-dark mb-4">Profile</h3>
                        <div class="row mb-3">
                            <div class="col-lg-4">
                                <div class="card mb-3">
                                    <div class="card-body text-center shadow"><img class="rounded-circle mb-3 mt-4" src="assets/img/dogs/image2.jpeg" width="160" height="160">
                                        <div class="mb-3"><button class="btn btn-primary btn-sm" type="button">Change Photo</button></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-8">
                                <div class="row mb-3 d-none">
                                    <div class="col">
                                        <div class="card text-white bg-primary shadow">
                                            <div class="card-body">
                                                <div class="row mb-2">
                                                    <div class="col">
                                                        <p class="m-0">Peformance</p>
                                                        <p class="m-0"><strong>65.2%</strong></p>
                                                    </div>
                                                    <div class="col-auto"><i class="fas fa-rocket fa-2x"></i></div>
                                                </div>
                                                <p class="text-white-50 small m-0"><i class="fas fa-arrow-up"></i>&nbsp;5% since last month</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="card shadow mb-3">
                                            <div class="card-header py-3">
                                                <p class="text-primary m-0 font-weight-bold">User Settings</p>
                                            </div>
                                            <div class="card-body">
                                                <form action="AccountServlet" method="post">
                                                    <div class="form-row">
                                                        <div class="col">
                                                            <div class="form-group"><label for="name"><strong>Name</strong><br></label><input class="form-control" type="text" id="username" name="name" value="${admin!=null?admin.name:account.name}" ></div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-group"><label for="email"><strong>Email Address</strong></label><input class="form-control" type="email" id="email" name="email" value="${admin!=null?admin.email:account.email}"></div>
                                                        </div>
                                                    </div>
                                                    <div class="form-row">
                                                        <div class="col">
                                                            <div class="form-group"><label for="first_name"><strong>Age</strong><br></label><input class="form-control" type="text" id="first_name" name="age" value="${admin!=null?admin.age:account.age}"></div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-group"><label for="last_name"><strong>Phone</strong><br></label><input class="form-control" type="text" id="last_name" name="phone" value="${admin!=null?admin.phone:account.phone}"></div>
                                                        </div>
                                                    </div>
                                                    <div class="form-row">
                                                        <div class="col">
                                                            <div class="form-group"><label for="username"><strong>Username</strong><br></label><input class="form-control" type="text" id="username" name="username" value="${admin!=null?admin.username:account.username}" readonly></div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-group"><label for="email"><strong>Password</strong></label><input class="form-control" type="password" id="password" name="pass" value="${admin!=null?admin.password:account.password}" readonly></div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group d-none"><label for="username"><strong>Username</strong><br></label><input class="form-control" type="text" id="username" name="admin" value="${admin!=null?admin.admin:account.admin}" readonly></div>
                                                    <div class="form-group"><input class="btn btn-primary btn-sm" type="submit" value="Save Settings" /></div>
                                                </form>
                                            </div>
                                        </div>
                                        <div class="card shadow">
                                            <div class="card-header py-3">
                                                <p class="text-primary m-0 font-weight-bold">Change password</p>
                                            </div>
                                            <div class="card-body">
                                                <form action="changePass" method="post"> 
                                                    <div class="form-group"><label for="address"><strong>Old password</strong></label><input class="form-control" type="password" id="oldpass" name="oldpass"  required></div>
                                                    <div class="form-row">
                                                        <div class="col">
                                                            <div class="form-group"><label for="city"><strong>New password</strong><br></label><input class="form-control" type="password" id="newpass" name="newpass" required></div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-group"><label for="country"><strong>Confirm password</strong></label><input class="form-control" type="password" id="confirm" name="confirm" required></div>
                                                        </div>
                                                    </div>
                                                    ${mess}
                                                    <div class="form-group"><input class="btn btn-primary btn-sm" type="submit" value="Change password" /></div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card shadow mb-5"></div>
                    </div>
                </div>

                <jsp:include page="footer.jsp"/>
            </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>         
        </div>
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/bs-init.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
        <script src="assets/js/theme.js"></script>
    </body>

</html>