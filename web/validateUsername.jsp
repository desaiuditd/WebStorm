<%--
    Document   : validateUserName
    Created on : 9 Apr, 2012, 7:23:08 PM
    Author     : Udit Desai
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<%
    try {
        String username = request.getParameter("txtUsername");

        if(username.length()>=6 && username.length()<=32) {

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/webstorm", "root", "");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select username from user");

            while(rs.next()) {
                if(username.equals(rs.getString(1))) {
                    out.println("Username is not available");
                    break;
                }
            }
            out.println("");

            rs.close();
            st.close();
            con.close();
        }
        else out.println("Username must be between 6 & 32 character");
    }
    catch(Exception e) { out.println(e.getMessage()); }
%>