/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var sec = 0;
var sdate;
var timer, timer1, timer2, counter;
var timerInterval = null;
var today, today1;
//var numbers = new Store("counter");

function startDate()
{
    today = new Date();
    var dd = today.getDate();
    //document.write(dd);
    var mm = today.getMonth()+1; //January is 0!
    var yyyy = today.getFullYear();

    if(dd<10) 
    {
        dd='0'+dd;
    }

    if(mm<10) 
    {
        mm='0'+mm;
    }
    today = dd+'/'+mm+'/'+yyyy;
    //document.getElementById("s_date").innerHTML = today;
    return today;
}

function endDate()
{
    today1 = new Date();
    var dd1 = today1.getDate();
    var mm1 = today1.getMonth()+1; //January is 0!
    var yyyy1 = today1.getFullYear();

    if(dd1<10) 
    {
        dd1='0'+dd1;
    } 

    if(mm1<10) 
    {
        mm1='0'+mm1;
    }
    today1 =dd1+'/'+mm1+'/'+yyyy1;
    //document.getElementById("e_date").innerHTML = today1;
    return today1;
}
function pad(val) 
{
    return val > 9 ? val : "0" + val;
}
function countUP () 
{

    document.getElementById("seconds").innerHTML = pad(++sec % 60);
    document.getElementById("minutes").innerHTML = pad(parseInt(sec / 60, 10));
 }
 
 function start () 
{
  //Document.write(today);
  startDate();
  sec=0;
  document.getElementById("seconds").innerHTML = "0"+ 00;
  document.getElementById("minutes").innerHTML = "0" + 00;
  timerInterval = setInterval(countUP, 1000);  
  counter=counter+1;
//  localStorage.setItem('counter', counter);
//  counter= "" + counter + 1;  
  //numbers.set('num', counter);  
}
function doSomething() 
{
   //do nothing here
}
function stop1 () 
{
  endDate();
  //counter = parseInt(numbers.get('num'));
  timer1= "last job time was " + "00:"+ pad(parseInt(sec / 60, 10))+ ":" + pad(++sec % 60) ; //"minutes"+"seconds";  
  timer2= "00:"+ pad(parseInt(sec / 60, 10))+ ":" + pad(++sec % 60) ;
  document.getElementById("t").innerHTML = timer1;
  //window.location.href = "Welcome1.jsp?a=&b=&c=" + today + today1 + timer2;
  sec=0;
  document.getElementById("seconds").innerHTML = "0"+ 00;
  document.getElementById("minutes").innerHTML = "0"+ 00;
  window.location.href = "Welcome1.jsp?a=" + today + "&b=" + today1 + "&c=" + timer2;
  //window.alert("in welcome 1");  
  //setTimeout(doSomething, 3000);
  //window.location.href = "Welcome2.jsp";
  //window.alert("in welcome 2");  
//  window.location.href = "Welcome1.jsp?a=<% out.print(today); %>&b=<% out.print(today1); %>\n\
// &c=<% out.print(timer2); %>";  
//  window.location.href = "Welcome1.jsp?a=<%=today%>&b=<%=today1%>&c=<%=timer2%>";  
    //window.location.href = "Welcome1.jsp? a=<%=today.getDate()%> & b=<%=today1.getDate()%> & c=<%=timer2%>";  
//  window.location.href = "Welcome1.jsp?b=" + today1;  
//  window.location.href = "Welcome1.jsp?c=" + timer2;  
  //return timer1;
}

// Tweak our main app details variable, adding a "user_agent" string
// A "user_agent" is a Toggl API requirement
var appDetails = {
 togglAPIKey: 'bb1a52a2006ce158bbf962ec13c1bd6f',
 togglWorkspaceID: '1969193',
 user_agent: 'ASTA_pateldivyesh6859@yahoo.in'//some change was "ASTA"
};/**
 * Retrieves data from the Toggl API
 * @param {String} dataUrl (URL to retrieve)
 * @return {Object} data (Returned Data)
 */
function retrieveTogglData(dataUrl,callback)
{// Create Base64 Encoded "Basic" Authorization string
 var authStr = 'Basic ' + window.btoa(window.appDetails.togglAPIKey + ':api_token');// Create Authorization header
 var requestHeaders = { 'Authorization': authStr };// Create parameter object, passing our required parameters
 var dataObj = {
 user_agent: window.appDetails.user_agent,
 workspace_id: window.appDetails.togglWorkspaceID
 };// jQuery AJAX GET request, including Authorization headers
 jQuery.ajax({
 url: dataUrl,
 data: dataObj,
 headers: requestHeaders,
 success: function(data){// Successful GET request// Fire the callback function, if it was a function passed
 // We also pass the data received from Toggl to the function
 if (typeof callback === 'function') callback(data);}
 }).fail(function(errorData){// Failure to retrieve data// Show error alert
 alert('Error retrieving data from the Toggl API!' + "\r\n" + 'Error Code:' + errorData.statusText);});
}
