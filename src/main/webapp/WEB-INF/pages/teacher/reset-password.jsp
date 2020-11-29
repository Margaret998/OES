<%-- 
    Document   : resetPassword
    Created on : Nov 21, 2020, 12:38:09 AM
    Author     : looper
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include  file="/WEB-INF/resources/templates/teacher-header.jsp" %>

<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reset Password</title>


        <style>

            .col-md-7 {
                margin-left: 300px;
            }
        </style>
    </head>
    <body class="bg-light">
        <div class="container">
            <div class="py-5 text-center">
                <h1 class="display3">Reset Password</h1>
            </div>


            <form class="container was-validated" action="${pageContext.request.contextPath}/teacher/reset-password" method="POST">

                <div class="md-form form-group mt-5">
                    <label for="oldPassword" class="disabled">Current Password</label>
                    <input type="password" class="form-control" name="oldPassword" pattern=".{6,}" minlength="6" data-error="Incorrect password, Try Again !"  required />
                    <div class="invalid-feedback">
                        Valid old password is required.
                    </div>
                    <div class="valid-feedback">
                        Valid password .
                    </div>
                </div>
                <div class="md-form form-group mt-5">
                    <label for="newPassword" class="form-label">New Password</label>
                    <input type="password" class="form-control" name="newPassword" pattern=".{6,}" minlength="6" data-error="At least 6 characters" required>
                    <div class="invalid-feedback">
                        Valid password is required.
                    </div>
                    <div class="valid-feedback">
                        Valid password .
                    </div>
                </div>
                <div class="form-row">
                    <button class="btn btn-primary btn-lg btn-block" type="submit">Reset Password</button>
                </div>

                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
        </div>

<%@include  file="/WEB-INF/resources/templates/footer.jsp" %>
