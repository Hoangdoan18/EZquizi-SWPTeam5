<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
Document   : SubjectList
Created on : Sep 29, 2021, 3:12:00 PM
Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>My Own Subject</title>
        <link rel="stylesheet" href="./css/style_Homepage.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/startbootstrap-sb-admin-2/4.0.5/css/sb-admin-2.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    </head>

    <body>
        <!------------------------------->


        <!--        --------------------------- -->
        <jsp:include page="header.jsp" />
        <!--        FORM IMAGE "GETTING STARTED"  -->
        <div class=" col-2 " style="background-color: white ; margin-top: 5%; border: 10px; border-color: #f83600;">
            <div style=" border: 10px; border-color: #f83600; padding: 5px;">
                <div style="font-size: 20">Category</div>
                <c:forEach var="o" items="${ListC}">

                    <li> <a style="border: 3px; margin-right: 40px; font-size: 20px; text-decoration: none; " href="YourOwnSubject?c=${o.cateID}&u=&sort=0&s=${s}"> ${o.cateName} </a></li>

                </c:forEach>
            </div>
        </div>

        <div class="" style="float: right ">
            <div class="dropdown">
                <button class="btn btn-primary dropdown-toggle" style="" type="button" data-toggle="dropdown">Sort by
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                    <li><a href="YourOwnSubject?c=${c}&u=&sort=1&s=${s}">Date</a></li>
                    <li><a href="YourOwnSubject?c=${c}&u=&sort=2&s=${s}">Rating</a></li>
                </ul>
            </div>
        </div>


        <section class="flex-sect">

            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <c:forEach begin="1" end="${requestScope.num}" var="i">
                        <li class="page-item">
                            <a class="page-link ${requestScope.page==i?" active ":" "}" href="YourOwnSubject?page=${i}&c=${c}&u=${u}&s=${s}&sort=${sort}">${i}</a></li>
                        </c:forEach>
                </ul>
            </nav>




            <div class="container">
                <c:forEach items="${listS}" var="o" varStatus="i">

                    <div class="cards col-sm-8 col-lg-4" style="display: inline; float: left;">
                        <!--FORM IMAGE EACH CARD-->
                        <div class="card" style="width: 100%">
                            <div class="card-body">
                                <div class="card-title text-truncate" style="font-size: 35px; margin-bottom: 10px; margin-top: 10px ">
                                    <a href="UserOwnSubjectDetailServlet?subjectID=${o.subjectID}&termsort=0">${o.subjectTitle}</a>
                                </div>

                                <div class="card-title" style="font-size: 30px; position: absolute; bottom:20px; right:10px;">
<!--                                    <a href="#" class="btn btn-primary pull-right"><span>Subscribe</span></a>-->
                                    <!--<button ><a href="#" style="text-decoration: none; border: 1px;">Subscribe</a></button>-->
                                </div>
                                <div class="card-sub-title" style="font-family: LucateIDa Bright; font-weight: bold; color: #008512"> ${o.cateName}
                                </div>
                                <div class="" style="font-size: 20px; margin-bottom: 10px ">
                                    <span>Create by: </span><a href="#">${o.username}</a>
                                </div>

                                <div class=""> ${o.date}
                                </div>
                                <div style="font-size: 30px; position: absolute; bottom: 35%; right: 10px ">
                                    <!--<b style="font-family: Helvetica, serif;">${o.rating} &#x2B50 </b>-->
                                    <b style="font-family: Helvetica, serif;">${o.rating} </b><span class="fa fa-star checked"></span>
                                </div>
                            </div>
                        </div>
                        <!------------------------------->
                    </div>

                </c:forEach>

            </div>
            <div style="clear: both">
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                        <c:forEach begin="1" end="${requestScope.num}" var="i">
                            <li class="page-item">
                                <a class="page-link ${requestScope.page==i?" active ":" "}" href="YourOwnSubject?page=${i}&c=${c}&u=${u}&s=${s}&sort=${sort}">${i}</a></li>
                            </c:forEach>
                    </ul>
                </nav>
            </div>

        </section>


        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>


        <jsp:include page="footer.jsp" />
    </body>

</html>