<%-- 
    Document   : Welcome
    Created on : 04/05/2017, 2:24:39 PM
    Author     : Div
--%>

<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
<script type="text/javascript" src = "js/main.js"></script>        
    </head>
    <body>
<%      
    String sdate = request.getParameter("a");
    String edate = request.getParameter("b");
    String etime = request.getParameter("c");
    //String counter = request.getParameter("d");    
    //int counter1 = Integer.parseInt(counter);
    //Long l = Long.valueOf(counter1);

   //databse setup

   String URL = "jdbc:derby://localhost:1527/Div";
   //DB username: d
   String USERNAME = "APP";
   //DB password: d
   String PASSWORD = "APP";

   Connection connection = null; // manages connection
   connection = DriverManager.getConnection( URL, USERNAME, PASSWORD );
   //defining prepered statements for queries
   PreparedStatement insertEntry = null;
   PreparedStatement log=null;   
   ResultSet tableKeys=null;
   int x=0, i=0;
 
   try
   {  
   //String command = "INSERT INTO timetracker(TT_ID, TT_ETIME, TT_EDATE, TT_SDATE) VALUES (1, 'hi','hi','hi')";
   String command1 = "INSERT INTO timetracker(TT_ID, TT_ETIME, TT_EDATE, TT_SDATE) VALUES (?,?,?,?)";
   log = connection.prepareStatement(command1);
   //insertEntry = connection.prepareStatement(command,Statement.RETURN_GENERATED_KEYS);
   //i++;
   //insertEntry = connection.prepareStatement(command,Statement.RETURN_GENERATED_KEYS);
   //insertEntry.execute();
   
   //Statement st=connection.createStatement();
   // = st.executeQuery("SELECT Max( TT_ID) FROM TIMETRACKER");
   //int i = select max(id) from student;   
   //tableKeys= st.executeQuery("SELECT Max( TT_ID) FROM TIMETRACKER");
   //tableKeys.next();
   //out.println(tableKeys.getString(1));
   //alert(tableKeys.getString(1));
   log.setInt(1,1);
   log.setString(2,etime);
   log.setString(3,edate);
   log.setString(4,sdate);
   //insertEntry.setInt(5,3);
   //insertEntry.setInt(6,2);
   //execute the preparedstatement
   //log.execute();
   x = log.executeUpdate();  
   //connection.close();
    
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
<!--page rendering back to user's profile-->
<script>
window.alert("Data is inserted successfully in database");    
window.location.href = "userProfile.xhtml";
</script>

    </body>
</html>
