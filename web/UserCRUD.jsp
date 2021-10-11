<%-- 
    Document   : UsersCRUD
    Created on : Sep 17, 2021, 6:14:14 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Management</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-responsive">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-10 text-center">
                                <h2>Users Managements</h2>
                            </div>
                            <div class="col-sm-2 text-center">
                                <a href="UsersAdd.jsp" class="btn btn-success" ><i class="material-icons">&#xE147;</i> <span>Thêm</span></a>						
                            </div>
                        </div>
                    </div>
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <c:forEach begin="1" end="${requestScope.num}" var="i">
                                <li class="page-item"><a class="page-link ${requestScope.page==i?"active":""}" href="/admin/UsersCRUD?page=${i}">${i}</a></li>
                                </c:forEach>
                        </ul>
                    </nav>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">Username</th>
                                <th scope="col">Email</th>
                                <th scope="col">Name</th>
                                <th scope="col">Age</th>
                                <th scope="col">Phone</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listU}" var="o" varStatus="i">
                                <tr>
                                    <td>${o.username}</td>
                                    <td>${o.email}</td>
                                    <td>${o.name}</td>
                                    <td>${o.age}</td>
                                    <td>${o.phone}</td>
                                    <td>
                                        <a href="/admin/UsersEdit.jsp?username=${o.username}">
                                            <button type="button" class="btn btn-primary">Edit</button>
                                        </a>

                                        <a href="/admin/UsersDelete?username=${o.username}" onclick="return confirm('Are you sure you want to delete this item?')">
                                            <button type="button" class="btn btn-danger">Delete</button>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <c:forEach begin="1" end="${requestScope.num}" var="i">
                                <li class="page-item"><a class="page-link ${requestScope.page==i?"active":""}" href="/admin/UsersCRUD?page=${i}">${i}</a></li>
                                </c:forEach>
                        </ul>
                    </nav>  
                </div>
            </div>
        </div>        
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    </body>
</html>

