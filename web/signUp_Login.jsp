<%--
    Document   : signUp_Login
    Created on : 20 Apr, 2012, 1:17:53 PM
    Author     : Udit Desai
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up/Login</title>
        <script>
            function validateName(name) {
                if(name.match("^[a-zA-Z][a-zA-Z0-9_]*$"))
                    return true;
                else false;
            }
            function validateEmailID(email) {
                if(email.match("^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$"))
                    return true;
                else false;
            }

            $(document).ready(function() {

                $("#loginPanel").ready(function() {
                    $("#signup").removeClass('select');
                    $("#dropbox").removeClass('select');
                    $("#login").addClass('select');
                    $("#signupbox").removeClass("shown");
                    $("#signupbox").addClass("hidden");
                    $("#signupbox").slideUp("fast");
                    $("#dbBox").removeClass("shown");
                    $("#dbBox").addClass("hidden");
                    $("#dbBox").slideUp("fast");
                    $("#loginbox").removeClass("hidden");
                    $("#loginbox").addClass("shown");
                    $("#loginbox").slideDown("fast");
                });

                $(".tab").unbind("click").bind("click",function() {
                    var X=$(this).attr('id');

                    if(X=='signup')
                    {
                        $("#login").removeClass('select');
                        $("#dropbox").removeClass('select');
                        $("#signup").addClass('select');
                        $("#dbBox").removeClass("shown");
                        $("#dbBox").addClass("hidden");
                        $("#dbBox").slideUp("fast");
                        $("#loginbox").removeClass("shown");
                        $("#loginbox").addClass("hidden");
                        $("#loginbox").slideUp("fast");
                        $("#signupbox").removeClass("hidden");
                        $("#signupbox").addClass("shown");
                        $("#signupbox").slideDown("fast");
                    }
                    else
                    {
                        $("#signup").removeClass('select');
                        $("#dropbox").removeClass('select');
                        $("#login").addClass('select');
                        $("#signupbox").removeClass("shown");
                        $("#signupbox").addClass("hidden");
                        $("#signupbox").slideUp("fast");
                        $("#dbBox").removeClass("shown");
                        $("#dbBox").addClass("hidden");
                        $("#dbBox").slideUp("fast");
                        $("#loginbox").removeClass("hidden");
                        $("#loginbox").addClass("shown");
                        $("#loginbox").slideDown("fast");
                    }
                });

                function validateFirstName() {
                    if($("#txtFirstName").val()!="") {
                        if(validateName($("#txtFirstName").val())) {
                            $("#spnFirstNameStatus").html("");
                            return true;
                        }
                        else {
                            $("#spnFirstNameStatus").html("First Name should be alpha-numeric value");
                            return false;
                        }
                    }
                    else {
                        $("#spnFirstNameStatus").html("This field is required");
                        return false;
                    }
                }
                function validateLastName() {
                    if($("#txtLastName").val()!="") {
                        if(validateName($("#txtLastName").val())) {
                            $("#spnLastNameStatus").html("");
                            return true;
                        }
                        else {
                            $("#spnLastNameStatus").html("Last Name should be alpha-numeric value");
                            return false;
                        }
                    }
                    else {
                        $("#spnLastNameStatus").html("This field is required");
                        return false;
                    }
                }
                function validateEmail() {
                    if($("#txtEmail").val()!="") {
                        if(validateEmailID($("#txtEmail").val())) {
                            $("#spnEmailStatus").html("");
                            return true;
                        }
                        else {
                            $("#spnEmailStatus").html("Invalid Email");
                            return false;
                        }
                    }
                    else {
                        $("#spnEmailStatus").html("This field is required");
                        return false;
                    }
                }
                function validateUsername() {
                    if($("#txtUsername").val()!="") {
                        if(validateName($("#txtUsername").val())) {
                            $.post("validateUsername.jsp",{
                                txtUsername : $("#txtUsername").val()
                                }, function(res) {
                                    $("#spnUsernameStatus").html(res);
                                }
                            );
                            if($("#spnUsernameStatus").html().indexOf("Username")==-1) return true;
                            else return false;
                        }
                        else {
                            $("#spnUsernameStatus").html("Username should be alpha-numeric value");
                            return false;
                        }
                    }
                    else {
                        $("#spnUsernameStatus").html("This field is required");
                        return false;
                    }
                }
                function validatePassword() {
                    if($("#txtPassword").val()!="") {
                        if($("#txtPassword").val().length<6) {
                            $("#spnPasswordStatus").html("Password should be at least 6 characters long");
                            return false;
                        }
                        else {
                            $("#spnPasswordStatus").html("");
                            return true;
                        }
                    }
                    else {
                        $("#spnPasswordStatus").html("This field is required");
                        return false;
                    }
                }
                function verifyPassword() {
                    if($("#txtVerifyPassword").val()!="") {
                        if($("#txtVerifyPassword").val().match($("#txtPassword").val())) {
                            $("#spnVerifyPasswordStatus").html("");
                            return true;
                        }
                        else {
                            $("#spnVerifyPasswordStatus").html("Passwords are not matching. Try Again");
                            return false;
                        }
                    }
                    else {
                        $("#spnVerifyPasswordStatus").html("This field is required");
                        return false;
                    }
                }

                $("#txtFirstName").blur(function(){
                    if($(this).val()!="") {
                        if(validateName($(this).val())) {
                            $("#spnFirstNameStatus").html("");
                            return true;
                        }
                        else {
                            $("#spnFirstNameStatus").html("First Name should be alpha-numeric value");
                            return false;
                        }
                    }
                    else {
                        $("#spnFirstNameStatus").html("This field is required");
                        return false;
                    }
                });
                $("#txtLastName").blur(function(){
                    if($(this).val()!="") {
                        if(validateName($(this).val())) {
                            $("#spnLastNameStatus").html("");
                            return true;
                        }
                        else {
                            $("#spnLastNameStatus").html("Last Name should be alpha-numeric value");
                            return false;
                        }
                    }
                    else {
                        $("#spnLastNameStatus").html("This field is required");
                        return false;
                    }
                });
                $("#txtEmail").blur(function(){
                    if($(this).val()!="") {
                        if(validateEmailID($(this).val())) {
                            $("#spnEmailStatus").html("");
                            return true;
                        }
                        else {
                            $("#spnEmailStatus").html("Invalid Email");
                            return false;
                        }
                    }
                    else {
                        $("#spnEmailStatus").html("This field is required");
                        return false;
                    }
                });
                $("#txtUsername").blur(function(){
                    if($(this).val()!="") {
                        if(validateName($(this).val())) {
                            var b;
                            $.post("validateUsername.jsp",{
                                txtUsername : $(this).val()
                                }, function(res) {
                                    if(res.match("")) b=true;
                                    else b=false;
                                    $("#spnUsernameStatus").html(res);
                                }
                            );
                            return b;
                        }
                        else {
                            $("#spnUsernameStatus").html("Username should be alpha-numeric value");
                            return false;
                        }
                    }
                    else {
                        $("#spnUsernameStatus").html("This field is required");
                        return false;
                    }
                });
                $("#txtPassword").blur(function(){
                    if($(this).val()!="") {
                        if($(this).val().length<6 && $(this).val().length>32) {
                            $("#spnPasswordStatus").html("Password should be at least 6 characters long");
                            return false;
                        }
                        else {
                            $("#spnPasswordStatus").html("");
                            return true;
                        }
                    }
                    else {
                        $("#spnPasswordStatus").html("This field is required");
                        return false;
                    }
                });
                $("#txtVerifyPassword").blur(function(){
                    if($(this).val()!="") {
                        if($(this).val().match($("#txtPassword").val())) {
                            $("#spnVerifyPasswordStatus").html("");
                            return true;
                        }
                        else {
                            $("#spnVerifyPasswordStatus").html("Passwords are not matching. Try Again");
                            return false;
                        }
                    }
                    else {
                        $("#spnVerifyPasswordStatus").html("This field is required");
                        return false;
                    }
                });

                $("#aSignup").unbind("click").bind("click",
                    function() {
                        if(validateFirstName() && validateLastName() && validateEmail() && validateUsername() && validatePassword() && verifyPassword()) {
                            $.post("signup.jsp",
                                {
                                    txtFirstName : $("#txtFirstName").val(),
                                    txtLastName : $("#txtLastName").val(),
                                    txtEmail : $("#txtEmail").val(),
                                    txtUsername : $("#txtUsername").val(),
                                    txtPassword : $("#txtPassword").val()
                                },
                                function(res) {
                                    $("#spnSignUpStatus").html(res);
                                    setTimeout('$(location).attr("href","index.jsp")',3000);
/*                                    if(res.indexOf("Registration")!=-1) {

                                        $.post("generateAuthLink.jsp",function(res) {
                                            if(res.toLowerCase().indexOf("exception")==-1) {
                                                $("#aDBAuthLink").attr("href",res);
                                            }
                                            else alert("Error While Connecting to Dropbox. Check your Internet connections.");
                                        });

                                        $("#signup").removeClass('select');
                                        $("#login").removeClass('select');
                                        $("#dropbox").addClass('select');
                                        $("#dropbox").removeClass('hidden');
                                        $("#dropbox").addClass('shown');
//                                        $("#signupbox").removeClass("shown");
//                                        $("#signupbox").addClass("hidden");
//                                        $("#signupbox").slideUp("fast");
//                                        $("#dbBox").removeClass("shown");
//                                        $("#dbBox").addClass("hidden");
//                                        $("#dbBox").slideUp("fast");
//                                        $("#loginbox").removeClass("hidden");
//                                        $("#loginbox").addClass("shown");
//                                        $("#loginbox").slideDown("fast");
                                        setTimeout('$("#signupbox").slideUp()',3000);
                                        setTimeout('$("#dbBox").slideDown()',3000);

                                        $.post("dropbox.jsp",
                                            function(res) {
                                                setTimeout('$("#dropbox").removeClass("shown")',3000);
                                                setTimeout('$("#dropbox").addClass("hidden")',3000);
                                                alert(res);
                                            }
                                        );
                                    }*/
                                }
                            );
                        }
                        else {
                            alert("Inncomplete/Invalid Form Details");
                            return false;
                        }
                    }
                );

                $("#txtPasswordLogin").blur(function(){

                    if($(this).val()!="") {
                        $("#spnPasswordLoginStatus").html("");
                        return true;
                    }
                    else {
                        $("#spnPasswordLoginStatus").html("This field is required");
                        return false;
                    }
                });

                $("#txtUsernameLogin").blur(function(){
                    if($(this).val()!="") {
                        if(validateName($(this).val())) {
                            $("#spnUsernameLoginStatus").html("");
                            return true;
                        }
                        else {
                            $("#spnUsernameLoginStatus").html("User Name should be alpha-numeric value");
                            return false;
                        }
                    }
                    else {
                        $("#spnUsernameLoginStatus").html("This field is required");
                        return false;
                    }
                });

                $("#aDBAuthLink").unbind("click").bind("click",
                    function() {
                        alert("Accept the grant request on the Dropbox Website Page & then click OK");
                    });

                $("#aLogin").unbind("click").bind("click",
                    function() {
                        $.post("login.jsp",
                            {
                                txtUsernameLogin : $("#txtUsernameLogin").val(),
                                txtPasswordLogin: $("#txtPasswordLogin").val()
                            }, function(res) {
                                $("#spnLoginStatus").html(res);
                                setTimeout('$(location).attr("href","index.jsp")',3000);
                        });
                });
            });
        </script>
        <style>
            .loginBody {
                font-family:Arial, Helvetica, sans-serif;
                font-size:12px; background-color:#333;
            }
            #spnEmailStatus, #spnPasswordStatus, #spnUsernameStatus, #spnVerifyPasswordStatus, #spnFirstNameStatus, #spnLastNameStatus, #spnUsernameLoginStatus, #spnPasswordLoginStatus, #spnSignUpStatus, #spnLoginStatus {
                font-family: Arial;
                font-weight: bold;
            }
            #loginContainer {
                width:620px;
                height:420px !important;
            }
            #loginTabBox {
                font-family: Segoe Script;
                height:40px;
            }
            #loginPanel {
                font-family: Segoe Script;
                background-color:#0096BD;
                height:420px !important;
            }
            .tab {
                background: #E7EDF6;
                display: block;
                height: 40px;
                line-height: 40px;
                text-align: center;
                width: 80px;
                float: right;
                font-weight: bold;
                -webkit-border-top-left-radius: 4px;
                -webkit-border-top-right-radius: 4px;
                -moz-border-radius: 4px 4px 0px 0px;
                color: #0096BD;
                margin: 0;
                padding: 0;
                text-decoration: none;
            }
            .signup {
                margin-left:8px;
            }
            .select {
                background-color:#FFF;
            }
            .hidden {
                display: none;
            }
            .shown {
                display: inline;
            }
            #loginbox {
                float: left;
                height:420px !important;
                padding:30px;
            }
            #signupbox {
                height:420px !important;
                padding:30px;
                float: left;
            }
            .reg {
                 margin-left:8px;
            }
            #dbLink {
                color: #0096BD;
                margin: 0;
                padding: 0;
                text-decoration: none;
            }
            #dbbox {
                    height: 420px !important;
                    padding: 30px;
                    float: left;
            }
        </style>
    </head>
    <body class="loginBody">
            <div style="margin:20px">
                <div id="loginContainer">
                    <div id="loginTabBox">
                        <a href="#" id="dropbox" class="tab signup hidden">Dropbox</a>
                        <a href="#" id="signup" class="tab signup">Sign Up</a>
                        <a href="#" id="login" class="tab select">Login</a>
                    </div>

                    <div id="loginPanel" style="overflow-y: hidden;">
                        <div id="loginbox">

                                <br><br>
                                <h1>Login</h1>

                                <br>
                                <div style="margin-top:10px;">
                                    <b>Username:</b>
                                    <input id="txtUsernameLogin" name="txtUsernameLogin" class="log" title="Username" value="" size="30" maxlength="2048" />
                                    <font color="red"><span id="spnUsernameLoginStatus">&nbsp;</span></font><br>
                                </div>

                                <div style="margin-top:10px;">
                                    <b>Password:</b>
                                    <input id="txtPasswordLogin" name="txtPasswordLogin" type="password" class="log" title="Password" value="" size="30" maxlength="2048" />
                                    <font color="red"><span id="spnPasswordLoginStatus">&nbsp;</span></font><br>
                                </div>
                                <font color="red"><span id="spnLoginStatus">&nbsp;</span></font>
                                <div>
                                    <br/><br/>
                                    <a href="#"><img id="aLogin" src="css/images/l5.png" width="150" height="75"/></a>
                                <br/><br/>

                                </div>

                        </div>

                        <div id="signupbox">
                            <h1>Sign Up</h1>
                            <table>
                                <tr>
                                    <td style="margin-top:5px;">
                                        <b>First Name:</b>&nbsp;
                                    </td><td style="margin-top:5px;">
                                        <input type="text" id="txtFirstName" name="txtFirstName" class="signup" title="First Name" value="" size="15" maxlength="2048" />
                                        <font color="red"><span id="spnFirstNameStatus">&nbsp;</span></font><br>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="margin-top:5px;">
                                        <b>Last Name:</b>&nbsp;
                                    </td><td style="margin-top:5px;">
                                        <input type="text" id="txtLastName" name="txtLastName" class="signup" title="Last Name" value="" size="15" maxlength="2048" />
                                        <font color="red"><span id="spnLastNameStatus">&nbsp;</span></font><br>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="margin-top:5px;">
                                        <b>E-mail:</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </td><td style="margin-top:5px;">
                                        <input type="text" id="txtEmail" name="txtEmail" class="signup" title="E-mail" value="" size="15" maxlength="2048" />
                                        <font color="red"><span id="spnEmailStatus">&nbsp;</span></font><br>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="margin-top:5px;">
                                        <b>User Name:</b>&nbsp;
                                    </td><td style="margin-top:5px;">
                                        <input type="text" id="txtUsername" name="txtUsername" class="signup" title="Username" value="" size="15" maxlength="2048" />
                                        <font color="red"><span id="spnUsernameStatus">&nbsp;</span></font><br>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="margin-top:5px;">
                                        <b>Password:</b>&nbsp;&nbsp;&nbsp;
                                    </td><td style="margin-top:5px;">
                                        <input id="txtPassword" name="txtPassword" type="password" class="signup" title="Password" value="" size="15" maxlength="2048" />
                                        <font color="red"><span id="spnPasswordStatus">&nbsp;</span></font><br>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="margin-top:5px;">
                                        <b>Confirm Password:</b>&nbsp;
                                    </td><td style="margin-top:5px;">
                                        <input id="txtVerifyPassword" name="txtVerifyPassword" type="password" class="signup" title="Verify Password" value="" size="15" maxlength="2048" />
                                        <font color="red"><span id="spnVerifyPasswordStatus">&nbsp;</span></font>
                                    </td>
                                </tr>
                            </table>
                            <font color="red"><span id="spnSignUpStatus">&nbsp;</span></font>

                                <div>
                                    <a href="#" ><img  id="aSignup" src="css/images/s1.png" width="150" height="75" align="middle"/></a>
                                </div>

                        </div>

                        <div id="dbbox">
                            <h1><b>DropBox Remote Repository</b></h1>

                            Please integrate your <b>Dropbox Account</b> with this system. To allow access to your Remote Repository
                            <font size="4"><a id="aDBAuthLink" name="aDBAuthLink" href="#" target="_blank">Click Here.</a></font>

                            <div style="margin-top:10px;"><b>Repository Name:</b></div>
                            <div style="margin-top:10px;">
                                <input id="txtRepName" name="txtRepName" class="reg" title="Repository Name" value="" size="30" maxlength="2048" />
                            </div>

                            <div style="margin-top:10px;"><b>Token Key:</b></div>
                            <div style="margin-top:10px;">
                                <input id="txtTKey" name="txtTKey" type="text" class="reg" title="Token Key" value="" size="30" maxlength="2048" />
                            </div>

                            <div style="margin-top:10px;"><b>Token Secret:</b></div>
                            <div style="margin-top:10px;">
                                <input id="txtTSecret" name="txtTSecret" type="password" class="reg" title="Token Secret" value="" size="30" maxlength="2048" />
                            </div>


                                <div>
                                    <br>
                                    <a href="#"><img src="css/images/okbtn1.png" width="150" height="75"></a>
                                    <br>
                                </div>

                        </div>
                    </div>
                </div>
            </div>
    </body>
</html>
