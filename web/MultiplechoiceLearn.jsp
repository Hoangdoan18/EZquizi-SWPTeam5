<%-- 
    Document   : MultiplechoiceLearn
    Created on : Oct 31, 2021, 2:38:42 PM
    Author     : USER
--%>

<%@page import="model.User"%>
<%@page import="dal.MultiplechoiceDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Question"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Multiple Choice</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/startbootstrap-sb-admin-2/4.0.5/css/sb-admin-2.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
        <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
        <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/Pages-Navbar.css">
        <link rel="stylesheet" href="assets/css/Search-Input-responsive.css">
        <style>
            .answer:hover {
                background-color: #d1d2d2;
            }
        </style>
    </head>
    <jsp:include page="header.jsp"/>
    <body> 
        <div style="height: 50px; width: 100%"></div>
        <div class="container-fluid">
            <button class="btn btn-primary pull-right" onclick="window.location.href='SubjectDetail?subjectID=${sessionScope.subjectID}&termsort=0'"><span class="fa fa-caret-left"></span> Back to Subject detail</button>
            <br>
            <div class="row mb-3">
                <div class="col-lg-3 col-xl-2">
                    <div class="card mb-3"></div>
                    <div class="card shadow mb-4">
                        <div class="card-header py-3" style="background: rgb(255,174,252);">
                            <h6 class="text-primary font-weight-bold m-0">Status</h6>
                        </div>
                        <div class="card-body">
                            <h4 class="small font-weight-bold">Correct answer<span class="float-right">${(requestScope.sum - requestScope.remain)/requestScope.sum*100}%</span></h4>
                            <div class="progress progress-sm mb-3">
                                <div class="progress-bar bg-warning" aria-valuenow="${(requestScope.sum - requestScope.remain)/requestScope.sum*100}" aria-valuemin="0" aria-valuemax="100" style="width: ${(requestScope.sum - requestScope.remain)/requestScope.sum*100}%;"><span class="sr-only">40%</span></div>
                            </div>
                            <h4 class="small font-weight-bold">Remain<span class="float-right">${(requestScope.remain)/requestScope.sum*100}%</span></h4>
                            <div class="progress progress-sm mb-3">
                                <div class="progress-bar bg-info" aria-valuenow="${(requestScope.remain)/requestScope.sum*100}" aria-valuemin="0" aria-valuemax="100" style="width: ${(requestScope.remain)/requestScope.sum*100}%;"><span class="sr-only">80%</span></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-xl-10">

                    <div class="row">
                        <div class="col">Question: ${sessionScope.question.question}?</div>
                    </div>
                    <form action="multiplechoice?subjectID=${requestScope.subjectID}" method="post" name="myForm">
                        <div class="table-responsive" style="margin-top: 50px;">
                            <table class="table">
                                <tbody>
                                    <tr style="padding-bottom: 0px;">
                                        <td class="col-6">
                                            <input type="radio" class="btn-check" name="option" id="success-outlined1" autocomplete="off" value="0">
                                            <label class="btn btn-outline-success" name="answer" for="success-outlined1" onclick="check(0)" style="width: 90%; text-align: left;">A. ${sessionScope.question.listanswer[0]}</label>
                                        </td>
                                        <td class="col-6">
                                            <input type="radio" class="btn-check" name="option" id="success-outlined2" autocomplete="off" value="1">
                                            <label class="btn btn-outline-success" name="answer" for="success-outlined2" onclick="check(1)" style="width: 90%; text-align: left;">B. ${sessionScope.question.listanswer[1]}</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="col-6"> 
                                            <input type="radio" class="btn-check" name="option" id="success-outlined3" autocomplete="off" value="2">
                                            <label class="btn btn-outline-success" name="answer" for="success-outlined3" onclick="check(2)" style="width: 90%; text-align: left;">C. ${sessionScope.question.listanswer[2]}</label>
                                        </td>
                                        <td class="col-6">
                                            <input type="radio" class="btn-check" name="option" id="success-outlined4" autocomplete="off" value="3" >
                                            <label class="btn btn-outline-success" name="answer" for="success-outlined4" onclick="check(3)" style="width: 90%; text-align: left;">D. ${sessionScope.question.listanswer[3]}</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <button type="submit" class="btn btn-primary pull-right">Next question <span class="fa fa-caret-right"></span></button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script>
            function check(a) {
                if (a == ${sessionScope.answer}) {
                    document.getElementsByName("answer")[a].style.backgroundColor = 'green';

                    //Java            
                } else
                if (document.getElementsByName("answer")[${sessionScope.answer}].style.backgroundColor != 'green') {
                    document.getElementsByName("answer")[a].style.backgroundColor = 'red';
                    document.getElementsByName("answer")[${sessionScope.answer}].style.backgroundColor = 'green';
                }
                var radios = document.myForm.option;

                for (var i = 0, iLen = radios.length; i < iLen; i++) {
                    if (i != a) {
                        radios[i].disabled = true;
                    }
                }
            }
        </script>
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
        <script src="assets/js/theme.js"></script>
    </body>

</html>