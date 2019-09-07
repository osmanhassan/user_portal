<%--
  Created by IntelliJ IDEA.
  User: Antu
  Date: 06/09/2019
  Time: 03:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:content>
    <link rel="stylesheet" href="<c:url value="/resources/css/datatables.min.css"/>"  >
    <table id="dt" class="table table-striped ">
        <thead>
        <tr>
            <th>Name</th>
            <th>Age</th>
            <th>Email</th>
            <th>Phone</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${users}" var="user">
            <tr>
                <td>${user.firstName} ${user.lastName}</td>
                <td>${user.age}</td>
                <td>${user.email}</td>
                <td>${user.cellPhone}</td>
            </tr>
        </c:forEach>

        </tbody>
    </table>

    <script type="application/javascript" src="<c:url value="/resources/js/datatable/datatables.min.js"/>" ></script>
    <script type="application/javascript">
        $(document).ready(function () {
            $("#dt").DataTable({
                "iDisplayLength": 10,
                "dom": '<"toolbar">frtip',
            }) ;
            $("div.toolbar").html('<h4>User List</h4>');

        });
    </script>
</t:content>
