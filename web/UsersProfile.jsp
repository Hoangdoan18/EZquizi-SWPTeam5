<%-- 
    Document   : contact
    Created on : Jun 6, 2021, 7:37:42 PM
    Author     : laptop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style.css">
        <script src="mycode.js"></script>
        <script>
            function check() {
                var confirm = prompt("Enter your old password");
                var oldpass = document.getElementById("oldpass").value;
                if (oldpass == confirm) {
                    alert("Correct password, changes will be saved");
                    return true;
                } else {
                    alert("Wrong password! Change will not be saved");
                    return false;
                }
            }
        </script>
        <title>Profile</title>
    </head>
    <center>
        <body>

            <%@include file="header.jsp" %>


            <form class = "container" action="account" onsubmit="return check()" method="post">
                <h3>Thông tin tài khoản</h3>
                <div class="form-group">
                    <label>Username</label>
                    <input type="text" class="form-control" name="username" 		value="${account.username}" readonly>
                </div>
                <div class="form-group">
                    <input type="password" style="display: none;" class="form-control" id="oldpass" value="${sessionScope}">
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input type="password" class="form-control" name="pass" value="${account.password}">
                </div>
                <div class="form-group">
                    <label>Name </label>
                    <input type="email" class="form-control" name="name" value="${account.name}">
                </div>
                <div class="form-group">
                    <label>Email</label>
                    <input type="email" class="form-control" name="email" value="${account.email}">
                </div>
                <div class="form-group">
                    <label>Age </label>
                    <input type="text" class="form-control" name="address" value="${account.age}">
                </div>
                <div class="form-group">
                    <label>Phone</label>
                    <input type="text" class="form-control" name="phone" value="${account.phone}">
                </div>
                <input type="submit" class="btn btn-primary" value="Save"/>
                <small id="emailHelp" class="form-text text-muted">Thông tin sẽ được bảo mật</small>
            </form>



            <%@include file="footer.jsp" %>

        </body>
    </center>
</html>