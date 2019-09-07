<%--
  Created by IntelliJ IDEA.
  User: Antu
  Date: 06/09/2019
  Time: 03:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%@tag description="Simple Wrapper Tag" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html >
<head>
    <title>User Portal</title>
    <%@ include file="../jsp/partials/css.jsp"%>
    <%@ include file="../jsp/partials/js.jsp"%>
</head>
<body style="overflow-x: hidden">
<nav class="navbar navbar-expand-lg navbar-light"  style="background-color: #7AB375;">
    <sec:authorize access="hasAnyAuthority('admin')">
        <a class="navbar-brand" href="${pageContext.servletContext.contextPath}/admin">User Portal</a>
    </sec:authorize>
    <sec:authorize access="hasAnyAuthority('user')">
        <a class="navbar-brand" href="${pageContext.servletContext.contextPath}/profile">User Portal</a>
    </sec:authorize>
    <ul class="navbar-nav ml-auto">
        <li class="nav-item dropdown ">

            <a id="drpMenubtn" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <%String fullName = (String) session.getAttribute("FULL_NAME");%>
                <%=fullName%>
            </a>
            <div class="dropdown-menu" style="margin-left: -50px"  aria-labelledby="navbarDropdown" id="drpMenu">
                <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/logout">Log Out</a>
            </div>
        </li>
    </ul>
</nav>

<div class="row">
    <div class="col-md-3" style="margin-left: 0%; background-color: #3B3B3D">
        <ul>
            <sec:authorize access="hasAnyAuthority('admin')">
                <a class="" href="${pageContext.servletContext.contextPath}/admin"><button class="btn btn container m-1">User-list</button></a>
            </sec:authorize>
            <sec:authorize access="hasAnyAuthority('user')">
                <a class="" href="${pageContext.servletContext.contextPath}/profile"><button class="btn container m-1">Profile Page</button></a>
                <a class="" href="${pageContext.servletContext.contextPath}/change-password"><button class="btn btn container m-1">Change Password</button></a>
            </sec:authorize>
        </ul>
    </div>
    <div class="col-md-9 border-left" style="padding-bottom: 300px; background-color: #FFFFFF">
        <jsp:doBody/>
    </div>

</div>
</body>

</html>
