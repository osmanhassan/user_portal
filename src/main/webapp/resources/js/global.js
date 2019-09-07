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