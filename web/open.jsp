<%--
    Document   : open
    Created on : 21 Apr, 2012, 3:27:22 PM
    Author     : Udit Desai
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8" import="java.io.*,javax.swing.*,javax.swing.filechooser.*,java.util.*,java.io.File.* ,java.awt.* "%>
<%
    JFileChooser open1= new JFileChooser();
    open1.setFileFilter(new FileNameExtensionFilter(null,"java","txt"));
    int option = open1.showOpenDialog(null);
    if (option == JFileChooser.APPROVE_OPTION)
    {
        try {
            DataInputStream dis = new DataInputStream(new FileInputStream(open1.getSelectedFile()));
            String temp = dis.readLine();
            while (temp!=null) {
                out.println(temp);
                temp = dis.readLine();
            }
        }
        catch (Exception ex) {
            out.println(ex.getMessage());
        }
    }
%>