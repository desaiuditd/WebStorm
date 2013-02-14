<%--
    Document   : dropbox
    Created on : 21 Apr, 2012, 2:32:35 AM
    Author     : Udit Desai
--%>

<%@page import="com.dropbox.client2.session.AccessTokenPair"%>
<%@page import="dropbox.Dropbox"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<script>
    $(document).ready(
        function() {
            $("#aDBAuthLink").click(
                function() {
                    $.post("retrieveAccessTokenPair.jsp"
                        , function(res) {

                        }
                    );
                }
            );
        }
    );
</script>

<%
    Dropbox db = (Dropbox) application.getAttribute("objDropbox");
    String username = (String) session.getAttribute("username");

    try {
            while(!db.isAccessTokenPairAvailable());

/*            System.out.println("Hello");

            db.setACCESSS_TOKEN_KEY(db.getSession().getAccessTokenPair().key);
            System.out.println("Hello");
            db.setACCESSS_TOKEN_SECRET(db.getSession().getAccessTokenPair().secret);
            System.out.println("Hello");
            AccessTokenPair reAuthTokens = new AccessTokenPair(db.getACCESS_TOKEN_KEY(),db.getACCESS_TOKEN_SECERET());
            System.out.println("Hello");
            db.getSession().setAccessTokenPair(reAuthTokens);
            System.out.print(db.getMDBApi().accountInfo().displayName);
            System.out.println("Hello");*/
    }catch(Exception e) { out.println(e); }
%>
