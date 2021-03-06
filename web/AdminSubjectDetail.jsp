<%-- 
    Document   : SubjectDetail.jsp
    Created on : Oct 3, 2021, 12:04:35 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${requestScope.subject.subjectTitle}</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/startbootstrap-sb-admin-2/4.0.5/css/sb-admin-2.min.css" rel="stylesheet">
        <link rel='stylesheet prefetch' href='assets/fonts/fontawesome-all.min.css'>
        <link href="css/rating_style.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>


    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container" style="padding-top: 40px;">
            <div class="wrapper wrapper-content animated fadeInUp">
                <div class="ibox">
                    <div class="ibox-content">
                        <div class="row">
                            <div class="col-lg-10">
                                <h1>${requestScope.subject.subjectTitle}</h1>
                                <dl class="dl-horizontal">
                                    <dt>Rating</dt> <dd><a href="#" class="label label-primary">${requestScope.rate.rating} / 5.0</a></dd>
                                </dl>
                            </div>
                            <div class="col-lg-2">
                                <a href="SubjectEditForYOSD?subjectID=${requestScope.subject.subjectID}">
                                    <button type="button" class="btn btn-primary">Edit</button>
                                </a>

<!--                                <a href=deleSubject?subjectID=${requestScope.subject.subjectID}&username=${requestScope.subject.username}" onclick="return confirm('Are you sure you want to delete this subject?')">
                                    <button type="button" class="btn btn-danger">Delete</button>
                                </a>-->
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-7">
                                <dl class="dl-horizontal">

                                    <dt>Created by:</dt> <dd><a href="#" class="text-navy">${requestScope.subject.username}</a></dd>
                                    <dt>Number of Terms</dt> <dd>${requestScope.num.numOfTerm}</dd>
                                    <dt>Level</dt> <dd><a href="#" class="text-navy">${requestScope.cate.cateName}</a> </dd>
                                    <dt>Last Updated:</dt> <dd>${requestScope.subject.date}</dd>
                                </dl>
                            </div>
                            <div class="col-lg-5" id="cluster_info">
                                <dl class="dl-horizontal">
                                    <dt>Learning by:</dt> <dd><a href="flashcard?subjectID=${requestScope.subject.subjectID}&page=1&display=term" class="text-navy">Flashcard</a></dd>
                                    <dt></dt> <dd><a href="multiplechoice?subjectID=${requestScope.subject.subjectID}" class="text-navy">Multiple choice</a></dd>
                                    <dt></dt> <dd><a href="test?subjectID=${requestScope.subject.subjectID}" class="text-navy">Test</a></dd>
                                </dl>
                            </div>
                        </div>
                        <!--                            <div class="row">
                                                        <div class="col-lg-12">
                                                            <dl class="dl-horizontal">
                                                                <dt>Completed:</dt>
                                                                <dd>
                                                                    <div class="progress progress-striped active m-b-sm">
                                                                        <div style="width: 60%;" class="progress-bar"></div>
                                                                    </div>
                                                                    <small>Subject completed in <strong>60%</strong></small>
                                                                </dd>
                                                            </dl>
                                                        </div>
                                                    </div>-->
                    </div>
                </div>
            </div>
            
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-8 text-left">
                            <h3>Terms in this subject</h3>
                        </div>
                        <div class="col-sm-2 text-right">
                            <a href="AdminTermAdd.jsp?subjectID=${requestScope.subject.subjectID}">
                                <button type="button" class="btn btn-success">Add new term</button>
                            </a>
                        </div>
                        <div class="col-sm-2 text-left">
                            <div class="dropdown">
                                <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Sort by
                                    <span class="caret"></span></button>
                                <ul class="dropdown-menu">
                                    <li><a href="adminSubjectDetail?subjectID=${requestScope.subject.subjectID}&termsort=0">Original</a></li>
                                    <li><a href="adminSubjectDetail?subjectID=${requestScope.subject.subjectID}&termsort=1">Alphabet</a></li>
                                </ul>
                            </div>					
                        </div>
                    </div>
                </div>

                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col" class="col-3">Term</th>
                            <th scope="col" class="col-6">Definition</th>
                            <th scope="col" class="col-3">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listT}" var="o" varStatus="i">
                            <tr>
                                <td>${o.term}</td>
                                <td>${o.definition}</td>
                                <td>
                                    <a href="AdminTermEdit.jsp?subjectID=${requestScope.subject.subjectID}&questionID=${o.questionID}">
                                        <button type="button" class="btn btn-primary">Edit</button>
                                    </a>

                                    <a href="adminTermDele?subjectID=${requestScope.subject.subjectID}&questionID=${o.questionID}" onclick="return confirm('Are you sure you want to delete this term?')">
                                        <button type="button" class="btn btn-danger">Delete</button>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table> 
            </div>
        </div>
        <%@include file="footer.jsp" %>
        <script>
            // Get the modal
            var modal = document.getElementById("myModal");

            // Get the button that opens the modal
            var btn = document.getElementById("myBtn");

            // Get the <span> element that closes the modal
            var span = document.getElementsByClassName("close")[0];



            // When the user clicks the button, open the modal 
            btn.onclick = function () {
                modal.style.display = "inline-block";
            }

            // When the user clicks on <span> (x), close the modal
            span.onclick = function () {
                modal.style.display = "none";
            }



            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }


        </script>
    </body>
</html>

