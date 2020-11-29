<%-- 
    Document   : profile
    Created on : Nov 2, 2020, 10:24:04 AM
    Author     : looper
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include  file="/WEB-INF/resources/templates/teacher-header.jsp" %>

<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Student</title>


        <style>

            .col-md-7 {
                margin-left: 100px;
            }
        </style>
    </head>
    <body class="bg-light">
        <div class="container">
            <div class="py-5 text-center">
                <h1 class="display3">Teacher Profile</h1>
            </div>


            <form action="${pageContext.request.contextPath}/teacher/update-teacher" method="POST">

                <div class="md-form form-group mt-5">
                    <label for="teacherID" class="disabled">Teacher-ID</label>
                    <input type="text" class="form-control" name="teacherID" placeholder="" value="${teacherList.get(0).teacherID}" disabled  />

                </div>
                <div class="md-form form-group mt-5">
                    <label for="fullName" class="form-label">Full Name:</label>
                    <input type="text" class="form-control" name="fullName" placeholder="" value="${teacherList.get(0).fullname}" required>

                </div>
                <div class="md-form form-group mt-5">
                    <label for="teacherCollege" class="form-label">College Name:</label>
                    <input type="text" class="form-control" name="teacherCollege" placeholder="" value="${teacherList.get(0).teacherCollege}" required>

                </div>
                <div class="md-form form-group mt-5">
                    <label for="gender" class="form-label">Gender:</label>
                    <select class="form-select" name="gender">
                        <option id="gender">Gender:</option>
                        <option value="male">Male</option>
                        <option value="female">Female</option>
                    </select>

                </div>
                <div class="md-form form-group mt-5">
                    <label for="email" class="form-label">E-mail:</label>
                    <input type="text" class="form-control" name="email" placeholder="" value="${teacherList.get(0).email}" required>
                    <div class="invalid-feedback">
                        Valid email is required.
                    </div>
                </div>
                <div class="md-form form-group mt-5">
                    <label for="phone" class="form-label">phone:</label>
                    <input type="text" class="form-control" name="phone" placeholder="" value="${teacherList.get(0).phone}" required>
                    <div class="invalid-feedback">
                        Valid phone is required.
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
            document.getElementById("gender").innerHTML = ('${teacherList.get(0).gender}');
        });
    </script>

    <%@include  file="/WEB-INF/resources/templates/footer.jsp" %>
