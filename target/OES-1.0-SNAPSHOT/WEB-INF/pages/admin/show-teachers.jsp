<%-- 
    Document   : show-teachers
    Created on : Nov 20, 2020, 11:55:30 AM
    Author     : looper
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="/WEB-INF/resources/templates/admin-header.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Teachers</title>

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

                <form action="${pageContext.request.contextPath}/admin/show-teachers" method="POST">
                    <div class="md-form form-group mt-5">
                        <label for="teacherCollege" class="form-label">College</label>
                        <select class="mdb-select md-form" name="teacherCollege" required>
                            <option selected disabled>College</option>
                            <c:forEach var="ccList" items="${collegesList}">
                                <option value="${ccList.collegeName}">${ccList.collegeName}</option>
                            </c:forEach>

                        </select>
                    </div>

                    <div class="md-form form-group mt-5">
                        <button class="btn btn-primary btn-lg btn-block" type="submit">Show Teachers</button>
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                </form>

                <h1 class="display-3">Teachers List</h1>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Teacher ID</th>
                            <th scope="col">Teacher Name</th>
                            <th scope="col">Gender</th>
                            <th scope="col">College</th>
                            <th scope="col">Reset Password</th>
                            <th scope="col">Remove</th>
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
                                <td><a href="${pageContext.request.contextPath}/admin/reset-password?userID=${sdList.teacherID}">Reset Password</a></td>
                                <td><a href="${pageContext.request.contextPath}/admin/remove-teacher?userID=${sdList.teacherID}">Remove Teacher</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <%@include  file="/WEB-INF/resources/templates/footer.jsp" %>
