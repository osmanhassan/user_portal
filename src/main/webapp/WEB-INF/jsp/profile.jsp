<%--
  Created by IntelliJ IDEA.
  User: Antu
  Date: 04/09/2019
  Time: 01:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <t:content>
        <div class="border-bottom text-center">
            <h3>Profile Page</h3>
        </div>
        <div class="container p-5 " style="margin-top: 80px">
            <div class="alert-success" id="successMessage">${successMessage}</div>
            <table class="m-auto">
                <tr>
                    <td>
                        <label class="label">First Name &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label>
                    </td>
                    <td>
                        :&nbsp&nbsp&nbsp&nbsp
                        <label>${user.firstName}</label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="label">Last Name</label>
                    </td>
                    <td>
                        :&nbsp&nbsp&nbsp&nbsp
                        <label>${user.lastName}</label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="label">Address</label>
                    </td>
                    <td>
                        :&nbsp&nbsp&nbsp&nbsp
                        <label>${user.address}</label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="label">Phone</label>
                    </td>
                    <td>
                        :&nbsp&nbsp&nbsp&nbsp
                        <label>${user.cellPhone}</label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="label">Email</label>
                    </td>
                    <td>
                        :&nbsp&nbsp&nbsp&nbsp
                        <label>${user.email}</label>
                    </td>
                </tr>
                <tr style="display:none;" id="birthDateTr">
                    <td>
                        <label class="label">Birthday</label>
                    </td>
                    <td>
                        :&nbsp&nbsp&nbsp&nbsp
                        <label id="birthDate">${user.dateOfBirth}</label>
                    </td>
                </tr>

            </table>

        </div>
        <script>
            $(document).ready(function () {
                var birthDate = $("#birthDate").html();
                birthDate = birthDate.trim();
                birthDate = birthDate.split(" ");
                $("#birthDate").html(birthDate[0]);
                $("#birthDateTr").show();
            })
        </script>
    </t:content>
