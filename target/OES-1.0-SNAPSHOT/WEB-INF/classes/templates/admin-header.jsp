<%-- 
    Document   : admin-header
    Created on : Nov 10, 2020, 8:15:33 PM
    Author     : looper
--%>

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



        <style><%@include  file="/WEB-INF/resources/css/style.css" %>
        </style>
        <style><%@include  file="/WEB-INF/resources/css/animate.css" %>
        </style>
        <style><%@include  file="/WEB-INF/resources/css/jquery.mCustomScrollbar.min.css" %>
        </style>
        
        <style>
            .content{
                margin-top: 100px;
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
                    <h3><a href="${pageContext.request.contextPath}/admin">Dashboard</a></h3>
                </div>
                <ul class="list-unstyled menu-elements">
                    <li class="nav-item active  ">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin">
                            Dashboard
                        </a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/add-teacher">
                            Add Teacher
                        </a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/add-student">
                            Add Student
                        </a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/remove-user">
                            Remove User
                        </a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/show-teachers">
                            Show Teachers
                        </a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/show-students">
                            Show Students
                        </a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/manage-subjects">
                            Manage Subjects
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

        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>


        <script>        <%@include  file="/WEB-INF/resources/js/scripts.js" %>
        </script>
        <script>        <%@include  file="/WEB-INF/resources/js/jquery.mCustomScrollbar.concat.min.js" %>
        </script>
        <script>        <%@include  file="/WEB-INF/resources/js/jquery.waypoints.min.js" %>
        </script>
        <script>        <%@include  file="/WEB-INF/resources/js/jquery.backstretch.min.js" %>
        </script>
        <script>        <%@include  file="/WEB-INF/resources/js/jquery-migrate-3.0.0.min.js" %>
        </script>
        <script>        <%@include  file="/WEB-INF/resources/js/wow.min.js" %>
        </script>

    </body>
</html>
