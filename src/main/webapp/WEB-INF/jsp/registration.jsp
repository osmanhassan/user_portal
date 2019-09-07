<%--
  Created by IntelliJ IDEA.
  User: Antu
  Date: 03/09/2019
  Time: 11:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html>
<head>
    <title>User Portal</title>
    <%@ include file="partials/css.jsp"%>
    <link rel="stylesheet" href="/resources/css/jquery.datetimepicker.min.css">
</head>
<body>
<div class="container">
    <div class="card " style="max-width: 750px; margin: auto;top: 20px">
        <div class="card-header text-center">
            <h3>Registration Panel</h3>
        </div>
        <div class="card-body">
            <form:form method="post" modelAttribute="user" id="registrationForm" autocomplete="false">

                <div class="form-group row">
                    <label for="firstName" class="col-sm-2 col-form-label">First Name<span style="color: red"> *</span></label>
                    <div class="col-sm-10">
                        <form:input type="text" id="firstName" name="firstName" class="form-control" path="firstName" />
                        <div class="alert-danger">
                            <form:errors path="firstName" />
                        </div>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="lastName" class="col-sm-2 col-form-label">Last Name<span style="color: red"> *</span></label>
                    <div class="col-sm-10">
                        <form:input type="text" name="lastName" id="lastName" class="form-control" path="lastName" />
                        <div class="alert-danger">
                            <form:errors path="lastName" />
                        </div>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="address" class="col-sm-2 col-form-label">Address<span style="color: red"> *</span></label>
                    <div class="col-sm-10">
                        <form:input type="text" id="address" name="address" class="form-control" path="address" />
                        <div class="alert-danger">
                            <form:errors path="address" />
                        </div>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="cellPhone" class="col-sm-2 col-form-label">Phone<span style="color: red"> *</span></label>
                    <div class="col-sm-10">
                        <form:input type="text" class="form-control" name="cellPhone" id="cellPhone" path="cellPhone"/>
                        <div class="alert-danger">
                            <form:errors path="cellPhone" />
                        </div>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="email" class="col-sm-2 col-form-label">Email<span style="color: red"> *</span></label>
                    <div class="col-sm-10">
                        <form:input type="text" class="form-control" name="email" id="email" path="email" />
                        <div class="alert-danger" id="emailError">
                            <form:errors path="email" />
                        </div>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="dateOfBirth" class="col-sm-2 col-form-label">Birthdate<span style="color: red"> *</span></label>
                    <div class="col-sm-10">
                        <form:input type="text" class="form-control" name="dateOfBirth" id="dateOfBirth" path="dateOfBirth" />
                        <div class="alert-danger">
                            <form:errors path="dateOfBirth" />
                        </div>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="password" class="col-sm-2 col-form-label">Password<span style="color: red"> *</span></label>
                    <div class="col-sm-10">
                        <form:input type="password" class="form-control" name="password" id="password" path="password" autocomplete="new-password"/>
                        <div class="alert-danger">
                            <form:errors path="password" />
                        </div>

                    </div>
                </div>

                <input type="hidden" id="contextPath" value="${pageContext.servletContext.contextPath}">
                <input type="submit" id="submitBtn" class="btn btn-success" value="Register" style="margin: 10px 0 0 35%;" />
                <a href="${pageContext.servletContext.contextPath}/"><div  class="btn btn-danger" style="margin: 10px 0 0 10%;">Cancel</div></a>
                <%--<input type="button" class="btn btn-danger" style="margin: 10px 0 0 5%;" value="Clear">--%>

            </form:form>
        </div>

    </div>

</div>
<script type="application/javascript" src="/resources/js/jQuery-3.3.1/jquery-3.3.1.min.js"></script>
<script type="application/javascript" src="/resources/js/datepicker/jquery.datetimepicker.full.min.js"></script>
<script type="application/javascript" src="/resources/js/registration.js"></script>
</body>
</html>
