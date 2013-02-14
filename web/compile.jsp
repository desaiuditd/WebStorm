<%--
    Document   : compile
    Created on : 21 Apr, 2012, 3:27:22 PM
    Author     : Udit Desai
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8" import="java.io.*"%>
<%
    try {
        String source = request.getParameter("txtInputArea");

        File f = new File("E:/College & Study Stuff/DA/Sem - II/Web Storm/Development/Test/Java/Test.java");
        f.createNewFile();
        FileWriter fw = new FileWriter(f);
        fw.write(source);
        fw.close();

//        String []cmd = {"gcc",f.getCanonicalPath(),"-o","E:/College & Study Stuff/DA/Sem - II/Online IDE/Development/Test/C/test"};
        String []cmd = {"javac",f.getCanonicalPath()};

        Runtime r = Runtime.getRuntime();
        Process p = r.exec(cmd);

        BufferedReader brInput = new BufferedReader(new InputStreamReader(p.getInputStream()));
        BufferedReader brError = new BufferedReader(new InputStreamReader(p.getErrorStream()));

        String output="",error="",temp="";

        while((temp=brInput.readLine())!=null) { output+=temp; }
        out.println("Output : \""+output+"\"");

        while((temp=brError.readLine())!=null) { error+=temp; }
        out.println("Error : \""+error+"\"");

        p.waitFor();

        out.println("Exit Value : "+p.exitValue());

/*        if(p.exitValue()==0) {
            out.println("Hello");
//            String []c = {"\"E:/College & Study Stuff/DA/Sem - II/Online IDE/Development/Test/C/test\""};
            String []c = {"java","\"E:/College & Study Stuff/DA/Sem - II/Online IDE/Development/Test/Java/Test.class\""};
            Process p1 = r.exec(c);
            output=error=temp=null;
            brInput = new BufferedReader(new InputStreamReader(p1.getInputStream()));
            brError = new BufferedReader(new InputStreamReader(p1.getErrorStream()));
            while((temp=brInput.readLine())!=null) { output+=temp; }
            out.println("Output : \""+output+"\"");

            while((temp=brError.readLine())!=null) { error+=temp; }
            out.println("Error : \""+error+"\"");
            p1.waitFor();
            out.println("Exit Value : "+p1.exitValue());
        }*/

    } catch(Exception e) { out.println(e.getMessage()); }
%>