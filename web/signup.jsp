<%--
    Document   : signup
    Created on : 9 Apr, 2012, 6:39:22 PM
    Author     : Udit Desai
--%>

<%@page import="dropbox.Dropbox"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    String username,password,firstName,lastName,emailID;
%>
<%
    try {

        username = request.getParameter("txtUsername");
        password = request.getParameter("txtPassword");
        firstName = request.getParameter("txtFirstName");
        lastName = request.getParameter("txtLastName");
        emailID = request.getParameter("txtEmail");

        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/webstorm", "root", "");
        Statement st = con.createStatement();

        st.executeUpdate("insert into user (username,password,firstName,lastName,emailID) values (\""
                +username+"\",\""+password+"\",\""+firstName+"\",\""+lastName+"\",\""+emailID+"\")");

        st.close();
        con.close();

        session.setAttribute("username",username);
        out.println("Registration Successful !!!");
    }catch(Exception e) { out.println(e.getMessage()); }
%>
