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
        <title>Test</title>
        <link rel="stylesheet" href="css/Material-Text-Input.css">
        <link rel="stylesheet" href="css/rating_style.css">
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <form action="testsummary?subjectID=${requestScope.subjectID}" method="post">
            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th style="width: 200px;"></th>
                            <th>
                                <h3>Test:</h3>
                                <br>
                                You will test with random 10 question from subject.
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td style="width: 200px;border-right: 2px solid rgb(103,108,237) ;">
                                Time remaining
                                <br>
                                <div id="demo" style="font-size: 40px; color: #F62"></div>
                            </td>
                            <td>
                                <c:forEach begin="1" end="10" var="i">
                                    <div style="margin-left: 30px; margin-bottom: 30px;">
                                        <div>
                                            <p style="font-weight: 900 ">Question ${i}: ${sessionScope.test[i-1].question}&nbsp;</p>
                                        </div>
                                        <div>
                                            <input type="text" name="answer${i-1}" id="FormInput" class="mdl-textfield__input" style="width: 70%;border-radius: 0px;border-bottom-color: rgba(0,0,0,0.5);" placeholder="Enter answer"/>
                                        </div>
                                        <hr style="width: 50%">
                                    </div>
                                </c:forEach>
                            </td>
                        </tr>
                        <tr></tr>
                    </tbody>
                </table>
                <center>
                    <button class="btn btn-primary" type="button" id="btn1">Submit</button>
                </center>
                <div class="modal" id="modal1" >
                    <div class="modal-content" style="width: 30%">
                        Are you sure to submit?
                        <hr>
                        <button class="btn btn-primary" type="submit">Submit</button>
                        <br>
                        <button class="btn btn-danger" type="button" id="btn2">Cancel</button>
                    </div>
                </div>
            </div>
            <div class="modal" id="modal2">
                <div class="modal-content" style="width: 30%">
                    Time up!
                    <hr>
                    <button class="btn btn-primary" type="submit" >Submit</button>
                </div>
            </div>
        </form>     
    </body>

    <script>
// Set the date we're counting down to
        var countDownDate = new Date(Date.now() + 5 * 1000 * 60).getTime();


// Update the count down every 1 second
        var x = setInterval(function () {

            // Get today's date and time
            var now = new Date().getTime();

            // Find the distance between now and the count down date
            var distance = countDownDate - now;

            // Time calculations for days, hours, minutes and seconds
            var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
            var seconds = Math.floor((distance % (1000 * 60)) / 1000);

            // Output the result in an element with id="demo"
            document.getElementById("demo").innerHTML = minutes + "m " + seconds + "s ";

            // If the count down is over, write some text 
            if (distance < 0) {
                clearInterval(x);
                document.getElementById("demo").innerHTML = "Time up";
                modal1.style.display = "none";
                modal2.style.display = "inline-block";
            }
        }, 1000);
        //Model
        var modal1 = document.getElementById("modal1");
        var modal2 = document.getElementById("modal2");
        var btn1 = document.getElementById("btn1");
        var btn2 = document.getElementById("btn2");

        btn1.onclick = function () {
            modal1.style.display = "inline-block";
            modal2.style.display = "none";
        }

        btn2.onclick = function () {
            modal2.style.display = "none";
            modal1.style.display = "none";
        }
    </script>
</html>
