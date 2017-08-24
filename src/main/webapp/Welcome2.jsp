<%-- 
    Document   : Welcome
    Created on : 04/05/2017, 2:24:39 PM
    Author     : Div
--%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
<script type="text/javascript" src = "js/main.js"></script>        
    </head>
    <body>
    <h1>Hello World!</h1>
<%      
   String URL = "jdbc:derby://localhost:1527/Div";
   //DB username: d
   String USERNAME = "APP";
   //DB password: d
   String PASSWORD = "APP";

   Connection connection = null; // manages connection
   connection = DriverManager.getConnection( URL, USERNAME, PASSWORD );
   PreparedStatement log=null;   
   ResultSet tableKeys=null;

   int x=0, i=0;
 
   try
{  
   String selectSQL = "SELECT TASK.TASK_NAME, PROJECT.PROJECT_NAME, TIMETRACKER.TT_SDATE, TIMETRACKER.TT_EDATE, TIMETRACKER.TT_ETIME"
        + "FROM TimeTracker, TASK, PROJECT"
        + "INNER JOIN TASK ON"
        + "TASK.TASK_ID=TIMETRACKER.TT_ID"
        + "INNER JOIN PROJECT ON"
        + "PROJECT.PROJECT_ID=TIMETRACKER.TT_ID";
 
   log = connection.prepareStatement(selectSQL);
   ResultSet rs = log.executeQuery(selectSQL);
   while (rs.next()) 
   {
	out.println(rs.getString("TASK_NAME"));
	out.println(rs.getString("PROJECT_NAME"));
	out.println(rs.getString("TT_SDATE"));
	out.println(rs.getString("TT_EDATE"));
	out.println(rs.getString("TT_ETIME"));
   }
    
              if (x != 0) 
              {%>
	           <br>
	           <TABLE style="background-color: #E3E4FA;" 
                   WIDTH="30%" border="1">
		      <tr><th>Data is inserted successfully 
                    in database.</th></tr>
		   </table>
              <%
              }
            } 
            catch (Exception ex) {
            out.println("Unable to connect to batabase.");
            //System.err.println("Got an exception!");
            //System.err.println(ex.getMessage());
               }
            finally {
                // close all the connections.
                log.close();
                connection.close();
            }
	  
%>    
<!--
<script>
window.alert("Data is inserted successfully in database");    
window.location.href = "userProfile.xhtml";
</script>
-->
    </body>
</html>
