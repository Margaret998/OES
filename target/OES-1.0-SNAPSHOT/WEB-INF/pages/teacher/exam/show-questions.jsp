<%-- 
    Document   : show-questions
    Created on : Nov 21, 2020, 1:28:51 AM
    Author     : looper
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="/WEB-INF/resources/templates/teacher-header.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Questions</title>

        <style>
            .col-md-7 {
                margin-left: 100px;
            }
            .h5{
                color: #de1b0c;
            }
        </style>
    </head>
    <body>
        <div class="col-md-7 col-lg-8">
            <div class="py-5 text-center">
                <h1 class="display3">Questions List</h1>

                <form action="${pageContext.request.contextPath}/teacher/exam/show-subject-questions" method="GET" />
                <div class="md-form form-group mt-5">
                    <label for="subjectCode" class="form-label">Subject Code:</label>
                    <select class="mdb-select md-form" name="subjectCode">
                        <option selected disabled>Subject Code</option>
                        <c:forEach var="subject" items="${subjectList}">
                            <option value="${subject.subjectCode}">${subject.subjectCode}</option>
                        </c:forEach>

                    </select>
                </div>
                <div class="md-form form-group mt-5">
                    <button class="btn btn-primary btn-lg btn-block" type="submit">Show Questions</button>
                </div>
                </form>

                <table class="table">

                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Subject</th>
                            <th scope="col">Question Context</th>
                            <th scope="col">Mark</th>
                            <th scope="col">Remove Question</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach var="question" items="${questionsList}" varStatus="list">
                            <tr>
                                <th scope="row">${list.count}</th>
                                <td>${question.subjectCode}</td>
                                <td>${question.questionContext}</td>
                                <td>${question.questionMark}</td>
                                <td>
                                    <button type="button" class="btn btn-indigo btn-sm m-0">
                                        <a href="${pageContext.request.contextPath}/teacher/exam/remove-question?questionID=${question.questionID}">Remove Question</a>
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>

                </table>
                <%@include  file="/WEB-INF/resources/templates/footer.jsp" %>
