<%-- 
    Document   : manage-colleges
    Created on : Nov 22, 2020, 9:09:35 PM
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
        <title>Manage Colleges</title>
    </head>
    <body>
        <div class="container">
            <div class="py-5 text-center">
                <h1>Colleges</h1>
            </div>
            <form action="${pageContext.request.contextPath}/admin/manageColleges/add-college" method="POST">
                <div class="md-form form-group mt-5">
                    <label for="collegeName" class="form-label">College Name</label>
                    <input type="text" class="form-control" name="collegeName" placeholder="" value="" required>
                    <div class="invalid-feedback">
                        Valid College Name is required.
                    </div>
                </div>
             
                <div class="md-form form-group mt-5">
                    <button class="btn btn-primary btn-lg btn-block" type="submit">Add College</button>
                </div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            </form>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">College Name</th>
                        <th scope="col">Remove</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="ccList" items="${collegesList}" varStatus="list">
                        <tr>
                            <td scope="row">${list.count}</td>
                            <td>${ccList.collegeName}</td>
                            <td><a href="${pageContext.request.contextPath}/admin/manageColleges/remove-college?collegeName=${ccList.collegeName}">Remove College</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <%@include  file="/WEB-INF/resources/templates/footer.jsp" %>
