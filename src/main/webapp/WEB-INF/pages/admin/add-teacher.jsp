<%-- 
    Document   : add-teacher
    Created on : Oct 31, 2020, 2:50:47 PM
    Author     : looper
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="/WEB-INF/resources/templates/admin-header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Teacher</title>

        <style>

            .col-md-7 {
                margin-left: 300px;
            }
            .has-error label,
            .has-error input,
            .has-error textarea {
                color: red;
                border-color: red;
            }
        </style>

    </head>
    <body class="bg-light">
        <div class="container">
            <div class="py-5 text-center">
                <h1>Add New Teacher</h1>
            </div>



            <form class="container was-validated" action="${pageContext.request.contextPath}/admin/add-teacher"  method="POST" data-toggle="validator">


                <div class="md-form form-group mt-5">
                    <label for="fullName" class="form-label">Full Name</label>
                    <input type="text" class="form-control" name="fullName" pattern="[A-Za-z].{2,}" data-error="Please Enter a Name" minlength="2" maxlength="20" required>
                    <div class="invalid-feedback">
                        Valid Name is required.
                    </div>
                    <div class="valid-feedback">
                        Valid Name.
                    </div>
                </div>
                <div class="md-form form-group mt-5">
                    <label for="userID" class="form-label">Teacher-ID</label>
                    <input type="text" class="form-control" name="userID" data-error="No More No Less than 10 digits" pattern="[0-9]{10}" maxlength="10" min="10" required />
                    <div class="invalid-feedback">
                        Valid Teacher ID is required.
                    </div>
                    <div class="valid-feedback">
                        Valid Teacher ID .
                    </div>
                </div>

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
                    <label for="password" class="form-label">password:</label>
                    <input type="password" class="form-control" pattern=".{6,}" name="password" minlength="6" data-error="Have at least 6 characters" required>
                    <div class="invalid-feedback">
                        Valid password is required.
                    </div>
                    <div class="valid-feedback">
                        Valid password .
                    </div>
                </div>
                <div class="form-row">
                    <button class="btn btn-primary btn-lg btn-block" type="submit">Add Teacher</button>
                </div>

                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
        </div>

        <%@include  file="/WEB-INF/resources/templates/footer.jsp" %>
