<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="net.sf.jasperreports.engine.*" %>
<%@ page import="net.sf.jasperreports.engine.util.*" %>
<%@ page import="net.sf.jasperreports.engine.export.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="net.sf.jasperreports.view.JasperViewer" %>
 
<%@ include file="/html/init.jsp" %>
<%  
Conexion conexion = new Conexion();

//File reportFile = new File(application.getRealPath("/html/reportes/eventoUbicacion.jasper"));

//File reportFile = new File(application.getRealPath("/html/reportes/eventoUbicacion.jasper")); 

JasperPrint print = JasperFillManager.fillReport("C:\\liferay-portal-6.2-ce-ga2\\tomcat-7.0.42\\webapps\\Resphere-Liferay-portlet\\html\\reportes\\eventoUbicacion.jasper",
    new HashMap(),
    conexion.getconexion());


JasperExportManager.exportReportToPdfStream(print, response.getOutputStream());


%>