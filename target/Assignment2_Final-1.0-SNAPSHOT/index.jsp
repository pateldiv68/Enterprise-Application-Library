<%-- 
    Document   : index
    Created on : 19/04/2017, 10:28:10 AM
    Author     : Nikesh Poudel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

<script type="text/javascript" src = "js/main.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<script>
jQuery(document).ready(function()
{// Initialise the retrieval of data:
 // Specifying the URL for the Weekly Data Report
 // ... and a callback function which outputs the data returned into the console
 var a = retrieveTogglData('https://toggl.com/reports/api/v2/summary?since=2017-03-01&until=2017-06-01',function(data){// output the data returned into the debug console
 console.log('Data Returned:',data);
 document.write("<h2>Toggl report in last three months</h2>");
 var obj=JSON.stringify(data);
 for (i=0; i<100; i++)
 { 
  // using for loop for getting data from toggl  
  var id = document.write(JSON.stringify(" ID: "+ data.data[i].id) +   '&nbsp;&nbsp;&nbsp;' ); //slecting information [ID] only from the json format data
  var name=  document.write(JSON.stringify(" Name: "+data.data[i].name) +   '&nbsp;&nbsp;&nbsp;' );//slecting information [name] only from the json format data
  var des = document.write(JSON.stringify(" Description: "+ data.data[i].description)+ "" +   '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');//slecting information [description] only from the json format data
  var clinet= document.write(JSON.stringify(" Project Name: " + data.data[i].client)+ "  " +       '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');//slecting information [client] only from the json format data
  var dur =document.write(JSON.stringify(" Project Duration: "+data.data[i].dur)+ " "+           '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');//slecting information [duration] only from the json format data
  var date=  document.write(JSON.stringify(" End Date : "+data.data[i].end) + "  " +       '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+ "<br>"+ "<br>");//slecting information [end date] only from the json format data
/* 
https://toggl.com/reports/api/v2/details?since=2017-03-01&until=2017-06-01
  var id = (JSON.stringify(" ID: "+ data.data[i].id) +   '&nbsp;&nbsp;&nbsp;');
  document.getElementById("id").innerHTML = id;
  var name = (JSON.stringify(" Name: "+data.data[i].name) +   '&nbsp;&nbsp;&nbsp;');
  document.getElementById("name").innerHTML = name;
  var des = (JSON.stringify(" Description: "+ data.data[i].description)+ "" +   '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
  document.getElementById("des").innerHTML = des;
  var client = (JSON.stringify(" Project Name: " + data.data[i].client)+ "  " +       '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
  document.getElementById("client").innerHTML = client;
  var dur = (JSON.stringify(" Project Duration: "+data.data[i].dur)+ " "+           '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
  document.getElementById("dur").innerHTML = dur;
  var date = (JSON.stringify(" End Date : "+data.data[i].end) + "  " +       '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+ "<br>"+ "<br>");  
  document.getElementById("date").innerHTML = date; 
*/
}  
alert('Total milliseconds recorded for duration: ' + data.total_grand);
});}); // total millisecond spend on the full projects...
function    goback()
{
    window.location.href="userProfile.xhtml";
}
</script>

<span id="id">id</span>
<span id="name">name</span>
<span id="des">des</span>
<span id="client">client</span>
<span id="dur">dur</span>
<span id="date">date</span>

<!--<button value = "goback" onclick="goback()">Go Back</button>--> 
</body>
</html>