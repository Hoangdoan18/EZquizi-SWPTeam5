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
                <div class="lead-title">Build your templates without coding
                </div>
                <div class="sub-lead-title">All text blocks could be edited easily with double clicking on it. You can create new text blocks with the command from the left panel
                </div>
                <div class="lead-btn"> <a href="SubjectListServlet" >Getting started</a>
                </div>
            </div>
        </header>
        <jsp:include page="footer.jsp"/>
    </body>
</html>