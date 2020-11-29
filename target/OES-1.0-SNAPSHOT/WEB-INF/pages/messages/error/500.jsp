<%-- 
    Document   : 500
    Created on : Nov 22, 2020, 11:03:06 AM
    Author     : looper
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>500 Error</title>
        <style>
            .center {
                display: block;
                margin-left: auto;
                margin-right: auto;
                width: 50%;
            }
        </style>
    </head>
    <body>
        <img src="<c:url value="/img/500.jpg" />"  class="center"/>
    </body>
</html>
