<%-- 
    Document   : remove-user
    Created on : Nov 20, 2020, 11:37:02 AM
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

        <title>Remove User</title>
    </head>
    <body>
        <div class="container">
            <div class="py-5 text-center">
                <h1>Remove User</h1>
            </div>

            <form action="${pageContext.request.contextPath}/admin/remove-user" method="POST">
                <div class="md-form form-group mt-5">
                    <label for="userID" class="form-label">User ID:</label>
                    <input type="text" class="form-control" name="userID" placeholder="" value="" required>
                    <div class="invalid-feedback">
                        Valid User ID is required.
                    </div>
                </div>
                <div class="md-form form-group mt-5">
                    <button class="btn btn-primary btn-lg btn-block" type="submit">Remove User</button>
                </div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            </form>
        </div>
<%@include  file="/WEB-INF/resources/templates/footer.jsp" %>
