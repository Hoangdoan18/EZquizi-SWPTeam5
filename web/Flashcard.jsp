<%-- 
    Document   : Flashcard
    Created on : Oct 31, 2021, 4:28:15 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Flashcard</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/startbootstrap-sb-admin-2/4.0.5/css/sb-admin-2.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Alata&amp;display=swap">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700&amp;display=swap">
        <link rel="stylesheet" href="assets/css/Dark-NavBar-1.css">
        <link rel="stylesheet" href="assets/css/Dark-NavBar-2.css">
        <link rel="stylesheet" href="assets/css/Dark-NavBar.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/css/swiper.min.css">
        <link rel="stylesheet" href="assets/css/icon-star-empty.css">
        <link rel="stylesheet" href="assets/css/Pages-Navbar.css">
        <link rel="stylesheet" href="assets/css/Search-Input-responsive.css">
        <link rel="stylesheet" href="assets/css/Simple-Slider.css">
        <script>
            function swap() {
                var x = document.getElementById("term");
                var y = document.getElementById("definition");
                if (x.style.display === "none") {
                    x.style.display = "block";
                    y.style.display = "none"
                } else {
                    x.style.display = "none";
                    y.style.display = "block";
                }
            }
        </script>
    </head>

    <body id="page-top" style="color: var(--purple);">
        <jsp:include page="header.jsp"/>
        <div class="container" style="margin-top: 20px;">
            <div class="row" style="height: 730px;">
                <div class="col-xl-3 text-center" style="background: var(--light);border-width: 3px;border-style: dashed;border-radius: 20px;height: 730px;"><a class="btn btn-primary text-left" role="button" style="font-size: 25px;width: 250px;height: 50px;margin-top: 10px;text-align: center;background: var(--purple);color: var(--white);border-radius: 10px;border-style: dashed;font-weight: bold;" href="SubjectDetail?subjectID=${requestScope.subjectID}&termsort=0">&lt; Back</a>
                    <div class="d-xl-flex justify-content-xl-center align-items-xl-center" style="height: 500px;">
                        <p class="text-center" style="font-size: 60px;color: var(--purple);text-align: left;font-family: Alata, sans-serif;font-weight: bold;">Flashcard</p>
                    </div>
                    <div style="height: 100px;">
                        <div class="progress" style="height: 40px;">
                            <div class="progress-bar" aria-valuenow="${(requestScope.page)/(requestScope.num)*100}" aria-valuemin="0" aria-valuemax="100" style="width: ${(requestScope.page)/(requestScope.num)*100}%;">${(requestScope.page)/(requestScope.num)*100}%</div>
                        </div>
                        <p class="d-xl-flex justify-content-xl-start" style="font-size: 30px;color: var(--primary);text-align: left;font-family: Alata, sans-serif;height: 40px;">Progress: ${requestScope.page}/${requestScope.num}</p>
                    </div>
                    <div class="row text-center">
                        <div class="col-xl-12 btn-group dropup">
                            <div class="dropdown"><button class="btn btn-primary dropdown-toggle" aria-expanded="false" data-toggle="dropdown" type="button" style="background: var(--light);color: var(--purple);width: 120px;font-size: 15px;border: 2px solid var(--indigo);font-weight: bold;">Display by</button>
                                <div class="dropdown-menu" style="width: 120px;min-width: 120px;">
                                    <a class="dropdown-item" href="flashcard?subjectID=${requestScope.subjectID}&page=${requestScope.page}&display=term" style="color: var(--blue);width: 120px;">Term</a>
                                    <a class="dropdown-item" href="flashcard?subjectID=${requestScope.subjectID}&page=${requestScope.page}&display=definition" style="color: var(--blue);width: 120px;">Definition</a>
                                </div>
                            </div>
                        </div>
                        <!--                        <div class="col-xl-6">
                                                    <div class="dropdown show"><button class="btn btn-primary dropdown-toggle" aria-expanded="true" data-toggle="dropdown" type="button" style="background: var(--light);color: var(--purple);width: 120px;border: 2px solid var(--indigo);font-weight: bold;min-width: none;">Shuffle</button>
                                                        <div class="dropdown-menu" style="width: 120px;min-width: 120px;">
                                                            <a class="dropdown-item" href="#" style="color: var(--blue);width: 120px;">On</a>
                                                            <a class="dropdown-item" href="#" style="color: var(--blue);width: 120px;">Off</a>
                                                        </div>
                                                    </div>
                                                </div>-->
                    </div>
                </div>
                <div class="col" style="margin-left: 10px;border-width: 1px;border-style: none;">
                    <div style="width: 800px;height: 730px;">
                        <c:forEach items="${listT}" var="o" varStatus="i">
                            <div id="term" class="text-center" style="height: 610px;display: block;cursor: pointer;" onclick="swap()">
                                <h1 class="text-center d-xl-flex flex-grow-0 justify-content-xl-center align-items-xl-center" style="height: 610px;font-size: 50px;font-weight: bold;border-radius: 20px;border-width: 3px;border-style: solid;">
                                    <c:choose>
                                        <c:when test="${requestScope.display=='term'}">
                                            ${o.term}
                                        </c:when>
                                        <c:when test="${requestScope.display=='definition'}">
                                            ${o.definition}
                                        </c:when>
                                    </c:choose>
                                </h1>
                            </div>
                            <div id="definition" class="text-center" style="height: 610px;display: none;" onclick="swap()">
                                <h1 class="text-center d-xl-flex flex-grow-0 justify-content-xl-center align-items-xl-center" style="height: 610px;font-size: 50px;font-weight: bold;border-radius: 20px;border-width: 3px;border-style: solid;">
                                    <c:choose>
                                        <c:when test="${requestScope.display=='term'}">
                                            ${o.definition}
                                        </c:when>
                                        <c:when test="${requestScope.display=='definition'}">
                                            ${o.term}
                                        </c:when>
                                    </c:choose>
                                </h1>
                            </div>
                        </c:forEach>
                        <div class="text-left d-xl-flex justify-content-xl-center align-items-xl-center" style="height: 100px;margin-top: 20px;border-style: dotted;border-radius: 30px;">
                            <nav class="d-xl-flex" style="width: 600;height: 60px;">
                                <ul class="pagination">
                                    <li class="page-item ${(requestScope.page-1)<1?'disabled':''}" style="margin-right: 200px;width: 50px;height: 50px;font-size: 30px;color: var(--indigo);border-color: var(--blue);"><a class="page-link" href="flashcard?subjectID=${requestScope.subjectID}&page=${requestScope.page-1}&display=${requestScope.display}" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
                                    <li class="page-item ${(requestScope.page+1)>requestScope.num?'disabled':''}" style="margin-left: 200px;width: 50px;height: 50px;font-size: 30px;color: var(--indigo);"><a class="page-link" href="flashcard?subjectID=${requestScope.subjectID}&page=${requestScope.page+1}&display=${requestScope.display}" aria-label="Next"><span aria-hidden="true">»</span></a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/Dynamically-Add-Remove-Table-Row.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/js/swiper.jquery.min.js"></script>
        <script src="assets/js/Simple-Slider.js"></script>
        <script src="assets/js/theme.js"></script>
    </body>

</html>
