<%-- 
    Document   : enter-exam
    Created on : Nov 16, 2020, 6:15:42 AM
    Author     : looper
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

        <title>Exam Room</title>
        <style>
            body {
                color:#18ce0f;

            }

            .h5{
                color: #de1b0c;
            }
            .h6{
                color: #009aae;
            }



            .col-md-7 {
                margin-left: 100px;

            }




        </style>

    </head>
    <body>
        <div class="container">



            <div class="col-md-7 col-lg-8">
                <div class="py-5 text-center">
                    <h1>My Exam</h1>
                </div>
                <form name="questionsForm" action="${pageContext.request.contextPath}/student/exam/submit-exam?examID=${examID}" method="POST">
                    <div class="row g-3">
                        <input type="hidden" name="examID" value="${examHeader.get(0).examID}" />

<!--                        <p class="h5" name="studentID">Student ID: ${studentID}</p> &nbsp;&nbsp;&nbsp;
                        <p class="h5" name="examName" >Exam Name: ${examHeader.get(0).examName}</p>&nbsp;&nbsp;&nbsp;
                        <p class="h5" name="subjectCode" >Subject Code: ${examHeader.get(0).subjectCode}</p>&nbsp;&nbsp;&nbsp;-->
                        <p class="h5" name="numberOfQuestions" >Questions Number: ${examHeader.get(0).numberOfQuestions}</p>&nbsp;&nbsp;&nbsp;
<!--                        <p class="h5" name="examDescription" >Exam Description: ${examHeader.get(0).examDescription}</p>&nbsp;&nbsp;&nbsp;
                        <p class="h5" name="examDate" >Exam Date: ${examHeader.get(0).examDate}</p>&nbsp;&nbsp;&nbsp;
                        <p class="h5" name="examTime" >Exam Period: ${examHeader.get(0).examTime}</p>&nbsp;&nbsp;&nbsp;-->
                        <input type="hidden" name="numberOfQuestions" value="${examHeader.get(0).numberOfQuestions}" />
                        <input type="hidden" name="studentID" value="${studentID}" />
                        <input type="hidden" name="examName" value="${examHeader.get(0).examName}" />
                        <input type="hidden" id="examPeriod" value="${examHeader.get(0).examTime}" />
                        <br>
                        <text class="h5" id="showTime"></text>
                        <hr><hr>

                        <c:forEach var="question" items="${examQuestions}" varStatus="loop">

                            <div class="container mt-sm-5 my-1">
                                <div class="question ml-sm-5 pl-sm-5 pt-2">
                                    <div class="py-2 h6"><b>${loop.count}- ${question.questionContext}</b>
                                        <input type="hidden" name="${loop.count}questionID" value="${question.questionID}" />
                                    </div>
                                    <div class="form-check">
                                        <input  type="radio" name="q${loop.count}" value="1" checked="true"/>
                                        <label for="q${loop.count}" class="options">
                                            ${question.choice1}
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input type="radio" name="q${loop.count}" value="2" />
                                        <label for="q${loop.count}" class="for-check-label">
                                            ${question.choice2}
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input  type="radio" name="q${loop.count}" value="3" />
                                        <label for="q${loop.count}" class="for-check-label">
                                            ${question.choice3}
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input  type="radio" name="q${loop.count}" value="4" />
                                        <label for="q${loop.count}" class="for-check-label">
                                            ${question.choice4}
                                        </label>
                                    </div>
                                </div>
                            </div>


                        </c:forEach>

                        <button class="btn btn-primary btn-lg btn-block" type="submit">Submit Answers</button>
                    </div>
            </div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

        </form>
    </div>

    <script type="text/javascript">
        var max_time = 1;
        var c_seconds = 0;
        var total_seconds = 60 * max_time;
        max_time = parseInt(total_seconds / 60);
        c_seconds = parseInt(total_seconds % 60);
        document.getElementById("showTime").innerHTML = 'Time Left: ' + max_time + ' minutes ' + c_seconds + ' seconds';
        function init() {
            document.getElementById("showTime").innerHTML = 'Time Left: ' + max_time + ' minutes ' + c_seconds + ' seconds';
            setTimeout("CheckTime()", 999);
        }
        function CheckTime() {
            document.getElementById("showTime").innerHTML = 'Time Left: ' + max_time + ' minutes ' + c_seconds + ' seconds';
            if (total_seconds <= 0) {
                setTimeout('document.questionsForm.submit()', 1);

            } else
            {
                total_seconds = total_seconds - 1;
                max_time = parseInt(total_seconds / 60);
                c_seconds = parseInt(total_seconds % 60);
                setTimeout("CheckTime()", 999);
            }

        }
        init();

    </script>

    <script type="text/javascript">

        function finishpage()
        {
            alert("Can't Refresh Exam Page!");
            document.questionsForm.submit();
        }
        window.onbeforeunload = function () {
            alert("Can't Refresh Exam Page!");
            setTimeout('document.questionsForm.submit()', 1);
        }
    </script>