<%--
  Created by IntelliJ IDEA.
  User: Antu
  Date: 06/09/2019
  Time: 01:15 AM
  To change this template use File | Settings | File Templates.
--%>

<script type="application/javascript" src="/resources/js/jQuery-3.3.1/jquery-3.3.1.min.js"></script>
<script type="application/javascript">
    $(document).ready(function () {
        $("#drpMenubtn").click(function () {
            $("#drpMenu").toggle();
        });
        var successMessage = $("#successMessage").html();
        var errorMessage = $("#errorMessage").html();

        if(errorMessage){
            if(errorMessage != ""){
                $("#errorMessage").addClass("p-2");
                $("#errorMessage").toggle(10000);
            }
        }

        if(successMessage){
            if(successMessage != ""){
                $("#successMessage").addClass("p-2");
                $("#successMessage").toggle(10000);
            }
        }

    });
</script>
