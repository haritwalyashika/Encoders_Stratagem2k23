<%-- 
    Document   : reisterPatient
    Created on : 18-March-2023
    Author     : Yashika
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.io.*,java.util.*,java.sql.*"%>
<%@page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt"%>


<!DOCTYPE html>
<html>
    
    <body>
        
        <%//request.getParameters reads the input given in form
            String Name=request.getParameter("Name");
            String DOB=request.getParameter("DOB");
            String BloodGroup=request.getParameter("BG");
            String EmailId=request.getParameter("Email");
            String Phone=request.getParameter("phone");
            String Password=request.getParameter("Password");
            
            
            //local variable formed to use in one another
        %>
        <sql:setDataSource var = "snapshot" driver = "org.postgresql.Driver"
        url = "jdbc:postgresql://127.0.0.1:128/patientDetails"
        user = "postgres"  password = "health"/>
        <fmt:parseDate value="${param.DOB}" var="parsedDOB" pattern="dd/MM/yyyy" />

        <sql:update dataSource = "${snapshot}" var = "result">
         INSERT INTO patient_details(patient_id,"Name","DOB","BloodGroup","Email","Phone","Password","registrationDate") VALUES (nextval('patient_id'),?,?,?,?,?,?,now());
         <sql:param value="${param.Name}" />
         <sql:dateParam value="${parsedDOB}" />
         <sql:param value="${param.BG}" />
         <sql:param value="${param.Email}" />
         <sql:param value="${param.Phone}" />
         <sql:param value="${param.Password}" />
         
         


               </sql:update>
 
         <%=Name%>, you have successfully registered!<br />
         
    </body>
    
</html>


