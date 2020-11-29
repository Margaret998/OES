<%-- 
    Document   : student-header
    Created on : Nov 10, 2020, 8:15:59 PM
    Author     : looper
--%>

<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

                    <h3><a href="${pageContext.request.contextPath}/student">Dashboard</a></h3>
                </div>
                <ul class="list-unstyled menu-elements">
                    <li class="nav-item active  ">
                        <a class="nav-link" href="${pageContext.request.contextPath}/student">
                            Dashboard
                        </a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="${pageContext.request.contextPath}/student/update-student">
                            Profile
                        </a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="${pageContext.request.contextPath}/student/my-exams">
                            My Exams
                        </a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="${pageContext.request.contextPath}/student/exam/my-results">
                            My Results
                        </a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="${pageContext.request.contextPath}/student/reset-password">
                            Change Password
                        </a>
                    </li>
                </ul>
                <div class="btn-group">
                    <a class="btn btn-danger" href="${pageContext.request.contextPath}/login?logout" logout-processing-url="/j_spring_security_logout">Logout</a>
                </div>

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





































        <!--    
            
            
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>
                    Student Dashboard
                </title>
                <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
                     Fonts and icons     
                <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
                 CSS Files 
                <link type="text/css" href="https://demos.creative-tim.com/material-dashboard-dark/assets/css/material-dashboard.min.css?v=2.1.0" rel="stylesheet" />
                <style>
                    p{
                        color:yellow;
                    }
                </style>
        
            </head>
        
            <body class="dark-edition">
                <div class="wrapper ">
                    <div class="sidebar" data-color="danger" data-background-color="black" data-image="../assets/img/sidebar-2.jpg">
                        <input type="hidden" value="${username}" name="username" />
        
                        <div class="logo"><a href="#" class="simple-text logo-normal">
                                OES
                            </a></div>
                        <div class="sidebar-wrapper">
                            <ul class="nav">
                                <li class="nav-item active  ">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/student">
                                        <i class="material-icons">dashboard</i>
                                        <p>Dashboard</p>
                                    </a>
                                </li>
                                <li class="nav-item ">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/student/update-student">
                                        <i class="material-icons">person</i>
                                        <p>Profile</p>
                                    </a>
                                </li>
                                <li class="nav-item ">
                                    <a name="exams" class="nav-link" href="${pageContext.request.contextPath}/student/my-exams" id="exams">
                                        <i class="material-icons">library_books</i>
                                        <p>My Exams</p>
                                    </a>
                                </li>
                                <li class="nav-item ">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/student/exam/my-results">
                                        <i class="material-icons">library_books</i>
                                        <p>My Results</p>
                                    </a>
                                </li>
                                <li class="nav-item ">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/student/reset-password">
                                        <i class="material-icons">password</i>
                                        <p>Change Password</p>
                                    </a>
                                </li>
        
                                <li class="nav-item ">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/teacher/show-students">
                                        <i class="material-icons">person</i>
                                        <p>Show Students</p>
                                    </a>
                                </li>
                                <li class="nav-item ">
                                    <a class="nav-link" href="./notifications.html">
                                        <i class="material-icons">notifications</i>
                                        <p>Notifications</p>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="main-panel">
                         Navbar 
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
        
                        </html>-->
