<%-- 
    Document   : manage-subject
    Created on : Nov 20, 2020, 12:14:34 PM
    Author     : looper
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="/WEB-INF/resources/templates/admin-header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>

            .col-md-7 {
                margin-left: 300px;
            }
        </style>
        <title>Manage Subjects</title>
    </head>
    <body>
        <div class="container">
            <div class="py-5 text-center">
                <h1>Subjects</h1>
            </div>
            <form action="${pageContext.request.contextPath}/admin/add-subject" method="POST">
                <div class="md-form form-group mt-5">
                    <label for="subjectCode" class="form-label">Subject Code</label>
                    <input type="text" class="form-control" name="subjectCode" minlength="4"  required>
                    <div class="invalid-feedback">
                        Valid Subject Code is required.
                    </div>
                    <div class="valid-feedback">
                        Valid Subject Code.
                    </div>
                </div>

                <div class="md-form form-group mt-5">
                    <label for="subjectCollege" class="form-label">College</label>
                    <select class="mdb-select md-form" name="subjectCollege" required>
                        <option selected disabled>College</option>
                        <c:forEach var="ccList" items="${collegesList}">
                            <option value="${ccList.collegeName}">${ccList.collegeName}</option>
                        </c:forEach>

                    </select>
                </div>

                <div class="md-form form-group mt-5">
                    <label for="subjectDescription" class="form-label">Subject Description</label>
                    <input type="text" class="form-control" name="subjectDescription" placeholder="" value="" required>
                    <div class="invalid-feedback">
                        Valid Subject Description is required.
                    </div>
                </div>
                <div class="md-form form-group mt-5">
                    <button class="btn btn-primary btn-lg btn-block" type="submit">Add Subject</button>
                </div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            </form>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Subject Code</th>
                        <th scope="col">College</th>
                        <th scope="col">Subject Description</th>
                        <th scope="col">Remove</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="sList" items="${subjectsList}" varStatus="list">
                        <tr>
                            <td scope="row">${list.count}</td>
                            <td>${sList.subjectCode}</td>
                            <td>${sList.subjectCollege}</td>
                            <td>${sList.subjectDescription}</td>
                            <td><a href="${pageContext.request.contextPath}/admin/remove-subject?subjectCode=${sList.subjectCode}">Remove Subject</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <%@include  file="/WEB-INF/resources/templates/footer.jsp" %>
