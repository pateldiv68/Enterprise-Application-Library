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
    </head>
    <body>
        <h1>Hello World!</h1>
<% 
    String sdate = request.getParameter("a");
    String edate = request.getParameter("b");
    String etime = request.getParameter("c");
   /* Create string of connection url within specified 
   format with machine name, 
    port number and database name. Here machine name id 
    localhost and database name is student. */
    String connectionURL = "jdbc:derby://localhost:1527/Div";
          // declare a connection by using Connection interface 
    Connection connection = null;
        // declare object of Statement interface that uses for executing sql statements.
    PreparedStatement pstatement = null;
         // Load JBBC driver "com.mysql.jdbc.Driver"
    Class.forName("com.mysql.jdbc.Driver").newInstance();    
    int updateQuery = 0;
     
     	 // check if the text box is empty
	 if(sdate!=null && edate!=null && etime!=null)
         {
	     // check if the text box having only blank spaces
	     if(sdate!="" && edate!="" && etime!="") 
             {
	       try {
              /* Create a connection by using getConnection()
              method that takes parameters of string type 
              connection url, user name and password to connect 
		to database. */
              connection = DriverManager.getConnection(connectionURL, "APP", "APP");
// sql query to insert values in the secified table.
            //  String queryString = "INSERT INTO TIMETRACKER(TT_ETime, TT_Edate, TT_Sdate) VALUES (?, ?, ?)";
            
              	      /* createStatement() is used for create statement
              object that is used for 
		sending sql statements to the specified database. */
              pstatement = connection.prepareStatement(queryString);
              pstatement.setString(1, etime);
	      pstatement.setString(2, edate);
	      pstatement.setString(3, sdate);
              updateQuery = pstatement.executeUpdate();
              if (updateQuery != 0) { %>
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
   
               }
            finally {
                // close all the connections.
                pstatement.close();
                connection.close();
            }
	  }
	}
%>              
%>

<input type="text" name="id1" value="<%= request.getParameter("a")%>"/>

<input type="text" name="id2" value="<%= request.getParameter("b")%>"/>
<input type="text" name="id3" value="<%= request.getParameter("val")%>"/>
    </body>
</html>
