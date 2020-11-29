<%-- 
    Document   : show-students
    Created on : Nov 20, 2020, 11:55:45 AM
    Author     : looper
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="/WEB-INF/resources/templates/admin-header.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Students</title>
        <script src="<c:url value="/js/jquery-3.3.1.min.js" />"></script>
        <script type="text/javascript">
            $(document).ready(function () {

                $('#collegeCombobox').on('change', function () {
                    var collegeName = $(this).val();
                    $.ajax({
                    type: 'GET',
                            url: '${pageContext.request.contextPath}/admin/classes/loadClassesByCollege/' + collegeName,
                            success: function(result) {
                            var result = JSON.parse(result);
                                    var s = '';
                                    for (var i = 0; i < result.length; i++) {
                            s += '<option value="' + result[i].classCode + '">' + result[i].classCode + '</option>';
                            }
                            $('#classeCombobox').html(s);
                            }
                    });
                });
            });



        </script>
        <style>
            .col-md-7 {
                margin-left: 100px;
            }
            .h5{
                color: #de1b0c;
            }
        </style>
    </head>
    <body>
        <div class="col-md-7 col-lg-8">
            <div class="py-5 text-center">

                <form action="${pageContext.request.contextPath}/admin/show-students" method="POST">
                    <div class="md-form form-group mt-5">
                        <label for="collegeName" class="form-label">College</label>
                        <select id="collegeCombobox" class="mdb-select md-form" name="collegeName" required>
                            <option selected disabled>College</option>
                            <c:forEach var="ccList" items="${collegesList}">
                                <option value="${ccList.collegeName}">${ccList.collegeName}</option>
                            </c:forEach>

                        </select>
                    </div>
                    <div class="md-form form-group mt-5">
                        <label for="classCode" class="form-label">Class</label>
                        <select id="classeCombobox" class="mdb-select md-form" name="classCode" required>


                        </select>
                    </div>

                    <div class="md-form form-group mt-5">
                        <button class="btn btn-primary btn-lg btn-block" type="submit">Show Students</button>
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                </form>

                <h1 class="display-3">Students List</h1>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Student ID</th>
                            <th scope="col">Student Name</th>
                            <th scope="col">Gender</th>
                            <th scope="col">College</th>
                            <th scope="col">Class</th>
                            <th scope="col">Password Reset</th>
                            <th scope="col">Remove</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="sdList" items="${studentsList}" varStatus="list">
                            <tr>
                                <td scope="row">${list.count}</td>
                                <td>${sdList.studentID}</td>
                                <td>${sdList.fullName}</td>
                                <td>${sdList.gender}</td>
                                <td>${sdList.collegeName}</td>
                                <td>${sdList.classCode}</td>
                                <td><a href="${pageContext.request.contextPath}/admin/reset-password?userID=${sdList.studentID}">Reset Password</a></td>
                                <td><a href="${pageContext.request.contextPath}/admin/remove-student?userID=${sdList.studentID}">Remove Student</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <%@include  file="/WEB-INF/resources/templates/footer.jsp" %>

