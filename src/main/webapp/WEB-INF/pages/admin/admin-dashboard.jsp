<%-- 
    Document   : admin-dashboard
    Created on : Oct 26, 2020, 9:02:54 AM
    Author     : looper
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include  file="/WEB-INF/resources/templates/admin-header.jsp" %>

<div class="content">

    <h1 class="display-4">Subjects</h1>
    <table class="table">
        <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Subject Code</th>
                <th scope="col">Subject Description</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="sList" items="${subjectsList}" varStatus="list">
                <tr>
                    <td scope="row">${list.count}</td>
                    <td>${sList.subjectCode}</td>
                    <td>${sList.subjectDescription}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <hr><hr>

    <h1 class="display-4">Teachers</h1>
    <table class="table">
        <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Teacher ID</th>
                <th scope="col">Teacher Name</th>
                <th scope="col">Gender</th>
                <th scope="col">College</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="sdList" items="${teachersList}" varStatus="list">
                <tr>
                    <td scope="row">${list.count}</td>
                    <td>${sdList.teacherID}</td>
                    <td>${sdList.fullname}</td>
                    <td>${sdList.gender}</td>
                    <td>${sdList.teacherCollege}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
        <hr><hr>


    <h1 class="display-4">Students</h1>
    <table class="table">
        <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Student ID</th>
                <th scope="col">Student Name</th>
                <th scope="col">Gender</th>
                <th scope="col">College</th>
                <th scope="col">Class</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="sdList" items="${studentsList}" varStatus="list">
                <tr>
                    <td scope="row">${list.count}</td>
                    <td>${sdList.studentID}</td>
                    <td>${sdList.fullName}</td>
                    <td>${sdList.gender}</td>
                    <td>${sdList.collegeName}</td>
                    <td>${sdList.classCode}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>


</div>

<%@include  file="/WEB-INF/resources/templates/footer.jsp" %>
