<%-- 
    Document   : add-multi-choice-question
    Created on : Nov 7, 2020, 3:41:07 PM
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
            .h5{
                color: #de1b0c;
            }

        </style>

    </head>
    <body class="bg-light">
        <div class="col-md-7 col-lg-8">
            <div class="py-5 text-center">
                <h1 class="display3">Insert a New Question</h1>

            </div>
            <form class="container was-validated" action="${pageContext.request.contextPath}/teacher/exam/add-question" method="POST">
                <!--                <div class="md-form form-group mt-5">
                                    <label for="typeOfQuestionCode" class="form-label">Type Of Question:</label>
                                    <select class="selectpicker" name="typeOfQuestionCode" data-live-search="true">
                                        <option disabled selected>Type of Question Code</option>
                                        <option value="M04">M04(Multiple Choice(4)</option>
                                        <option value="L01">Long Answer</option>
                                    </select>
                                </div>-->

                <div class="md-form form-group mt-5">
                    <label for="subjectCode" class="form-label">Subject Code:</label>
                    <select class="mdb-select md-form" name="subjectCode">
                        <option selected disabled>Subject Code</option>
                        <c:forEach var="subject" items="${subjectList}">
                            <option value="${subject.subjectCode}">${subject.subjectCode}</option>
                        </c:forEach>

                    </select>
                </div>

                <div class="md-form form-group mt-5">
                    <label for="questionContext" class="form-label">Question Context:</label>
                    <input type="text" class="form-control" name="questionContext" placeholder="" value="" required>
                    <div class="invalid-feedback">
                        Please enter a valid Question Context.
                    </div>
                    <div class="valid-feedback">
                        a valid Question Context.
                    </div>
                </div>

                <div class="md-form form-group mt-5">
                    <label for="questionMark" class="form-label">Question Mark:</label>
                    <input type="text" class="form-control" name="questionMark" pattern="[0-9].{0,}" minlength="1" maxlength="3" required>
                    <div class="invalid-feedback">
                        Please enter a valid Question Mark.
                    </div>
                    <div class="valid-feedback">
                        a valid Question Mark.
                    </div>
                </div>
                <div class="md-form form-group mt-5">
                    <button class="btn btn-primary btn-lg btn-block" type="submit">Add Question</button>
                </div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            </form>
        </div>
        <script>
            $(document).ready(function () {
                $('.mdb-select').materialSelect();
            });
        </script>

<%@include  file="/WEB-INF/resources/templates/footer.jsp" %>
