<%--
    Document   : login
    Created on : 21 Apr, 2012, 7:03:35 PM
    Author     : Udit Desai
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%
            String username=request.getParameter("txtUsernameLogin");
            String pass=request.getParameter("txtPasswordLogin");
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/webstorm", "root", "");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select username from user where username=\""+username+"\" and password=\""+pass+"\"");

                boolean flag=false;
                if(rs.next()) {
                    out.println("Welcome, "+   request.getParameter("txtUsernameLogin") );
                    out.println("Successful Login!!!");
                    session.setAttribute("username", username);
                    flag=true;
                }

                if(flag==false)
                    out.println("Please Re login");
            }
            catch(Exception e){ e.printStackTrace(); }
        %>
    </body>
</html>
