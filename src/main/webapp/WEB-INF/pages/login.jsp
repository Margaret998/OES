<%-- 
    Document   : login
    Created on : Oct 26, 2020, 9:03:26 AM
    Author     : looper
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>OES Sign-in Page</title>

        <style>
            <%@ include file="../resources/css/login.css"%>
        </style>
    </head>
    <body>
        <div class="container">
            <section id="content">
                <div id="login-box">


                    <form action="${pageContext.request.contextPath}/login" login-processing-url = "/j_spring_security_check" method="POST">

                        <h1>Login Page</h1>
                        <div>
                            <input type="text" placeholder="UserID" required="" name="userID" />
                        </div>
                        <div>
                            <input type="password" placeholder="Password" required="" name="password" />
                        </div>
                        <div>
                            <input type="submit" value="Login" />
                        </div>

                        <c:if test="${not empty msg}">
                            <div class="msg">${msg}</div>
                        </c:if>
                        <c:if test="${not empty error}">
                            <div class="error" style="color:#FF0000">${error}</div>
                        </c:if>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form>
                </div>

            </section>
        </div>

        <script>
            <%@include file="../resources/js/login.js" %>
        </script>
    </body>
</html>
