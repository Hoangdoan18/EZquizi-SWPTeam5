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
                <title>Document</title>
                <link rel="stylesheet" href="./css/style_Homepage.css">
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            </head>

            <body>
                <!------------------------------->


                <!------------------------------->
                <jsp:include page="header.jsp" />
                <!--FORM IMAGE "GETTING STARTED"-->
                <!--<nav class="main-nav hidden-xs " style="z-index: 1000;  top: 100px; margin-left: 0px; width: 1030px; left: 0px;">-->



                <div class=" col-2 " style="background-color: white ; margin-top: 5%; border: 10px; border-color: #f83600;">
                    <div style=" border: 10px; border-color: #f83600; padding: 5px;">
                        <div style="font-size: 20">Category</div>
                        <c:forEach var="o" items="${ListC}">

                            <c:if test="${admin != null}">
                                <li> <a style="border: 3px; margin-right: 40px; font-size: 20px; text-decoration: none; " href="ListDoingServlet?c=${o.cateID}&u=${admin.username}&sub=${sub}&d=${d}&sort=0"> ${o.cateName} </a></li>
                            </c:if>
                            <c:if test="${account != null}">
                                <li> <a style="border: 3px; margin-right: 40px; font-size: 20px; text-decoration: none; " href="ListDoingServlet?c=${o.cateID}&u=${account.username}&sub=${sub}&d=${d}&sort=0"> ${o.cateName} </a></li>
                            </c:if>

                        </c:forEach>
                    </div>
                </div>



                <div class="" style="float: right ">
                    <div class="dropdown">
                        <button class="btn btn-primary dropdown-toggle" style="" type="button" data-toggle="dropdown">Sort by
                    <span class="caret"></span>
                </button>
                        <ul class="dropdown-menu">
                            <c:if test="${admin != null}">

                                <li><a href="ListDoingServlet?c=${c}&u=${admin.username}&sub=${sub}&d=${d}&sort=1">Date</a></li>
                                <li><a href="ListDoingServlet?c=${c}&u=${admin.username}&sub=${sub}&d=${d}&sort=2">Ratting</a></li>
                            </c:if>
                            <c:if test="${account != null}">

                                <li><a href="ListDoingServlet?c=${c}&u=${admin.username}&sub=${sub}&d=${d}&sort=1">Date</a></li>
                                <li><a href="ListDoingServlet?c=${c}&u=${admin.username}&sub=${sub}&d=${d}&sort=2">Ratting</a></li>
                            </c:if>
                        </ul>
                    </div>
                </div>


                <div style="clear: both; float: left; margin-left: 10px">
                    <c:if test="${sub==1}">
                        <a href="ListDoingServlet?c=0&u=${admin.username}&sub=2&d=0&sort=0" class="btn btn-primary pull-right"><span>Show UnSubscribe Subject</span></a>
                    </c:if>
                    <c:if test="${sub==2}">

                        <a href="ListDoingServlet?c=0&u=${admin.username}&sub=1&d=0&sort=0" class="btn btn-primary pull-right"><span>Show Subscribed Subject</span></a>
                    </c:if>
                    <c:if test="${d==2}">

                        <a href="ListDoingServlet?c=0&u=${admin.username}&sub=0&d=1&sort=0" class="btn btn-primary pull-right"><span>Show Doing(Done) List Subject</span></a>
                    </c:if>
                    <c:if test="${d==1}">

                        <a href="ListDoingServlet?c=0&u=${admin.username}&sub=0&d=2&sort=0" class="btn btn-primary pull-right"><span>Show Subject you didn't touch </span></a>
                    </c:if>



                </div>




                <!------------------------------->

                <section class="flex-sect">

                    <nav aria-label="Page navigation example">
                        <ul class="pagination">


                            <c:forEach begin="1" end="${requestScope.num}" var="i">
                                <c:if test="${admin != null}">

                                    <li class="page-item">
                                        <a class="page-link ${requestScope.page==i?" active ":" "}" href="ListDoingServlet?page=${i}&c=${c}&u=${admin.username}&sub=${sub}&d=${d}&sort=${sort}">${i}</a></li>
                                </c:if>
                                <c:if test="${account != null}">

                                    <li class="page-item">
                                        <a class="page-link ${requestScope.page==i?" active ":" "}" href="ListDoingServlet?page=${i}&c=${c}&u=${account.username}&sub=${sub}&d=${d}&sort=${sort}">${i}</a></li>
                                </c:if>

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
                                            <a href="SubjectDetail?subjectID=${o.subjectID}&termsort=0">${o.subjectTitle}</a>
                                        </div>

                                        <div class="card-title" style="font-size: 30px; position: absolute; bottom:20px; right:10px;">
                                            <a href="#" class="btn btn-primary pull-right"><span>Subscribe</span></a>
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
                                    <c:if test="${admin != null}">

                                        <li class="page-item">
                                            <a class="page-link ${requestScope.page==i?" active ":" "}" href="ListDoingServlet?page=${i}&c=${c}&u=${admin.username}&sub=${sub}&d=${d}&sort=${sort}">${i}</a></li>
                                    </c:if>
                                    <c:if test="${account != null}">

                                        <li class="page-item">
                                            <a class="page-link ${requestScope.page==i?" active ":" "}" href="ListDoingServlet?page=${i}&c=${c}&u=${admin.username}&sub=${sub}&d=${d}&sort=${sort}">${i}</a></li>
                                    </c:if>

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