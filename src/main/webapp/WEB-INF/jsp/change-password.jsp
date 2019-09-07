<%--
  Created by IntelliJ IDEA.
  User: Antu
  Date: 04/09/2019
  Time: 01:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<t:content>
    <div class="border-bottom text-center">
        <h3>Change Password</h3>
    </div>
    <div class="container p-5 " style="margin-top: 20px">
        <div class="card " style="max-width: 350px; margin: auto">
            <div class="card-body">
                <div class="alert-danger" id="errorMessage">${errorMessage}</div>
                <form method="post" autocomplete="false" id="changePasswordForm">
                    <label  class="col-form-label">Previous Password</label>
                    <input type="password" name="previousPassword" id="previousPassword" class="form-control" autocomplete="none">
                    <div class="alert-danger" id="previousPasswordError">

                    </div>
                    <label class="col-form-label">New Password</label>
                    <input type="password" name="newPassword" id="newPassword" class="form-control" autocomplete="none">
                    <div class="alert-danger" id="newPasswordError">

                    </div>
                    <label class="col-form-label">Confirm Password</label>
                    <input type="password" name="confirmPassword" id="confirmPassword" class="form-control" autocomplete="none">
                    <div class="alert-danger" id="confirmPasswordError">

                    </div>
                    <button type="submit" class="btn btn-success" style="margin: 20px 0 0 10%;">Change Password</button>
                    <button type="reset" class="btn btn-dark" style="margin: 20px 0 0 5%;">Clear</button>
                </form>
            </div>

        </div>

    </div>
    <script type="application/javascript" src="/resources/js/change-password.js"></script>
</t:content>
