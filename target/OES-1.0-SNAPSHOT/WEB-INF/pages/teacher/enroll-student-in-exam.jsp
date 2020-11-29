<%-- 
    Document   : enroll-student-in-exam
    Created on : Nov 15, 2020, 4:16:24 PM
    Author     : looper
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include  file="/WEB-INF/resources/templates/teacher-header.jsp" %>

<!DOCTYPE html>
<html>
    <link rel="stylesheet" href="<c:url value="/css/bootstrap-table.min.css" />" />
    <link rel="stylesheet" href="<c:url value="/css/dataTables.checkboxes.css" />" />
    <link rel="stylesheet" href="<c:url value="/css/datatables.min.css" />" />
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/fixedcolumns/3.3.2/css/fixedColumns.dataTables.min.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/select/1.3.1/css/select.dataTables.min.css" />





    <body class="bg-light">
        <div class="container">



            <div class="col-md-7 col-lg-8">
                <div class="py-5 text-center">
                    <h1>Enroll Student</h1>
                </div>
                <form id="myForm" class="needs-validation" action="${pageContext.request.contextPath}/teacher/students/enrollStudent" method="POST">
                    <div class="col-md-7 col-lg-8">
                        <label for="studentID" class="form-label">Student Name/ID</label>
                        <select class="form-select" name="studentID">
                            <option >Student ID :: Student Name</option>
                            <c:forEach var="studentName" items="${students}">
                                <option value="${studentName.studentID}">${studentName.studentID} :: ${studentName.fullName}</option>
                            </c:forEach>

                        </select>
                    </div>

                    <div class="col-md-7 col-lg-8">
                        <label for="examID" class="form-label">Exam</label>
                        <select class="form-select" name="examID">
                            <option >Exam Name</option>
                            <c:forEach var="examName" items="${exams}">
                                <option value="${examName.examID}">${examName.examName}</option>
                            </c:forEach>

                        </select>
                    </div>
                    <button class="btn btn-primary btn-lg btn-block" type="submit">Enroll Student</button>
            </div>

            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

        </form>

    </div>

    <script>
        $(function () {

            // Header Master Checkbox Event
            $("#masterCheck").on("click", function () {
                if ($("input:checkbox").prop("checked")) {
                    $("input:checkbox[name='row-check']").prop("checked", true);
                } else {
                    $("input:checkbox[name='row-check']").prop("checked", false);
                }
            });

            // Check event on each table row checkbox
            $("input:checkbox[name='row-check']").on("change", function () {
                var total_check_boxes = $("input:checkbox[name='row-check']").length;
                var total_checked_boxes = $("input:checkbox[name='row-check']:checked").length;

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
