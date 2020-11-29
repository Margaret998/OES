<%-- 
    Document   : my-exams
    Created on : Nov 15, 2020, 5:59:17 PM
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
            .h5{
                color: #de1b0c;
            }
        </style>
        <title>My Exams</title>
    </head>
    <div class="col-md-7 col-lg-8">
        <div class="py-5 text-center">
            <h1 class="display3">My Exams List</h1>
            <p class="h5" name="studentID" >Student ID: ${studentID}</p> &nbsp;&nbsp;&nbsp;
            <br/><br/>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">#</th> 
                        <th scope="col">Exam Name</th> 
                        <th scope="col">Exam ID</th>
                        <th scope="col">Enter Exam</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="e" items="${exams}" varStatus="list">
                        <tr>
                            <th scope="row">${list.count}</th>
                            <td>${e.examName}</td>
                            <td>${e.examID}</td>
                            <td><a href="${pageContext.request.contextPath}/student/exam/enter-exam?examID=${e.examID}&&studentID=${studentID}" target="_blank">Enter Exam</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

<%@include  file="/WEB-INF/resources/templates/footer.jsp" %>
