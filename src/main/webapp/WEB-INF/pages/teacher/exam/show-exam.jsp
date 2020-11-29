<%-- 
    Document   : show-exam
    Created on : Nov 16, 2020, 9:15:16 PM
    Author     : looper
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="/WEB-INF/resources/templates/teacher-header.jsp" %>

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
                color: #FFFFFF;
            }



            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }
            .col-md-7 {
                margin-left: 100px;

            }




        </style>

    </head>
    <body class="bg-light">
        <div class="container">



            <div class="col-md-7 col-lg-8">
                <div class="py-5 text-center">
                    <h1>My Exam</h1>
                </div>
                <div class="row g-3">
                    <input type="hidden" name="examID" value="${examHeader.get(0).examID}" />

                    <p class="h5" name="examName" >Exam Name: ${examHeader.get(0).examName}</p>&nbsp;&nbsp;&nbsp;
                    <p class="h5" name="subjectCode" >Subject Code: ${examHeader.get(0).subjectCode}</p>&nbsp;&nbsp;&nbsp;
                    <p class="h5" name="numberOfQuestions" >Questions Number: ${examHeader.get(0).numberOfQuestions}</p>&nbsp;&nbsp;&nbsp;
                    <p class="h5" name="examDescription" >Exam Description: ${examHeader.get(0).examDescription}</p>&nbsp;&nbsp;&nbsp;
                    <p class="h5" name="examDate" >Exam Date: ${examHeader.get(0).examDate}</p>&nbsp;&nbsp;&nbsp;
                    <p class="h5" name="examTime" >Exam Period: ${examHeader.get(0).examTime}</p>&nbsp;&nbsp;&nbsp;



                    <c:forEach var="question" items="${examQuestions}" varStatus="loop">

                        <div class="container mt-sm-5 my-1">
                            <div class="question ml-sm-5 pl-sm-5 pt-2">
                                <div class="py-2 h6"><b>${loop.count}- ${question.questionContext}</b>
                                    <input type="hidden" name="${loop.count}questionID" value="${question.questionID}" />
                                </div>
                                <div class="form-check">
                                    <input  type="radio" name="q${loop.count}" value="1"/>
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
                    <button type="button" class="btn btn-indigo btn-sm m-0">
                        <a href="${pageContext.request.contextPath}/teacher/exam/remove-exam?examID=${examID}">Remove Exam</a>
                    </button>

                </div>
            </div>
        </form>
    </div>
<%@include  file="/WEB-INF/resources/templates/footer.jsp" %>
