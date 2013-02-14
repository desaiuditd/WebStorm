<%--
    Document   : save
    Created on : 21 Apr, 2012, 3:29:01 PM
    Author     : Udit Desai
--%>

<%@ page import="java.io.*,javax.swing.*,javax.swing.filechooser.*,java.util.*,java.io.File.* ,java.awt.*" %>
<%
JFileChooser save1 = new JFileChooser();
			int option = save1.showSaveDialog(null);
			if (option == JFileChooser.APPROVE_OPTION) {
	try{
            BufferedWriter writer = new BufferedWriter(new FileWriter(save1.getSelectedFile().getPath()));
 String source = request.getParameter("txtInputArea");
	writer.write(source);
        writer.close();
 	} catch (Exception ex) {
	out.println(ex.getMessage());
       			}
        }
%>