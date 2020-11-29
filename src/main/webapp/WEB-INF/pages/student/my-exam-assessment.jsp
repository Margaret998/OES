<%-- 
    Document   : my-exam-assessment
    Created on : Nov 17, 2020, 2:28:52 PM
    Author     : looper
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include  file="/WEB-INF/resources/templates/student-header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <style>
            .col-md-7 {
                margin-left: 100px;
            }
        </style>
        <title>Exam Assessment</title>
    </head>
    <body>
        <div class="col-md-7 col-lg-8">
            <div class="py-5 text-center">

                <h4 class="display-5" style="color:green">${examName}'s Exam Assessment</h4>

                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Question</th>
                            <th scope="col">Student Answer</th>
                            <th scope="col">Valid Answer</th>
                            <th scope="col">Answer Assessment</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="assessment" items="${studentAssessment}" varStatus="list">
                            <tr>
                                <th scope="row">${list.count}</th>
                                <td>${assessment.questionContext}</td>
                                <td>${assessment.studentAnswerContext}</td>
                                <td>${assessment.validAnswerContext}</td>
                                <td> ${assessment.answerAssessment}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

<%@include  file="/WEB-INF/resources/templates/footer.jsp" %>
