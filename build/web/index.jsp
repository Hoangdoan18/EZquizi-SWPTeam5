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
                <div class="lead-btn">Hover me
                </div>
            </div>
        </header>
        <!-------------------------------> 

        <section class="flex-sect">
            <div class="container-width">
                <div class="flex-title">Flex is the new black
                </div>
                <div class="flex-desc">With flexbox system you&#039;re able to build complex layouts easily and with free responsivity
                </div>
                
                <div class="cards">

                    <!--FORM IMAGE EACH CARD--> 
                    <div class="card">
                        <div class="card-header">
                        </div>
                        <div class="card-body">
                            <div class="card-title">Title one
                            </div>
                            <div class="card-sub-title">Subtitle one
                            </div>
                            <div class="card-desc">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
                            </div>
                        </div>
                    </div>
                    <!------------------------------->
                    <div class="card">
                        <div class="card-header ch2">
                        </div>
                        <div class="card-body">
                            <div class="card-title">Title two
                            </div>
                            <div class="card-sub-title">Subtitle two
                            </div>
                            <div class="card-desc">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header ch3">
                        </div>
                        <div class="card-body">
                            <div class="card-title">Title three
                            </div>
                            <div class="card-sub-title">Subtitle three
                            </div>
                            <div class="card-desc">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header ch4">
                        </div>
                        <div class="card-body">
                            <div class="card-title">Title four
                            </div>
                            <div class="card-sub-title">Subtitle four
                            </div>
                            <div class="card-desc">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header ch5">
                        </div>
                        <div class="card-body">
                            <div class="card-title">Title five
                            </div>
                            <div class="card-sub-title">Subtitle five
                            </div>
                            <div class="card-desc">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header ch6">
                        </div>
                        <div class="card-body">
                            <div class="card-title">Title six
                            </div>
                            <div class="card-sub-title">Subtitle six
                            </div>
                            <div class="card-desc">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
                            </div>
                        </div>
                    </div>
                </div>
                <div class="flex-title" >
                    <center> <a href="SubjectListServlet" >Show more</a></center>
                </div>
            </div>
        </section>
        <jsp:include page="footer.jsp"/>
    </body>
</html>