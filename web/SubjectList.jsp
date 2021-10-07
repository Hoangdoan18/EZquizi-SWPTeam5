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
        <jsp:include page="header.jsp"/>
        <!--FORM IMAGE "GETTING STARTED"-->  
        <nav class="main-nav hidden-xs " style="z-index: 1000;  top: 100px; margin-left: 0px; width: 1030px; left: 0px;">
            <div class="container"  >
                <lu> <div style="font-size: 20px; margin-bottom: 20px;"> Sort by:</div> </lu>
                <c:forEach var="o" items="${ListC}">
                <lu> <a style="border: 3px; margin-right: 40px; font-size: 20px; text-decoration: none; " href="category?cid=${o.cateID}"> ${o.cateName} </a></lu>
                </c:forEach>
                <lu> <a style="border: 3px; margin-right: 40px; font-size: 20px;text-decoration: none; " href="sort" > Date </a></lu>
                <lu> <a style="border: 3px; margin-right: 40px; font-size: 20px;text-decoration: none; " href="SubjectListServlet" > All </a></lu>
            </div>
        </nav>
        <!-------------------------------> 
         
        <section class="flex-sect">
            <nav aria-label="Page navigation example" style="margin-top: 50px" >
                        <ul class="pagination">
                            <c:forEach begin="1" end="${requestScope.num}" var="i">
                                <li class="page-item"><a class="page-link ${requestScope.page==i?"active":""}" href="SubjectListServlet?page=${i}">${i}</a></li>
                                </c:forEach>
                        </ul>
                    </nav>
            <c:forEach items="${listS}" var="o" varStatus="i">
           
            <div class="cards" style="display: block"  >
                    <!--FORM IMAGE EACH CARD--> 
                    <div class="card"  style="width: 100%" >
                        <div class="card-body">
                            <div class="card-title" style="font-size: 50px; margin-bottom: 10px "> ${o.subjectTitle}
                            </div>
                            <div class="card-title" style="font-size: 20px; margin-bottom: 10px "> 
                                <a href="#">${o.username}</a> 
                            </div>
                            <div class="card-title" style="font-size: 30px; margin-bottom: 10px; float: right; ">
                                <a href="#" style="text-decoration: none; border: 1px;">Subscribe</a>
                            </div>
                            <div class="card-sub-title"> ${o.cateID}
                            </div>
                            <div class="card-desc"> ${o.date}
                            </div>
                        </div>
                    </div>
                    <!------------------------------->
            </div>
                 </c:forEach>
            <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <c:forEach begin="1" end="${requestScope.num}" var="i">
                                <li class="page-item"><a class="page-link ${requestScope.page==i?"active":""}" href="SubjectListServlet?page=${i}">${i}</a></li>
                                </c:forEach>
                        </ul>
                    </nav>
        </section>
         <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
        
        
        <jsp:include page="footer.jsp"/>
    </body>
</html>