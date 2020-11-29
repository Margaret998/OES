<%-- 
    Document   : manage-teacher-classes
    Created on : Nov 23, 2020, 10:31:34 AM
    Author     : looper
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="/WEB-INF/resources/templates/admin-header.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Teachers Manager</title>

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
                <h1 class="display-4">Teacher Classes Assign</h1>
                <form action="${pageContext.request.contextPath}/admin/manage-teacher-classes" method="POST">

                    <div class="md-form form-group mt-5">
                        <label for="teacherID" class="form-label">Teacher ID</label>
                        <select class="mdb-select md-form" name="teacherID" required>
                            <option selected disabled>Teacher ID :: Name :: College</option>
                            <c:forEach var="tList" items="${teachersList}">
                                <option value="${tList.teacherID}">${tList.teacherID} :: ${tList.fullname} :: ${tList.teacherCollege}</option>
                            </c:forEach>

                        </select>
                    </div>
                    <div class="md-form form-group mt-5">
                        <label for="subjectCode" class="form-label">Subject Code</label>
                        <select class="mdb-select md-form" name="subjectCode" required>
                            <option selected disabled>Subject</option>
                            <c:forEach var="sList" items="${subjectsList}">
                                <option value="${sList.subjectCode}">${sList.subjectCode}</option>
                            </c:forEach>

                        </select>
                    </div>
                    <div class="md-form form-group mt-5">
                        <label for="classCode" class="form-label">Class</label>
                        <select class="mdb-select md-form" name="classCode" required>
                            <option selected disabled>Class :: College</option>
                            <c:forEach var="cList" items="${classesList}">
                                <option value="${cList.classCode}"> ${cList.classCode} :: ${cList.classCollege}</option>
                            </c:forEach>

                        </select>
                    </div>

                    <div class="md-form form-group mt-5">
                        <button class="btn btn-primary btn-lg btn-block" type="submit">Assign Teacher</button>
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                </form>

                <br><br>
                <hr><hr>
                <br><br>

                <h1 class="display-4">Assigned Teachers List</h1>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Teacher ID</th>
                            <th scope="col">Subject</th>
                            <th scope="col">Class</th>
                            <th scope="col">Remove</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="aList" items="${assignedTeachersList}" varStatus="list">
                            <tr>
                                <td scope="row">${list.count}</td>
                                <td>${aList.teacherID}</td>
                                <td>${aList.subjectCode}</td>
                                <td>${aList.classCode}</td>
                                <td><a href="${pageContext.request.contextPath}/admin/remove-assigned-teacher?teacherID=${aList.teacherID}&&classCode=${aList.classCode}&&subjectCode=${aList.subjectCode}">Remove</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <%@include  file="/WEB-INF/resources/templates/footer.jsp" %>
