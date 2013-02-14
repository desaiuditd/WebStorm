<%--
    Document   : index
    Created on : 9 Apr, 2012, 3:16:38 PM
    Author     : Udit Desai
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Web Storm</title>
        <link type="text/css" href="css/menu.css" rel="stylesheet">
        <link type="text/css" href="css/tab.css" rel="stylesheet">
        <link type="text/css" href="css/register.css" rel="stylesheet">
        <link type="text/css" href="css/login.css" rel="stylesheet">
        <link type="text/css" href="css/codemirror.css" rel="stylesheet">
        <link type="text/css" href="css/lesser-dark.css" rel="stylesheet">
        <link type="text/css" href="css/jquery.ui.dialog.css" rel="stylesheet">

        <style type="text/css">
            .menu {font-family:Arial; font-size:10pt; font-weight:normal; color:aliceblue }

            * {
                margin:0;
                padding:0px 2px 2px 2px;
            }
            body {
                background:rgb(74,81,85);
                padding:0px 1px 1px 1px;
            }
            div#menu { margin:5px auto; }
            div#copyright a { display: none; }
            .ui-widget-overlay{display: none;}
            .ui-icon-closethick{display:none!important}
        </style>

        <script type="text/javascript" src="js/jQuery.js"></script>
        <script type="text/javascript" src="js/jQuery_menu.js"></script>
        <script type="text/javascript" src="js/jquery.ui.core.js"></script>
        <script type="text/javascript" src="js/jquery.ui.widget.js"></script>
        <script type="text/javascript" src="js/jquery.ui.position.js"></script>
        <script type="text/javascript" src="js/jquery.ui.dialog.js"></script>
        <script type="text/javascript" src="js/menu.js"></script>
        <script type="text/javascript" src="js/codemirror.js"></script>
        <script type="text/javascript" src="js/clike.js"></script>

        <script language="javascript">
            function movein(which,html){
                which.style.background='aliceblue'
                description.innerHTML=html
            }
            function moveout(which){
                which.style.background='aliceblue'
                description.innerHTML='&nbsp;'
            }
        </script>

        <script>

            $(document).ready(
                function () {

                    var currtab;
                    var retVal;
                    var editor = new Array();
                    var $signup_login_dialog = $("#signup_login").dialog({
			autoOpen: false,
                        position: "center",
                        width: 750,
                        height: 600,
                        modal: true,
                        beforeClose: function() {

                            $("#txtFirstName").val("");
                            $("#txtLastName").val("");
                            $("#txtEmail").val("");
                            $("#txtUsername").val("");
                            $("#txtPassword").val("");
                            $("#txtVerifyPassword").val("");
                            $("#txtUsernameLogin").val("");
                            $("#txtPasswordLogin").val("");
                            $("#spnFirstNameStatus").html("");
                            $("#spnLastNameStatus").html("");
                            $("#spnEmailStatus").html("");
                            $("#spnUsernameStatus").html("");
                            $("#spnPasswordStatus").html("");
                            $("#spnVerifyPasswordStatus").html("");
                            $("#spnSignUpStatus").html("");
                        }
                    });

                    $("#liGetStarted").click(function(){
                        $signup_login_dialog.dialog('open');
                        return false;
                    });

                    $("#outputtabcontent").ready(function() {
                        $("#outputtabcontent").slideUp("slow");
                        setTimeout('$("#tabcontent").css("height","465px")',550);
                        setTimeout('$(currtab).css("height","460px")',550);
                        setTimeout('$(".CodeMirror-scroll").css("height","460px")',550);
                        return false;
                    });

                    $("#error_output").bind("click", function() {
                        $("#outputtabcontent").slideDown("slow");
                        $("#tabcontent").css("height","270px");
                        $("#divHome img").css("height","270px");
                        $(".CodeMirror-scroll").css("height","268px");
                        $(currtab).attr("rows","13");
                        return false;
                    });

                    $("#error_close").bind("click", function() {
                        $("#outputtabcontent").slideUp("slow");
                        setTimeout('$("#tabcontent").css("height","465px")',550);
                        setTimeout('$("#divHome img").css("height","270px")',550);
                        setTimeout('$(".CodeMirror-scroll").css("height","460px")',550);
                        setTimeout('$(currtab).attr("rows","23")',550);
                        return false;
                    });

                    $("#liLogout").bind("click",function() { $.post("logout.jsp",
                        function(res) {
                            if(res.indexOf("true")!=-1)
                                $(location).attr("href","index.jsp");
                        });
                    });

                    $("#liOpen").click(function() {
                        $.post("open.jsp", function(res) {
                            editor[currtab].setValue(res);
                        })
                    });

                    $("#liSave").click(function() {
                        if($("currtab").val()!="") {
                            $.post("save.jsp", {
                                txtInputArea :editor[currtab].getValue()
                            });
                        }
                    });

                    $("#liCompile").click(function() {
                        if($(currtab).val()!="") {
                            $.post("compile.jsp", {
                                txtInputArea : editor[currtab].getValue()
                            }, function(res) {
                                $("#txtOutput").html(res);
                            });
                        }
                    });


                    $("#tabul li").live("click", function() {
                        var content = $(this).attr("id");
                        var ewr = content.substring(1,2);
                        currtab = ewr;
                    });

                    $(function() {
                        var total_tabs = 0;
                        addHome();

                    $("#liNew").click(function() {
                            retVal = prompt("Enter file name : ", "");
                            var mid= retVal.lastIndexOf(".")+1;
                            var addee=retVal.length();
                            alert(addee);
                        extn= retVal.substr(mid,addee);
                        alert(extn);
                            total_tabs++;
                            $("#tabcontent p").hide();
                            addtab(total_tabs);
                            return false;}

                    );

                        function addHome() {

                            var closetab = '<a href="" id="closeHome" class="close">&times;</a>';
                            $("#tabul").append('<li id="tHome" class="ntabs">Home&nbsp;&nbsp;'+closetab+'</li>');
                            $("#tabcontent").append('<p id="cHome"></p>');
                            $("#tabcontent #cHome").append('<div id="#divHome"><img src="css/images/main_page.png" width="100%" height="100%"/></div>');
                            $("#tabul li").removeClass("ctab");
                            $("#tHome").addClass("ctab");
                            currtab=0;

                            $("#tHome").bind("click", function() {
                                $("#tabul li").removeClass("ctab");
                                $("#tHome").addClass("ctab");
                                $("#tabcontent p").hide();
                                $("#cHome").fadeIn('slow');
                            });

                            $("#closeHome").bind("click", function() {
                                // activate the previous tab
                                $("#tabul li").removeClass("ctab");
                                $("#tabcontent p").hide();
                                $(this).parent().prev().addClass("ctab");
                                $("#cHome").prev().fadeIn('slow');
                                $(this).parent().remove();
                                $("#cHome").remove();
                                return false;
                            });
                        }

                        function addtab(count) {

                            var closetab = '<a href="" id="close'+count+'" class="close">&times;</a>';
                            $("#tabul").append('<li id="t'+count+'" class="ntabs">'+count+'&nbsp;&nbsp;'+closetab+'</li>');
                            $("#tabcontent").append('<p id="c'+count+'">'
                                +'<textarea style="resize:none;" rows="23" cols="163" id="txtInputArea'
                                    +count+'"></textarea></p>');
                            $("#tabul li").removeClass("ctab");
                            $("#t"+count).addClass("ctab");
                            currtab=count;

                            editor[count] = CodeMirror.fromTextArea(document.getElementById("txtInputArea"+count),{
                                lineNumbers: true,
                                autofocus: true,
                                matchBrackets: true,
                                theme: "lesser-dark",
                                mode: "text/x-java"
                            });

                            $("#t"+count).bind("click", function() {
                                $("#tabul li").removeClass("ctab");
                                $("#t"+count).addClass("ctab");
                                $("#tabcontent p").hide();
                                $("#c"+count).fadeIn('slow');
                            });

                            $("#close"+count).bind("click", function() {
                                // activate the previous tab
                                $("#tabul li").removeClass("ctab");
                                $("#tabcontent p").hide();
                                $(this).parent().prev().addClass("ctab");
                                $("#c"+count).prev().fadeIn('slow');
                                $(this).parent().remove();
                                $("#c"+count).remove();
                                return false;
                            });
                        }
                    });
                }
            );
        </script>

    </head>

    <body style="font-style: Segoe Script">
        <div id="menu">
            <ul class="menu" style="margin-left:30px">
                <li id="liHome" class="parent">
                    <a href="#">
                        <span>
                            <b>
                                Hello,
                                <%
                                    if(session.getAttribute("username")!=null)
                                        out.print(session.getAttribute("username"));
                                    else out.print("Guest");
                                %>
                            </b>
                        </span>
                    </a>
                    <ul>
                        <%
                            if(session.getAttribute("username")==null) {
                        %>
                        <li id="liGetStarted"><a href="#"><span><b>Get Started</b></span></a></li>
                        <% } else { %>
                        <li id="liEdit"><a href="#"><span><b>Edit Profile</b></span></a></li>
                        <li id="liChangePassword"><a href="#"><span><b>Change Password</b></span></a></li>
                        <li id="liLogout"><a href="#"><span><b>Logout</b></span></a></li>
                        <% } %>
                    </ul>
                </li>
                <%
                    if(session.getAttribute("username")!=null) {
                %>
                <li id="liNew"><a href="#"><span><b>New</b></span></a></li>
                <li id="liOpen"><a id="aOpen" href="#"><span><b>Open</b></span></a></li>
                <li id="liSave"><a href="#"><span><b>Save</b></span></a></li>
                <li id="liCompile"><a href="#"><span><b>Compile</b></span></a></li>
                <li id="liBuild"><a href="#"><span><b>Build</b></span></a></li>
                <% } %>
                <li class="last" id="liTitle" style="margin-top: 4px">
                    <img src="css/images/wstry1.ico" align="absmiddle">
                    <b><i><font face="Segoe Script" size="4">Web Storm</font></i></b>
                </li>
            </ul>
        </div>

        <div id="container">
            <center>
                <ul id="tabul" class="tabul">
                </ul>
            </center>
            <div id="tabcontent">
            </div>
            <% if(session.getAttribute("username")!=null) { %>
            <div id="divOutput">
                <center>
                    <ul class="tabul">
                        <li id="error_output" class="ntabs">Error/Output&nbsp;&nbsp;<a href="#" id="error_close" class="close">&times;</a></li>
                    </ul>
                </center>
                <div id="outputtabcontent">
                    <textarea readonly="readonly" style="resize:none" id="txtOutput" rows ="10" cols="160"></textarea>
                </div>
            </div>
            <% } %>
        </div>

        <div id="copyright">Copyright &copy; 2012 WebStorm<a href="http://apycom.com/"></a></div>

        <div class="ui-dialog ui-widget ui-widget-content ui-corner-all" style="display : none;">
             <div class="ui-dialog-titlebar ui-widget-header ui-corner-all">
                <span id="ui-dialog-title-dialog" class="ui-dialog-title">Sign Up/Login</span>
                <a class="ui-dialog-titlebar-close ui-corner-all" href="#"><span class="ui-icon ui-icon-closethick"></span></a>
             </div>
            <div class="ui-dialog-content ui-widget-content" id="signup_login">
                <p><%@include file="signUp_Login.jsp"%></p>
            </div>
            <div class="ui-dialog-titlebar ui-widget-header ui-corner-all"></div>
        </div>
    </body>
</html>