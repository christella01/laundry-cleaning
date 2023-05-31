


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head><title>
	Login
</title>
    <link href="Styles/common.css?v=1.-121.174240" rel="stylesheet" type="text/css" />
    <link href="Styles/form.css?v=1.-1217.1752480" rel="stylesheet" type="text/css" />
    <link href="Styles/StyleSheet.css?v=1.-1217.1752480" rel="stylesheet" type="text/css" />
    <link href="Styles/typography.css?v=1.-1217.1752480" rel="stylesheet" type="text/css" />
    <link href="Styles/notification.css?v=1.-1217.1752480" rel="stylesheet" type="text/css" />
    <link href="Styles/bootstrap.css?v=1.-1217.1752480" rel="stylesheet" type="text/css" />
    <link href="Styles/dynamicform.css?v=1.-1217.1752480" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery.js?v=1.-1217.1752480" type="text/javascript"></script>
    <script src="Scripts/jquery.custom.js?v=1.-1217.1752480" type="text/javascript"></script>
    <script src="Scripts/TimeZoneHelper.js?v=1.-1217.1752480" type="text/javascript"></script>
    <script src="Scripts/notification.js?v=1.-1217.1752480" type="text/javascript"></script>
    <script src="Scripts/bootstrap.min.js?v=1.-1217.1752480" type="text/javascript"></script>
    <script src="Scripts/jquery.passstrength.min.js?v=1.-1217.1752480" type="text/javascript"></script>


    <style type="text/css">
        .studentSignUpWrapper {
            display: none;
        }

        #tblPostSignupPopup {
            display: none;
        }

            #tblPostSignupPopup .loadingwrapper, .loadingwrapperpop {
                background-color: #FFFFFF;
                border: 1px solid rgba(0, 0, 0, 0.2);
                border-radius: 6px 6px 6px 6px;
                box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
                left: 42%;
                margin-left: -104px;
                margin-top: -24px;
                padding: 15px;
                position: fixed;
                top: 42%;
                z-index: 1200;
            }

            #tblPostSignupPopup .loaderbg, .loaderbgpop {
                background-color: #000000;
                bottom: 0;
                left: 0;
                opacity: 0.5;
                position: fixed;
                right: 0;
                top: 0;
                z-index: 1100;
            }

            #tblPostSignupPopup .loadingimg, .loadingimgpop {
                float: left;
            }

            #tblPostSignupPopup .loading, .loadingpop {
                background-color: transparent;
                background-image: url("Styles/images/icon_loading_notification_blue.gif");
                background-position: center center;
                background-repeat: no-repeat;
                border: 0 none;
                color: transparent;
                display: inline-block;
                font: 0px/0 a;
                height: 24px;
                text-shadow: none;
                width: 24px;
            }

            #tblPostSignupPopup .loadingmsg, .loadingmsgpop {
                color: #2C8AB4;
                float: left;
                font-size: 20px;
                font-weight: bold;
                line-height: 24px;
                margin-left: 5px;
            }

            #tblPostSignupPopup div.morecontent {
                margin-top: 32px;
            }

        .f-right {
            float: right;
        }

        .hide {
            display: none;
        }

        .forgetpassword, .cancel, .signup {
            cursor: pointer;
            cursor: hand;
        }

        .divLoginRight {
            float: right !important;
            margin-right: 15px;
        }

        .divloginLeft {
            float: left;
            margin-left: 15px;
        }

        #btnRegister {
            margin-top: 50px;
            width: 100%;
        }

        #btnCancelRegistration {
            width: 100%;
            margin-top: 5px;
        }

        #signupModal {
        }

        #loginForm .control-group {
            margin-bottom: 2px;
        }

        #signupMessage {
            display: none;
        }

        .spinner {
            display: inline-block;
            opacity: 0;
            width: 0;
            -webkit-transition: opacity 0.25s, width 0.25s;
            -moz-transition: opacity 0.25s, width 0.25s;
            -o-transition: opacity 0.25s, width 0.25s;
            transition: opacity 0.25s, width 0.25s;
        }

        .has-spinner.active {
            cursor: progress;
        }

            .has-spinner.active .spinner {
                opacity: 1;
                width: auto; /* This doesn't work, just fix for unkown width elements */
            }

        #header-wrapper {
            border-bottom: 40px solid #0075A2;
        }
    </style>
    <script type="text/javascript">
        var ApplicationName = '';
        $(function () {
            $('#popupRedirect').attr("href", ApplicationName + "/Student.aspx");
            $('.signup').tooltip();
            $('#txtUserName').focus();
            $('#lblSignUp').on("click", function () {
                ClearSignupForm();
                $('span.passStrengthify').remove();
                $('#Password').passStrengthify({
                    minimum: 5,
                    labels: {
                        tooShort: 'Too short'
                    }
                });
                $('#signupModal').on('shown', function () {
                    $('#txtName').focus();
                });
                $('#signupModal').modal("show");
            });
            $(".forgetpassword").click(function () {

                $(".passowrd-section").animate({ "height": "hide", "opacity": "hide" }, 300);
                $(".section-login").hide();
                $(".section-forget-password").removeClass("hide");
            });
            $(".cancel").click(function () {
                $(".passowrd-section").animate({ "height": "show", "opacity": "show" }, 300);
                $(".section-login").show();
                $(".section-forget-password").addClass("hide");
            });
            $('input,textarea').live('focusin focusout', function (e) {
                if (e.type == 'focusin') {
                    $(this).addClass("focus");
                }
                if (e.type == 'focusout') {
                    $(this).removeClass("focus");
                }
            });
            $("#btnCancelRegistration").live("click", function () {
                ClearSignupForm();
                $('#signupModal').modal("toggle");
            });
            $('#btnRegister').live("click", function (e) {
                if (!$.validate({ validatationGroup: "addStudentSignup" })) {
                    e.preventDefault();
                    if ($("#txtEmail").hasClass("email-invalid-class")) {
                        $(".invalidData").css("position", "relative");
                        $(".invalidData").css("left", "25px");
                    }
                    return false;

                }
                if ($.trim($('#Password').val()).length < 4) {
                    $("#lblEmailExistmessage").html("Password should have at least 4 characters");
                    $('#signupMessage').slideDown();
                    return false;
                }
                else {
                    $('#signupMessage').slideUp();
                }

                if ($.trim($('#Password').val()) != $.trim($('#PasswordConfirm').val())) {
                    $("#lblEmailExistmessage").html("Passwords don't match. Please try again");
                    $('#signupMessage').slideDown();
                    return false;
                }
                else {
                    $('#signupMessage').slideUp();
                }

                $.loading(true, "Signing Up...");

                var param = {
                    Name: $('#txtName').val(),
                    Email: $('#txtEmail').val(),
                    Password: $('#Password').val(),
                    Captcha: $('#txtimgcode').val()
                };
                $.ajax({
                    type: 'POST',
                    async: true,
                    url: "Login.aspx/SignUp",
                    data: JSON.stringify(param),
                    dataType: 'json',
                    contentType: "application/json; charset=utf-8",
                    success: function (msg) {
                        $.loading(false);
                        var response = msg.d;
                        if (response.StatusCode == 1) {
                            $('#signupModal').modal("toggle");
                            //ShowSignupProcessing();
                            $.loading(true, "Signing Up...");
                            setTimeout(function () {
                                window.location.href = response.RedirectURL;
                            }, 0);

                        }
                        else if (response.StatusCode == 4) {
                            $("#lblEmailExistmessage").html("Invalid Captcha");
                            $('#signupMessage').slideDown();
                        }
                        else if (response.StatusCode == 10) {
                            $("#lblEmailExistmessage").html("Sign up failed, please contact administration.");
                            $('#signupMessage').slideDown();
                        }
                    }
                });
            });

        });
        function CheckDuplicateEmail(value) {

            var EmailToBeCheck = value.trim();
            var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;

            if ($.trim(value).length == 0)
                return false;

            if (reg.test(EmailToBeCheck) == false && EmailToBeCheck.length > 0) {
                //$("#lblEmailExistmessage").html("Invalid Email Address.");
                $(".invalidData").css("position", "relative");
                $(".invalidData").css("left", "25px");
                return false;
            }
            else {
                $.post("Handlers/StudentSignupHandler.ashx", { "Type": "CheckMailExist", "EmailToBeCheck": EmailToBeCheck }, function (response) {
                    if (response.IsEmailExist == true) {
                        $("#lblEmailExistmessage").html("Email address already exist.");
                        $('#signupMessage').slideDown();
                    }

                });
            }
        }
        function RemoveLabeltext() {
            $("#lblEmailExistmessage").html("");
            $('#signupMessage').slideUp();
            $(".invalidData").remove();
        }
        function ClearSignupForm() {
            $('#txtName').val('');
            $('#txtEmail').val('');
            $('#Password').val('');
            $('#txtimgcode').val('');
            $("#lblEmailExistmessage").html("");
            $('#signupMessage').hide();
            $(".invalidData").remove();
            $('input').removeClass('input-required-class');

        }
        function forgetpassword() {
            $.loading(true, "Recovering your password.....");
            $username = $("#txtUserName").val();
            $msg = 'User does not exist!;Password is sent in your email.;Cannot send mail.;Invalid username or password!;Invalid User!;Your account is deactivated, please contact administrator.';
            if ($.trim($username) != "") {
                $.post("Handlers/ForgetPasswordHandler.ashx", { username: $username, msg: $msg }, function (response) {
                    if (response == 'Password is sent in your email.') {
                        alert(response);
                    }
                    else {
                        $.AlertBox({ message: response, type: "error" });
                    }
                });

            }
            else
                $("#txtUserName").addClass("input-required-class");
            $.loading(false);
        }
        function ShowSignupProcessing() {
            $('#tblPostSignupPopup .loaderbg').show();
            $('#tblPostSignupPopup').slideDown();

        }
    </script>

    <link href="Styles/newchanges.cs?v=1.0.0" rel="stylesheet" type="text/css" />
    <link href="Styles/changesoct2014.css?v=1.-1217.1752480" rel="stylesheet" type="text/css" />
</head>
<body>
    <form name="form1" method="post" action="./Login.aspx" id="form1">
<div>
<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
<input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="" />
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwULLTE5Njk0MDM2MjVkGAEFHl9fQ29udHJvbHNSZXF1aXJlUG9zdEJhY2tLZXlfXxYBBQpidG5SZWZyZXNocktDYzeQUxcSi9pTiDW+g11MPY5EMVL0btZ8p1IqAM0=" />
</div>

<script type="text/javascript">
//<![CDATA[
var theForm = document.forms['form1'];
if (!theForm) {
    theForm = document.form1;
}
function __doPostBack(eventTarget, eventArgument) {
    if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
        theForm.__EVENTTARGET.value = eventTarget;
        theForm.__EVENTARGUMENT.value = eventArgument;
        theForm.submit();
    }
}
//]]>
</script>


<script src="/WebResource.axd?d=LrdtveZ30XaotZNMV7dmdk0UXwyDlXKnNqmGCKgW5ehAfHT24hF4UFWt6iVEkDe_jwD8h0bgtGUjTFQOhy0VA6Eq1vlFU8ER26FenjTsyBg1&amp;t=637100902300000000" type="text/javascript"></script>


<script src="/ScriptResource.axd?d=kieYTlSD8_bOwqIpEgySSZ3EH32YsY1lOAh_C8Hwqh26HjyHdx9NNs60MuE7XPjiujpV36kLKYeFPyqAdnN1egKDw0VHMtT86qP2oolJBKPJgnMdJ-NRMr0aZrM4HUEiiOqv7VS10Ws_S3KvCR9KIUkdSOJthvtvC-NTpPzn_aO_5Fv-rvtN4gFvD7VMECZJ0&amp;t=ffffffff9a9577e8" type="text/javascript"></script>
<script type="text/javascript">
//<![CDATA[
if (typeof(Sys) === 'undefined') throw new Error('ASP.NET Ajax client-side framework failed to load.');
//]]>
</script>

<script src="/ScriptResource.axd?d=R51CUumatMKWgOZ9qIOrrfuTVQEAPX72EcJpvZGjbP7Tzv_MHY1EACxiv93wBIF0k8h0JuCKCF6kkFewXKoL_jotS47m7U9wxaOCRzuV6sLRMKU_4B8YZqJ0gUi3pkym77NHw5AWpTJ48R9WzdVeysS8Okx-Rc3-B-ZyGQA6rE_K-ep-F_p4NxHIDznxld6f0&amp;t=ffffffff9a9577e8" type="text/javascript"></script>
<div>

	<input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="C2EE9ABB" />
	<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="/wEdAAf1V6BT+F74p/dWX/um7yevY3plgk0YBAefRz3MyBlTcHY2+Mc6SrnAqio3oCKbxYYnZ7tBcf1HKANkhuTn0dI8Wb8DD4sH6XUVB6cpaHiF385XhHXFJzWEz/a3lvNJ4KWK8hF2GuqB1EkPPnfRI0IzgwatuhXusOVvEeEodZRnvDaAbnuF50DGEh6JL+RBLmo=" />
</div>
        <script type="text/javascript">
//<![CDATA[
Sys.WebForms.PageRequestManager._initialize('ScriptManager1', 'form1', ['tupdatepanelModularPopUp',''], [], [], 90, '');
//]]>
</script>

        <div id="header-wrapper">
            <h1>
                <a href="#" tabindex="-1" style="position: relative; margin-left: 20px; margin-top:20px; max-height: 90px;">
                    <img src="images/logo.png" alt="" /></a></h1>
        </div>
        <ul id="navigation" style="background: none;">
            <li style="background: none; width: 52%;">
                <div id="expirycheck" style="text-align: right;">
                </div>
            </li>
            <li style="background: none; width: 48%;">
                <div id="lnkactivation" style="display: none;">
                </div>
            </li>
        </ul>
        <div class="login-wrapper">
            <label>
                <span id="lblUserName">User Name</span></label>
            <input name="txtUserName" type="text" id="txtUserName" class="inputTextBox" />
            
            <div class="passowrd-section">
                <label>
                    <span id="lblPassword">Password</span></label>
                <input name="txtPassword" type="password" id="txtPassword" class="inputTextBox" />
                
            </div>
            <div class="section-login">
                <input type="submit" name="btnLogIn" value="Login" onclick="return ValidateLoginForm();" id="btnLogIn" />
                |
            <span id="lblForgetPassword" class="forgetpassword">Forgot password?</span>
			
              <!--  <span class="studentSignUpWrapper">| <span id="lblSignUp" href='#' data-toggle='modal' class="signup" data-original-title="If you do not have login info, please sign up here for login info. Once you have login credentials, you can submit your application form. Please deposit necessary sign up amount (application fee in our bank account to get registered) if you do not have sponsorship.
">New Student Sign Up</span></span>-->
<span>| <a href='http://mis.ulk.ac.rw:82/registration/' class="signup" data-original-title="If you do not have login info, please sign up here for login info. Once you have login credentials, you can submit your application form. Please deposit necessary sign up amount (application fee in our bank account to get registered) if you do not have sponsorship.
">New Student Sign Up</span></a>

<span>|  <!-- <a href='http://localhost/registration/registration/' class="signup" data-original-title="If you do not have login info, please sign up here for login info. Once you have login credentials, you can submit your application form. Please deposit necessary sign up amount (application fee in our bank account to get registered) if you do not have sponsorship.
">New Student Sign Up</span></a>-->

            </div>
            <div class="section-forget-password hide">
                <input name="btnForgetPassword" type="button" id="btnForgetPassword" onclick="forgetpassword()" value="Send Password" />
                |
            <span id="lblCancel" class="cancel">cancel</span>
            </div>
            
        </div>
        <div id="login-footer">
            <div id="login-wrapper">
                <div class="footer-left">
                    <span id="lblCopyright">&copy; 2008-2023 </span><a target="_blank" class="footerLink"
                        href="http://www.tulipstechnologies.com" target="_blank"><span id="lblCompany">Tulips Technologies</span></a>
                </div>
            </div>
        </div>
        <div class="modal hide fade" id="signupModal">
            <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button">
                    x</button><h3>Signup</h3>
            </div>
            <div class="modal-body">
                <div class="row-fluid">
                    <div id="loginBox" class="row-fluid">
                        <div id="loginForm">
                            <div id="signupMessage" class="alert alert-error">
                                <button type="button" tabindex="9" class="close" data-dismiss="alert">
                                    &times;</button>
                                <label id="lblEmailExistmessage">
                                </label>
                            </div>
                            <div class="divLoginLeft span5">
                                <div class="control-group">
                                    <label class="control-label">
                                        Name
                                    </label>
                                    <div class="controls">
                                        <input type="text" id="txtName" placeholder="Your Full Name" validationgroup="addStudentSignup"
                                            tabindex="1"></input>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">
                                        Password:
                                    </label>
                                    <div class="controls">
                                        <input type="password" id="Password" tabindex="3" validationgroup="addStudentSignup"
                                            validationtype="Password" placeholder="Your Password" />
                                    </div>
                                </div>
                                <div class="control-group">
                                    <div id="updatepanelModularPopUp">
	
                                            <div class="controls">
                                                <br />
                                                <img id="Image1" src="CImage.aspx" style="border-width:0px;width: 300px;" />
                                                <br />
                                                <input name="txtimgcode" type="text" id="txtimgcode" class="string" tabindex="5" autocomplete="off" placeholder="Enter Captcha text" validationgroup="addStudentSignup" style="width: 80% !important;" />
                                                <input type="image" name="btnRefresh" id="btnRefresh" tabindex="-1" title="Refresh captcha" src="./Styles/images/refresh.png" style="border-width:0px;height: 16px; margin-bottom: 10px; width: 20px;" />
                                                <span id="lblerrmsg" style="color: red; position: relative; top: -3px;"></span>
                                                <br />
                                            </div>
                                        
</div>
                                </div>
                            </div>
                            <div class="divLoginRight span5">
                                <div class="control-group">
                                    <label class="control-label">
                                        Email Address (Username)
                                    </label>
                                    <div class="controls">
                                        <input type="text" id="txtEmail" tabindex="2" onblur="CheckDuplicateEmail(this.value)"
                                            onfocus="RemoveLabeltext()" validationgroup="addStudentSignup" validationtype="Email"
                                            placeholder="Your Email Address" />
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">
                                        Confirm Password:
                                    </label>
                                    <div class="controls">
                                        <input type="password" id="PasswordConfirm" tabindex="4" validationgroup="addStudentSignup"
                                            validationtype="Password" placeholder="Your Password" />
                                    </div>
                                </div>
                                <div class="control-group">
                                    <div class="controls">
                                        <button id="btnRegister" type="button" tabindex="7" class="btn btn-success btn-large has-spinner">
                                            <span class="spinner"><i class="icon-spin icon-refresh"></i></span>
                                            Register</button>
                                        <button id="btnCancelRegistration" tabindex="8" type="button" class="btn btn-danger btn-large">
                                            Cancel</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div />
        <div id="tblPostSignupPopup" class="dataTables_processing">
            <div class="loaderbg"></div>
            <div class="loadingwrapper">
                <span class="loading loadingimg"></span>
                <span class="loadingmsg">Signup Successfully Completed</span>
                <div class="morecontent">
                    <p>An email has been sent at your email address with the sign up details.</p>
                    <p>For Now We are <strong><i>redirecting to your Admission Profile</i></strong> after 5 seconds</p>
                    <p><i>(Click below to skip this message and go to application page)</i></p>
                    <a id="popupRedirect" href="/ulknew/Student.aspx" class="btn btn-info btn-small">Go To Application Page</a>
                </div>
            </div>
        </div>
        

<script type="text/javascript">
//<![CDATA[
$(document).ready(function(){$('#controlIcons').removeClass('Full-Navigation').addClass('Half-Navigation');$('#announcement').removeClass('No-Announcement').addClass('Full-Announcement');$('.studentSignUpWrapper').removeClass('studentSignUpWrapper')});//]]>
</script>
</form>
    <script type="text/javascript">
        function SessionEnd() {
            $('.modal').remove();
            $('.modal-backdrop').remove();
            $('#txtUserName').focus();
        }
        function ValidateLoginForm() {
            $username = $("#txtUserName").val();
            $password = $("#txtPassword").val();
            var isValid = 1;
            if ($.trim($username) == "") {
                $("#txtUserName").addClass("input-required-class");
                isValid = 0;
            }
            if ($.trim($password) == "") {
                $("#txtPassword").addClass("input-required-class");
                isValid = 0;
            }
            if (isValid == 1) {
                return true;
            }
            else {
                return false;
            }
        }
        $(document).ready(function () {
            $("#txtUserName,#txtPassword").focus(function () {
                $(this).removeClass("input-required-class");
            });
        });
    </script>
</body>

</html>
