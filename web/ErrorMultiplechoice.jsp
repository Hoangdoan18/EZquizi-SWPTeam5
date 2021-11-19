
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Multiple choice</title>
        <<link rel="stylesheet" href="css/-Identity-Page-BS4-.css">
        <script src="js/-Identity-Page-BS4-.js"></script>
    </head>
    <jsp:include page="header.jsp" />
    <body>
        <div class="container-fluid">
            <div class="row flex-lg-row-reverse mh-100vh">
                <div class="col-lg-6 d-flex align-items-end mh-50vh" style="background: url(&quot;https://www.protoseducacion.com/wp-content/uploads/2016/06/Fotolia_46482585_S.jpg&quot;);background-size: cover;">
                    <p class="ml-auto small text-white"><em>Photo by&nbsp;</em><a class="text-white" href="https://unsplash.com/photos/KriecpTIWgY?utm_source=unsplash&amp;utm_medium=referral&amp;utm_content=creditCopyText" target="_blank"><em>Brooke Cagle</em></a></p>
                </div>
                <div class="col-lg-6 d-lg-flex align-items-lg-center text-center px-sm-5 py-5 shadow">
                    <div>
                        <p class="text-secondary spectral font20"><em>Your Multiple Choice learning was completed, reset to learn it again?</em></p>
                        <hr class="mt-5 mb-4">
                        <a href="SubjectDetail?subjectID=${sessionScope.subjectID}&&termsort=0">Back to subject</a>
                        <a href="resetmultiplechoice?subjectID=${sessionScope.subjectID}">Reset</a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
