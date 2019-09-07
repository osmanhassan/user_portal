<%--
  Created by IntelliJ IDEA.
  User: Antu
  Date: 03/09/2019
  Time: 11:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <title>User Portal</title>
    <%@ include file="partials/css.jsp"%>
</head>
<body>
    <div class="container">
        <div class="card " style="max-width: 350px; margin: auto;top: 120px">
            <div class="card-header text-center">
                <h3>Login Panel</h3>
            </div>
            <div class="card-body">
                <div class="alert-success" id="successMessage">${successMessage}</div>
                <form method="post" autocomplete="off">
                    <label  class="col-form-label">User Name</label>
                    <input type="text" name="username" class="form-control">
                    <label class="col-form-label">Password</label>
                    <input type="password" name="password" class="form-control" autocomplete="new-password">
                    <div id="alert-div" class="alert-danger">
                        <c:if test="${param.error != null}">
                            <div class="alert-danger p-2 m-2">Invalid username or password.</div>
                        </c:if>

                    </div>
                    <button type="submit" class="btn btn-success" style="margin: 10px 0 0 25%;">Login</button>
                    <button type="reset" class="btn btn-dark" style="margin: 10px 0 0 5%;">Clear</button>
                    <%--<input type="button" class="btn btn-danger" style="margin: 10px 0 0 5%;" value="Clear">--%>

                </form>
            </div>
            <div class="card-footer">
                Are you new here? <a href="${pageContext.servletContext.contextPath}/registration">Register Now</a>
            </div>
        </div>

    </div>
    <%@ include file="partials/js.jsp"%>
</body>
</html>
