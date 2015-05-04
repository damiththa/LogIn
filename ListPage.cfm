<!doctype html>
<html lang="en-us">
<head>
    <title>Login Page</title>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="Login.css">
</head>    
<body>

<cfajaximport tags="cfdiv"> <!--AJAX Load-->

<cfset Auth=createObject("component", "ServerPages.Applications.Login.Components.Authenticate") />

<CFIF Auth.AuthThisUser('#frm.usr#','#frm.pwd#').Proceed>
  <!--Logged in User ID-->
  <cfset UserID = Auth.AuthThisUser('#frm.usr#','#frm.pwd#').uID>

  <!--IF LOGGED IN, CONTINUE DISPLAY PAGE ACCORDING TO THEIR ROLE-->
  <CFOUTPUT>
    Hello and welcome #Auth.GetUserInfo('#UserID#').firstName#,
    &nbsp;&nbsp;&nbsp;
    <div id="dialog"></div>
    <button type="button" id="btn_LogOut_id" class="btn btn-danger">Logout</button>
    
    <br>
    
    <hr>
    <h2>ENJOY THIS PAGE</h2>
    
    <CFIF Auth.GetUserInfo('#UserID#').roleID IS 1> <!--Check if the logged in user is an Admin-->
      <!--Show ADMIN functions-->
      <hr>
      <h4>Admin. only Functions</h4>
      <br>
      <!--Show All Users-->
      <button type="button" id="btn_ShowUsers_id" class="btn btn-info">Show Users</button>
      <br>
      <cfdiv id="ShowUsers_DIV" />
    </CFIF>
    
  </CFOUTPUT>

  <cfelse>
  <!--Redirecting back to LoginPage-->
  <cflocation url="LogIn.cfm?wBack=1">
</CFIF>

<!--THESE WILL BE IN A TEMPLATE-->
<link href="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/themes/flick/jquery-ui.min.css" rel="stylesheet" type="text/css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
<script src="Scripts/app.js"></script>

</body>
</html>
