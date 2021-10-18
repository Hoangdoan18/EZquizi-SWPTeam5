<%-- 
    Document   : SubjectCreator
    Created on : Oct 17, 2021, 1:34:12 PM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <jsp:useBean id="p" class="dal.CategoryDAO" scope="request"></jsp:useBean>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
            <title>New Subject</title>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/startbootstrap-sb-admin-2/4.0.5/css/sb-admin-2.min.css">
            <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
            <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
            <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
            <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
            <link rel="stylesheet" href="assets/fonts/fontawesome5-overrides.min.css">
            <link rel="stylesheet" href="assets/css/Dark-NavBar-1.css">
            <link rel="stylesheet" href="assets/css/Dark-NavBar-2.css">
            <link rel="stylesheet" href="assets/css/Dark-NavBar.css">
            <link rel="stylesheet" href="assets/css/icon-star-empty.css">
            <link rel="stylesheet" href="assets/css/Pages-Navbar.css">
            <link rel="stylesheet" href="assets/css/Search-Input-responsive.css">
            <script>
                function goBack() {
                    window.history.back();
                }
            </script>
        </head>

        <body style="border-style: none;">
        <jsp:include page="header.jsp"/>
        <div class="container">
            <div>
                <h1 style="color: var(--purple);font-weight: bold;font-size: 60px;">Create a new subject</h1>
            </div>
            <div><c:if test="${admin != null}">
                    <form action="creator?username=${admin.username}" method="post">
                        <div class="form-row" style="border-style: none;">
                            <div class="col-xl-10 offset-xl-0" style="border-style: none;">
                                <div class="form-group"><label style="font-size: 30px;">Subject Title</label><input class="form-control" name="subjectTitle" type="text" placeholder="Enter a title" required=""></div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-xl-5">
                                <div class="form-group"><label style="font-size: 30px;">Level</label><select class="form-control" name="cateID" required="">
                                        <option value="" selected>Select Level</option>
                                        <c:forEach items="${listC}" var="o">
                                            <option value="${o.cateID}">${o.cateName}</option>
                                        </c:forEach>
                                    </select></div>
                            </div>
                            <div class="col-xl-3 text-center align-self-center" style="margin-top: 25px;"><button class="btn btn-secondary" type="submit" value="submit" style="background: var(--purple);width: 160px;height: 50px;font-family: Nunito, sans-serif;font-size: 25px;">Create</button></div>
                            <div class="col-xl-2 text-center align-self-center" style="margin-top: 25px;"><a class="btn btn-danger" href="" role="button" onclick="goBack()" style="background: var(--pink);width: 140px;height: 50px;font-size: 25px;">Cancel</a></div>
                        </div>
                    </form>
                </c:if>   
                <c:if test="${account != null}">
                    <form action="creator?username=${account.username}" method="post">
                        <div class="form-row" style="border-style: none;">
                            <div class="col-xl-10 offset-xl-0" style="border-style: none;">
                                <div class="form-group"><label style="font-size: 30px;">Subject Title</label><input class="form-control" name="subjectTitle" type="text" placeholder="Enter a title" required=""></div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-xl-5">
                                <div class="form-group"><label style="font-size: 30px;">Level</label><select class="form-control" name="cateID" required="">
                                        <option value="" selected>Select Level</option>
                                        <c:forEach items="${listC}" var="o">
                                            <option value="${o.cateID}">${o.cateName}</option>
                                        </c:forEach>
                                    </select></div>
                            </div>
                            <div class="col-xl-3 text-center align-self-center" style="margin-top: 25px;"><button class="btn btn-secondary" type="submit" value="submit" style="background: var(--purple);width: 160px;height: 50px;font-family: Nunito, sans-serif;font-size: 25px;">Create</button></div>
                            <div class="col-xl-2 text-center align-self-center" style="margin-top: 25px;"><a class="btn btn-danger" href="" role="button" onclick="goBack()" style="background: var(--pink);width: 140px;height: 50px;font-size: 25px;">Cancel</a></div>
                        </div>
                    </form>
                </c:if>


            </div>
        </div>
        <jsp:include page="footer.jsp"/>
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/bs-init.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
        <script src="assets/js/theme.js"></script>
    </body>

</html>
