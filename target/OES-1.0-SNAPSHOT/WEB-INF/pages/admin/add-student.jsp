<%-- 
    Document   : add-student
    Created on : Oct 31, 2020, 2:50:35 PM
    Author     : looper
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="/WEB-INF/resources/templates/admin-header.jsp" %>

<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Student</title>


        <style>

            .col-md-7 {
                margin-left: 300px;
            }
            .invalid-feedback{
                color:red;
            }
        </style>

    </head>
    <body class="bg-light">
        <div class="container">
            <div class="py-5 text-center">
                <h1>Add New Student</h1>
            </div>



            <form class="container was-validated" action="${pageContext.request.contextPath}/admin/add-student" method="POST" >
                <div class="md-form form-group mt-5">
                    <label for="fullName" class="form-label">Student Full Name:</label>
                    <input type="text" class="form-control" name="fullName" pattern="[A-Za-z].{2,}" maxlength="20" minlength="2" data-error="Please Enter a Name" required>
                    <div class="invalid-feedback">
                        Valid Name is required.
                    </div>
                    <div class="valid-feedback">
                        Valid Name.
                    </div>
                </div>
                <div class="md-form form-group mt-5">
                    <label for="userID" class="form-label">Student ID:</label>
                    <input type="text" class="form-control" name="userID"  data-error="No More No Less than 10 digits" pattern="[0-9]{10}" maxlength="10" min="10"required>
                    <div class="invalid-feedback">
                        Valid User ID is required.
                    </div>
                    <div class="valid-feedback">
                        Valid User ID
                    </div>
                </div>

                <div class="md-form form-group mt-5">
                    <label for="collegeName" class="form-label">College</label>
                    <select class="mdb-select md-form" name="collegeName" required>
                        <option selected disabled>College</option>
                        <c:forEach var="ccList" items="${collegesList}">
                            <option value="${ccList.collegeName}">${ccList.collegeName}</option>
                        </c:forEach>

                    </select>
                </div>

                <div class="md-form form-group mt-5">
                    <label for="classCode" class="form-label">Class Code:</label>
                    <select class="mdb-select md-form" name="classCode" required>
                        <option selected disabled>Class Code</option>
                        <c:forEach var="cList" items="${classesList}">
                            <option value="${cList.classCode}">${cList.classCollege} || ${cList.classCode}</option>
                        </c:forEach>

                    </select>
                </div>

                <div class="md-form form-group mt-5">
                    <label for="password" class="form-label">password:</label>
                    <input type="password" class="form-control" name="password" min-length="6" data-error="Have at least 6 characters" required>
                    <div class="invalid-feedback">
                        Valid password is required.
                    </div>
                    <div class="valid-feedback">
                        Valid password.
                    </div>
                </div>

                <button class="btn btn-primary btn-lg btn-block" id="submitForm"  type="submit">Add Student</button>

                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            </form>
            <%@include  file="/WEB-INF/resources/templates/footer.jsp" %>
