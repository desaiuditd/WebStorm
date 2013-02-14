<%--
    Document   : generateAuthLink
    Created on : 22 Apr, 2012, 12:09:22 PM
    Author     : Udit Desai
--%>

<%@page import="dropbox.Dropbox"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    try {
        Dropbox db = new Dropbox();
//        session.setAttribute("objDropbox",db);
        application.setAttribute("objDropbox",db);
        out.print(db.getWebAuthSessionURL());
    }
    catch(Exception e) { e.printStackTrace(); }
%>