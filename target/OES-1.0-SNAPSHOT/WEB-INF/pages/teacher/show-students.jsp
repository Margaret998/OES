<%-- 
    Document   : show-students
    Created on : Nov 9, 2020, 2:47:15 PM
    Author     : looper
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="/WEB-INF/resources/templates/teacher-header.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Students</title>

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

                <h1 class="display3">Students List</h1>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Student ID</th>
                            <th scope="col">Student Name</th>
                            <th scope="col">Gender</th>
                            <th scope="col">Phone</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="sdList" items="${studentsList}" varStatus="list">
                            <tr>
                                <td scope="row">${list.count}</td>
                                <td>${sdList.studentID}</td>
                                <td>${sdList.fullName}</td>
                                <td>${sdList.gender}</td>
                                <td>${sdList.phone}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
<%@include  file="/WEB-INF/resources/templates/footer.jsp" %>
