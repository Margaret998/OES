<%-- 
    Document   : add-multiple-choice
    Created on : Nov 7, 2020, 4:48:39 PM
    Author     : looper
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include  file="/WEB-INF/resources/templates/teacher-header.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Question</title>

        <style>

            .col-md-7 {
                margin-left: 100px;
            }

        </style>

    </head>
    <body >

        <div class="col-md-7 col-lg-8">
            <div class="py-5 text-center">

                <h1 class="display3">Add Multiple Choice Question</h1>

            </div>
            <form class="container was-validated" action="${pageContext.request.contextPath}/teacher/exam/add-multi-choice?questionID=${questionID}" method="POST">
                <div class="row g-3">

                    <input type="hidden" value="${questionID}" name="questionID" />

                    <div class="md-form form-group mt-5">
                        <label for="choice1" class="form-label">First Choice:</label>
                        <input type="text" class="form-control" name="choice1" required>
                        <div class="invalid-feedback">
                            Please enter a valid Choice.
                        </div>
                    </div>
                    <div class="md-form form-group mt-5">
                        <label for="choice2" class="form-label">Second Choice:</label>
                        <input type="text" class="form-control" name="choice2" required>
                        <div class="invalid-feedback">
                            Please enter a valid Choice.
                        </div>
                    </div>
                    <div class="md-form form-group mt-5">
                        <label for="choice3" class="form-label">Third Choice:</label>
                        <input type="text" class="form-control" name="choice3" required>
                        <div class="invalid-feedback">
                            Please enter a valid Choice.
                        </div>
                    </div>
                    <div class="md-form form-group mt-5">
                        <label for="choice4" class="form-label">Fourth Choice:</label>
                        <input type="text" class="form-control" name="choice4" required>
                        <div class="invalid-feedback">
                            Please enter a valid Choice.
                        </div>
                    </div>

                    <div class="md-form form-group mt-5">
                        <label for="rightAnswer" class="form-label">Right Answer:</label>
                        <input type="text" class="form-control" name="rightAnswer" pattern="[0-4]" maxlength="1" required>
                        <div class="invalid-feedback">
                            Please enter a valid Right Answer. (Choice Number)
                        </div>
                        <div class="valid-feedback">
                            a valid Right Answer. (Choice Number)
                        </div>
                    </div>

                    <div class="md-form form-group mt-5">
                        <button class="btn btn-primary btn-lg btn-block" type="submit">Add Choices</button>
                    </div>
                </div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            </form>
        </div>
        <%@include  file="/WEB-INF/resources/templates/footer.jsp" %>
