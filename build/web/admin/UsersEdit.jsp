<%-- 
    Document   : UsersEdit
    Created on : Sep 18, 2021, 8:05:57 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:useBean id="p" class="dal.UsersDAO" scope="request"></jsp:useBean>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <title>Edit</title>
    </head>
    <body>
        <form class="container" action="UsersEdit?username=${param.username}" method="post">
            <h3>Edit User's Information</h3>
            <div class="form-group">
                <label>Username</label>
                <input type="text" class="form-control" name="username" value="${p.getUsername(param.username).username}" readonly>
            </div>
            <div class="form-group">
                <input type="password" style="display: none;" class="form-control" id="oldpass" value="${p.getUsername(param.username).password}">
            </div>
            <div class="form-group">
                <label>Password</label>
                <input type="password" class="form-control" name="password" value="${p.getUsername(param.username).password}">
            </div>
            <div class="form-group">
                <label>Email:</label>
                <input type="email" class="form-control" name="email" value="${p.getUsername(param.username).email}">
            </div>
            <div class="form-group">
                <label>Name</label>
                <input type="text" class="form-control" name="name" value="${p.getUsername(param.username).name}">
            </div>
            <div class="form-group">
                <label>Age</label>
                <input type="text" class="form-control" name="age" value="${p.getUsername(param.username).age}">
            </div>
            <div class="form-group">
                <label>Phone</label>
                <input type="text" class="form-control" name="phone" value="${p.getUsername(param.username).phone}">
            </div>
            <input type="submit" class="btn btn-primary" value="Save"/>
        </form>
    </body>
</html>
