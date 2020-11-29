<%-- 
    Document   : manage-classes
    Created on : Nov 22, 2020, 7:26:54 PM
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
        <title>Manage Classes</title>
    </head>
    <body>
        <div class="container">
            <div class="py-5 text-center">
                <h1>Classes</h1>
            </div>
            <form action="${pageContext.request.contextPath}/admin/manageClasses/add-class" method="POST">
                <div class="md-form form-group mt-5">
                    <label for="classCode" class="form-label">Class Code</label>
                    <input type="text" class="form-control" name="classCode" placeholder="" value="" required>
                    <div class="invalid-feedback">
                        Valid Class Code is required.
                    </div>
                </div>
              <div class="md-form form-group mt-5">
                    <label for="classCollege" class="form-label">College</label>
                    <select class="mdb-select md-form" name="classCollege" required>
                        <option selected disabled>College</option>
                        <c:forEach var="ccList" items="${collegesList}">
                            <option value="${ccList.collegeName}">${ccList.collegeName}</option>
                        </c:forEach>

                    </select>
                </div>
                <div class="md-form form-group mt-5">
                    <button class="btn btn-primary btn-lg btn-block" type="submit">Add Class</button>
                </div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            </form>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Class Code</th>
                        <th scope="col">Class College</th>
                        <th scope="col">Remove</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="cList" items="${classesList}" varStatus="list">
                        <tr>
                            <td scope="row">${list.count}</td>
                            <td>${cList.classCode}</td>
                            <td>${cList.classCollege}</td>
                            <td><a href="${pageContext.request.contextPath}/admin/manageClasses/remove-class?classCode=${cList.classCode}">Remove Class</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <%@include  file="/WEB-INF/resources/templates/footer.jsp" %>
