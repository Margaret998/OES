<%-- 
    Document   : teacher-header
    Created on : Nov 10, 2020, 8:15:47 PM
    Author     : looper
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <title>
            Teacher Dashboard
        </title>
        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
        <!--     Fonts and icons     -->
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
        <!-- CSS Files -->
        <link type="text/css" href="https://demos.creative-tim.com/material-dashboard-dark/assets/css/material-dashboard.min.css?v=2.1.0" rel="stylesheet" />

        <style>
            p{
                color:yellow;
            }
            
            
        </style>
    </head>

    <body class="dark-edition" >
        <div class="wrapper ">
            <div class="sidebar" data-color="danger" data-background-color="black" data-image="../assets/img/sidebar-2.jpg">
                <input type="hidden" value="${username}" name="username" />

                <div class="logo"><a href="#" class="simple-text logo-normal">
                        OES
                    </a></div>
                <div class="sidebar-wrapper">
                    <ul class="nav">
                        <li class="nav-item active  ">
                            <a class="nav-link" href="${pageContext.request.contextPath}/teacher">
                                <i class="material-icons">dashboard</i>
                                <p>Dashboard</p>
                            </a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="${pageContext.request.contextPath}/teacher/update-teacher">
                                <i class="material-icons">person</i>
                                <p>Profile</p>
                            </a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="${pageContext.request.contextPath}/teacher/exam/add-question">
                                <i class="material-icons">library_books</i>
                                <p>Add Question</p>
                            </a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="${pageContext.request.contextPath}/teacher/exam/show-questions">
                                <i class="material-icons">library_books</i>
                                <p>Show Questions</p>
                            </a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="${pageContext.request.contextPath}/teacher/exam/generate-exam">
                                <i class="material-icons">library_books</i>
                                <p>Generate Exam</p>
                            </a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="${pageContext.request.contextPath}/teacher/exam/ready-exams-list">
                                <i class="material-icons">library_books</i>
                                <p>Generated Exams List</p>
                            </a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="${pageContext.request.contextPath}/teacher/show-students">
                                <i class="material-icons">person</i>
                                <p>Show Students</p>
                            </a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="${pageContext.request.contextPath}/teacher/students/enrollStudent">
                                <i class="material-icons">person</i>
                                <p>Enroll Students</p>
                            </a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="${pageContext.request.contextPath}/teacher/students/enrolled-students">
                                <i class="material-icons">person</i>
                                <p>Show Enrolled Students</p>
                            </a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="${pageContext.request.contextPath}/teacher/reset-password">
                                <i class="material-icons">password</i>
                                <p>Change Password</p>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="main-panel">
                <!-- Navbar -->
                <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top " id="navigation-example">
                    <div class="container-fluid">
                        <div class="navbar-wrapper">
                            <a class="navbar-brand" href="javascript:void(0)">Dashboard</a>
                        </div>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation" data-target="#navigation-example">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="navbar-toggler-icon icon-bar"></span>
                            <span class="navbar-toggler-icon icon-bar"></span>
                            <span class="navbar-toggler-icon icon-bar"></span>
                        </button>
                        <div class="collapse navbar-collapse justify-content-end">
                            <form class="navbar-form">
                                <div class="input-group no-border">
                                    <input type="text" value="" class="form-control" placeholder="Search...">
                                    <button type="submit" class="btn btn-default btn-round btn-just-icon">
                                        <i class="material-icons">search</i>
                                        <div class="ripple-container"></div>
                                    </button>
                                </div>
                            </form>

                        </div>
                    </div>
                </nav>

                </body>

                </html>
