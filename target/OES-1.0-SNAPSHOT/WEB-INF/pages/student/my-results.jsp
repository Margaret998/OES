<%-- 
    Document   : my-results
    Created on : Nov 16, 2020, 10:35:06 AM
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
        <title>My Results</title>
    </head>
    <div class="col-md-7 col-lg-8">
        <div class="py-5 text-center">
            <p class="h5" name="studentID" >Student ID: ${studentID}</p> &nbsp;&nbsp;&nbsp;
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">#</th> 
                        <th scope="col">Exam Name</th> 
                        <th scope="col">Exam ID</th>
                        <th scope="col">Exam Final Mark</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach var="result" items="${studentResults}" varStatus="list">
                        <tr>
                            <th scope="row">${list.count}</th>
                            <td>${result.examName}</td>
                            <td>${result.examID}</td>
                            <td>${result.finalMark}</td>
                            <td>
                                <button type="button" class="btn btn-indigo btn-sm m-0">
                                    <a href="${pageContext.request.contextPath}/student/exam/my-exam-assessment?examID=${result.examID}&&examName=${result.examName}">Show Exam Assessment</a>
                                </button>
                            </td>

                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

<%@include  file="/WEB-INF/resources/templates/footer.jsp" %>
