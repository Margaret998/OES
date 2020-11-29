<%-- 
    Document   : get-all-enrolled
    Created on : Nov 16, 2020, 11:04:41 AM
    Author     : looper
--%>

<%@page import="com.pct.oes.model.ExamStudentsModel"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include  file="/WEB-INF/resources/templates/teacher-header.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="<c:url value="/js/jquery-3.4.1.min.js" />"></script>



        <style>
            .col-md-7 {
                margin-left: 100px;
            }
            .h5{
                color: #de1b0c;
            }
        </style>
        <title>All Enrolled Students</title>
    </head>
    <div class="col-md-7 col-lg-8">
        <div class="py-5 text-center">
            <h1 class="display3">Exam Enrolled Students</h1>
            <br/><br/>
            <form action="${pageContext.request.contextPath}/teacher/students/enrolled-students" method="POST">

                <table id="dt-multi-checkbox" class="table">
                    <thead>
                        <tr>
                            <th scope="col">
                                <input class="form-check-input" type="checkbox" id="masterCheck" value="checkUncheckAll"/>
                                <br/>
                            </th> 
                            <th scope="col">#</th> 
                            <th scope="col">Student Name</th> 
                            <th scope="col">Student ID</th> 
                            <th scope="col">Exam ID</th>
                            <th scope="col">Exam Name</th>
                            <th scope="col">Unenroll</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="student" items="${enrolledStudents}" varStatus="list">
                            <tr>

                                <th scope="row">
                                    <input class="form-check-input" type="checkbox" id="row-check" name="row-check" value="${student.studentID}"/>
                                </th>
                                <th scope="row">${list.count}</th>
                                <td>${student.fullName}</td>
                                <td>${student.studentID}</td>
                                <td>${student.examID}</td>
                                <td>${student.examName}</td>
                                <td><a href="${pageContext.request.contextPath}/teacher/exam/student-unenroll?studentID=${student.studentID}&examID=${student.examID}">Unenroll</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <button typ="submit">Remove</button>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            </form>
        </div>
    </div>

    <script>
        $(function () {

            // Header Master Checkbox Event
            $("#masterCheck").on("click", function () {
                if ($("input:checkbox").prop("checked")) {
                    $("input:checkbox[id='row-check']").prop("checked", true);
                } else {
                    $("input:checkbox[id='row-check']").prop("checked", false);
                }
            });

            // Check event on each table row checkbox
            $("input:checkbox[id='row-check']").on("change", function () {
                var total_check_boxes = $("input:checkbox[id='row-check']").length;
                var total_checked_boxes = $("input:checkbox[id='row-check']:checked").length;

                // If all checked manually then check master checkbox
                if (total_check_boxes === total_checked_boxes) {
                    $("#masterCheck").prop("checked", true);
                } else {
                    $("#masterCheck").prop("checked", false);
                }
            });
        });
    </script>

    <%@include  file="/WEB-INF/resources/templates/footer.jsp" %>
