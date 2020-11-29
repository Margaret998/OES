<%-- 
    Document   : ready-exams
    Created on : Nov 9, 2020, 2:23:56 PM
    Author     : looper
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="/WEB-INF/resources/templates/teacher-header.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Generated Exams</title>

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
                <h1 class="display3">Generated Exams List</h1>

                <table class="table">


                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Exam ID</th>
                            <th scope="col">Exam Name</th>
                            <th scope="col">Subject Code</th>
                            <th scope="col">Exam Date</th>
                            <th scope="col">Show Exam</th>
                            <th scope="col">Remove Exam</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach var="exList" items="${examsList}" varStatus="list">
                            <tr>
                                <th scope="row">${list.count}</th>
                                <td>${exList.examID}</td>
                                <td>${exList.examName}</td>
                                <td>${exList.subjectCode}</td>
                                <td>${exList.examDate}</td>
                                <td>
                                    <button type="button" class="btn btn-indigo btn-sm m-0">
                                        <a href="${pageContext.request.contextPath}/teacher/exam/show-exam?examID=${exList.examID}">Show Exam</a>
                                    </button>
                                </td>
                                <td>
                                    <button type="button" class="btn btn-indigo btn-sm m-0">
                                        <a href="${pageContext.request.contextPath}/teacher/exam/remove-exam?examID=${exList.examID}">Remove Exam</a>
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>

                </table>
                <%@include  file="/WEB-INF/resources/templates/footer.jsp" %>
