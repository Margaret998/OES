<%-- 
    Document   : exam
    Created on : Nov 8, 2020, 1:01:48 PM
    Author     : looper
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include  file="/WEB-INF/resources/templates/teacher-header.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exam</title>

        <style>


            .col-md-7 {
                margin-left: 100px;
            }

        </style>

    </head>
    <body>
        <div class="container">



            <div class="col-md-7 col-lg-8">
                <div class="py-5 text-center">
                    <h1 class="display3">Generate an Exam</h1>
                </div>
                <form class="needs-validation" action="${pageContext.request.contextPath}/teacher/exam/generate-exam" method="POST">
                    <div class="md-form form-group mt-5">
                        <label for="examName" class="form-label">Exam Name:</label>
                        <input type="text" class="form-control" name="examName" required />
                    </div>

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
                        <label for="examDescription" class="form-label">Exam Description</label>
                        <input type="text" class="form-control" name="examDescription" placeholder="" value="" required>
                        <div class="invalid-feedback">
                            Please enter a valid Exam Description.
                        </div>
                    </div>

                    <div class="md-form form-group mt-5">
                        <label for="examDate" class="form-label">Exam Date</label>
                        <div class="input-group date" data-provide="datepicker">
                            <input type="date" name="examDate" class="form-control" data-date-format="mm/dd/yyyy">
                            <div class="input-group-addon">
                                <span class="glyphicon glyphicon-th"></span>
                            </div>
                        </div>
                        <div class="invalid-feedback">
                            Please select a valid Date.
                        </div>
                    </div>

                    <div class="md-form form-group mt-5">
                        <label for="examTime" class="form-label">Exam Period:</label>
                        <input type="text" class="form-control" name="examTime" placeholder="" value="" required>
                        <div class="invalid-feedback">
                            Please enter a valid Exam Time.
                        </div>
                    </div>

                    <div class="md-form form-group mt-5">
                        <label for="numberOfQuestions" class="form-label">Number Of Questions</label>
                        <input type="text" class="form-control" name="numberOfQuestions" required />
                    </div>
                    <div class="md-form form-group mt-5">
                        <button class="btn btn-primary btn-lg btn-block" type="submit">Generate Exam</button>
                    </div>
            </div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

        </form>
    </div>
    <%@include  file="/WEB-INF/resources/templates/footer.jsp" %>
