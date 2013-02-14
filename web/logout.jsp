<%--
    Document   : logout
    Created on : 21 Apr, 2012, 8:25:17 PM
    Author     : Udit Desai
--%>

<%
    try {
        session.invalidate();
        response.sendRedirect("index.jsp");
        out.println("true");
    } catch (Exception e) { out.println(e); }
%>