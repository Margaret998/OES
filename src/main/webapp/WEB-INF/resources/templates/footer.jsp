<%-- 
    Document   : footer
    Created on : Nov 21, 2020, 11:54:57 PM
    Author     : looper
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
        #footer {
            position: relative;
            bottom: 0;
            width: 100%;
        }
    </style>
    <footer id="footer">
        <p class="pull-right"><a href="#">Back to top</a></p>
        <p>&copy; 2020 OES &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
    </footer>
</div>
</div>

<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>


<script src="<c:url value="/js/jquery-3.5.1.slim.min.js" />"></script>
<script src="<c:url value="/js/bootstrap.bundle.min.js" />"></script>
<script src="<c:url value="/js/jquery-3.3.1.min.js" />"></script>
<script src="<c:url value="/js/jquery-3.4.1.min.js" />"></script>
<script src="<c:url value="/js/scripts.js" />"></script>
<script src="<c:url value="/js/jquery.mCustomScrollbar.concat.min.js" />" ></script>
<script src="<c:url value="/js/jquery.waypoints.min.js" />" ></script>
<script src="<c:url value="/js/jquery.backstretch.min.js" />" ></script>
<script src="<c:url value="/js/jquery-migrate-3.0.0.min.js" />" ></script>
<script src="<c:url value="/js/wow.min.js" />" ></script>
<script src="<c:url value="/js/validator.min.js" />" ></script>
</body>
</html>
