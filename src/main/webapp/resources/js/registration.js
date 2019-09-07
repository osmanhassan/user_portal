$(document).ready(function () {

    $("#email").keyup(function () {
        var email = $(this).val();
        var data = {
            "email" : email
        }
        var contextPath = $("#contextPath").val();
        var url = contextPath + "/is-unique-email";
        $.post(url, data, function (response) {
            if(response){
                if(response == "true"){
                    $("#emailError").html("");
                }
                else{
                    $("#emailError").html("This email has been used. Try with another one.");
                }
            }
        });

    })
    $("#registrationForm").submit(function (e) {

        var email = $("#email").val();
        if(email != ""){
            e.preventDefault();
            var data = {
                "email" : email
            }
            var contextPath = $("#contextPath").val();
            var url = contextPath + "/is-unique-email";
            $.post(url, data, function (response) {
                if(response){
                    if(response == "true"){
                        e.currentTarget.submit();
                    }
                    else{
                        $("#emailError").html("This email has been used. Try with another one.");
                    }
                }
            });
        }
    });

    $( "#dateOfBirth" ).datetimepicker({
        timepicker:false,
        format: 'Y-m-d',
        maxDate: new Date()
    });
    $('#dateOfBirth').bind("contextmenu", function(e) {
        e.preventDefault();
    });
    $('#dateOfBirth').keydown(function(event){

        event.preventDefault();
    });

})