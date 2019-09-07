$(document).ready(function () {
    $("#changePasswordForm").submit(function (e) {
        e.preventDefault();

        var previousPassword = $("#previousPassword").val();
        var newPassword = $("#newPassword").val();
        var confirmPassword = $("#confirmPassword").val();

        var noPreviousPasswordError = true;
        var noNewPasswordError = true;
        var noConfirmPasswordError = true;

        if(previousPassword.trim() == ""){
            $("#previousPasswordError").html("Previous password is required");
            noPreviousPasswordError = false;
        }
        else{

            $("#previousPasswordError").html("");
        }

        if(newPassword.trim() == ""){
            $("#newPasswordError").html("New password is required");
            noNewPasswordError = false;
        }
        else{
            $("#newPasswordError").html("");
        }

        if(confirmPassword.trim() == ""){
            $("#confirmPasswordError").html("Confirm password is required");
            noConfirmPasswordError = false;
        }
        else{
            $("#confirmPasswordError").html("");
        }


        if(noPreviousPasswordError && noNewPasswordError && noConfirmPasswordError){
            e.currentTarget.submit();
        }

    });

});