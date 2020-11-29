<%-- 
    Document   : profile
    Created on : Nov 2, 2020, 10:23:41 AM
    Author     : looper
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include  file="/WEB-INF/resources/templates/student-header.jsp" %>

<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Profile</title>


        <style>

            .col-md-7 {
                margin-left: 300px;
            }
        </style>
    </head>
    <body class="bg-light">
        <div class="container">
            <div class="py-5 text-center">
                <h1 class="display3">Student Profile</h1>
            </div>


            <form class="container was-validated" action="${pageContext.request.contextPath}/student/update-student" method="POST">

                <div class="md-form form-group mt-5">
                    <label for="studentID" class="disabled">Student-ID</label>
                    <input type="text" class="form-control" name="studentID"  value="${studentList.get(0).studentID}"  disabled />

                </div>
                <div class="md-form form-group mt-5">
                    <label for="fullName" class="form-label">Full Name:</label>
                    <input type="text" class="form-control" name="fullName"  value="${studentList.get(0).fullName}" disabled>

                </div>
                <div class="md-form form-group mt-5">
                    <label for="collegeName" class="form-label">College Name:</label>
                    <input type="text" class="form-control" name="collegeName"  value="${studentList.get(0).collegeName}" disabled>

                </div>
                <div class="md-form form-group mt-5">
                    <label for="classCode" class="form-label">Class:</label>
                    <input type="text" class="form-control" name="classCode"  value="${studentList.get(0).classCode}" disabled>

                </div>
                <div class="md-form form-group mt-5">
                    <label for="gender" class="form-label">Gender:</label>
                    <select class="form-select"  name="gender" required>
                        <option id="gender">Gender:</option>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                    </select>

                </div>
                <div class="md-form form-group mt-5">
                    <label for="email" class="form-label">E-mail:</label>
                    <input type="text" class="form-control" name="email" pattern="[0-9a-z._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" data-error="email@email.com" value="${studentList.get(0).email}" required>
                    <div class="invalid-feedback">
                        Valid email is required.
                    </div>
                    <div class="valid-feedback">
                        Valid email.
                    </div>
                </div>
                <div class="md-form form-group mt-5">
                    <label for="phone" class="form-label">phone:</label>
                    <input type="text" class="form-control" name="phone" pattern="[0-9]{11}" minlength="11" maxlength="11" data-error="11 digits phone number!" value="${studentList.get(0).phone}" required>
                    <div class="invalid-feedback">
                        Valid phone is required.
                    </div>
                    <div class="valid-feedback">
                        Valid phone .
                    </div>
                </div>
                <div class="md-form form-group mt-5">
                    <button class="btn btn-primary btn-lg btn-block" type="submit">Update Profile</button>
                </div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            </form>
        </div>

    </div>

    <script src="<c:url value="/js/jquery-3.5.1.slim.min.js" />"></script>
    <script>
        $(function () {
            document.getElementById("gender").innerHTML=('${studentList.get(0).gender}');
        });
    </script>
    <%@include  file="/WEB-INF/resources/templates/footer.jsp" %>
