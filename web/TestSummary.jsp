<%-- 
    Document   : Test
    Created on : Nov 14, 2021, 8:33:54 PM
    Author     : USER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Test Summary</title>
        <link rel="stylesheet" href="css/Material-Text-Input.css">
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th style="width: 200px;"></th>
                        <th>Test</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="width: 200px;border-right: 2px solid rgb(103,108,237) ;">
                            <div style="font-size: 40px; color: #F62">${requestScope.point}</div>
                            <br>
                        </td>
                        <td>
                            <c:forEach begin="1" end="10" var="i">
                                <div style="margin-left: 30px; margin-bottom: 30px;">
                                    <div>
                                        <p>Question ${sessionScope.test[i-1].question}: &nbsp;</p>
                                    </div>
                                    <div>
                                        Your answer: ${requestScope.listanswer[i-1]}
                                    </div>
                                    <div>
                                        Answer : ${sessionScope.test[i-1].answer}
                                    </div>
                                    <hr>
                                </div>
                            </c:forEach>
                        </td>
                    </tr>
                    <tr></tr>
                </tbody>

            </table>
            <center>
                <button class="btn btn-primary" type="button" onclick="window.location.href='SubjectDetail?subjectID=${requestScope.subjectID}&termsort=0'">Back to subject detail</button>
            </center>
        </div>        
    </body>
</html>
