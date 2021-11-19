<%-- 
    Document   : header
    Created on : Sep 17, 2021, 11:14:38 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>EZquizi</title>
        <link rel="stylesheet" href="./css/style_Homepage.css">


    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <!--FORM IMAGE "GETTING STARTED"-->  
        <header id="i08k" class="header-banner">
            <div class="container-width">
                <div class="clearfix">
                </div>
                <div class="lead-title">Easy for learning vocabulary
                </div>
                <div class="sub-lead-title">This website will change your future, join with us now!!!
                </div>
                <div class="lead-btn"> <a href="SubjectListServlet" >Getting started</a>
                </div>
            </div>
        </header>
        <jsp:include page="footer.jsp"/>
    </body>
</html>