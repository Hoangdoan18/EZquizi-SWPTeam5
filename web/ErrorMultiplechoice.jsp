<%-- 
    Document   : ErrorMultiplechoice
    Created on : Nov 11, 2021, 9:22:47 AM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <p>You have done the Subject learn</p><br>
        <p>Want to reset it</p><br>
        <a href="">Back to subject</a>
        <a href="resetmultiplechoice?subjectID=${sessionScope.subjectID}">Reset</a>
    </body>
</html>
