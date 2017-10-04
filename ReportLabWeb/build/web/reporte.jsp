<%-- 
    Document   : reporte
    Created on : 03-oct-2017, 20:36:42
    Author     : itmanager
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="net.sf.jasperreports.engine.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>



<%
String matricula = request.getParameter("matricula");
int id = Integer.parseInt(matricula);
Connection conexion; Class.forName("com.mysql.jdbc.Driver").newInstance();
conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/Reports","root","root");
File reportFile = new File(application.getRealPath("ReportOne.jasper"));
Map parameters = new HashMap();
parameters.put("matricula", id);
byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, conexion);
response.setContentType("application/pdf");
response.setContentLength(bytes.length);
ServletOutputStream outputStream = response.getOutputStream();
outputStream.write(bytes, 0, bytes.length);

outputStream.flush();
outputStream.close();

%>

