<%-- 
    Document   : admin-header
    Created on : Nov 10, 2020, 8:15:33 PM
    Author     : looper
--%>



<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html>

    <head>

        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <title>Dashboard</title>

        <!-- CSS -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500&display=swap">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">




        <link rel="stylesheet" href="<c:url value="/css/style.css" />" />
        <link rel="stylesheet" href="<c:url value="/css/animate.css" />" />
        <link rel="stylesheet" href="<c:url value="/css/jquery.mCustomScrollbar.min.css" />" />

        <style>
            .content{
                margin-top: 100px;
            }
            .table{
                margin-left: 100px;
            }
            form{
                margin-left: 100px;

            }


        </style>
    </head>

    <body>

        <div class="wrapper">
            
            <nav class="sidebar ">
                
                <div class="dismiss">
                    <i class="fas fa-arrow-left"></i>
                </div>

                <div class="logo">

                    <security:authorize access="isAuthenticated()">
                        Welcome back, <security:authentication property="principal.username" /> 
                    </security:authorize>

                    <h3><a href="${pageContext.request.contextPath}/admin">Dashboard</a></h3>
                </div>


                <ul class="list-unstyled menu-elements">
                    <li class="nav-item active  ">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin">
                            Dashboard
                        </a>
                    </li>
                    <li>
                        <a href="#otherSections" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle" role="button" aria-controls="otherSections">
                            Manage Teachers
                        </a>
                        <ul class="collapse list-unstyled" id="otherSections">
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/add-teacher">Add Teacher</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/show-teachers">Show Teachers</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/manage-teacher-classes">Manage Teachers Classes</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#otherSections2" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle" role="button" aria-controls="otherSections">
                            Manage Students
                        </a>
                        <ul class="collapse list-unstyled" id="otherSections2">
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/add-student">Add Student</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/show-students">Show Students</a>
                            </li>

                        </ul>
                    </li>

                    <li class="nav-item ">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/manageColleges">
                            Manage Colleges
                        </a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/manageClasses">
                            Manage Classes
                        </a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/manage-subjects">
                            Manage Subjects
                        </a>
                    </li>

                    <li class="nav-item ">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/remove-user">
                            Remove User
                        </a>
                    </li>


                </ul>
                <a class="btn btn-danger" href="<c:url value="/login?logout"/>" logout-processing-url="/j_spring_security_logout">Logout</a>

                <div class="dark-light-buttons">
                    <a class="btn btn-primary btn-customized-4 btn-customized-dark" href="#" role="button">Dark</a>
                    <a class="btn btn-primary btn-customized-4 btn-customized-light" href="#" role="button">Light</a>
                </div>

            </nav>
            <!-- NavBar END -->

            <div class="content">

                <!-- open sidebar menu -->
                <a class="btn btn-primary btn-customized open-menu" href="#" role="button">
                    <i class="fas fa-align-left"></i> <span>Menu</span>
                </a>

            </div>
        </div>
