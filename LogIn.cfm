<!doctype html>
<html lang="en-us">
<head>
    <title>Login Page</title>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="Login.css">
</head>    
<body>

<br><br><br>

<!--Creating array implicitly to Hold Login Messages/Notes-->
<cfset WhyBack_arr = ["Sorry, Incorrent UserName and/or Password", "You are now successfully logged out", "Another Msg"]>

<CFIF IsDefined('wBack')>
    <!--Msg/Note-->
    <cfswitch expression="#wBack#">
      <cfcase value="1">
        <cfset alterType = 'alert-danger'>	
      </cfcase>
      <cfcase value="2">
        <cfset alterType = 'alert-success'>	
      </cfcase>
      <cfdefaultcase>
      	<cfset alterType = 'alert-danger'>
      </cfdefaultcase>
    </cfswitch>
  
  <cfoutput>
  	<!--Displaying Msgs/Notes accordingly-->
  	<div class="alert #alterType#" role="alert">
      #WhyBack_arr[wBack]#
    </div>
  </cfoutput>
</CFIF>

<form class="form-inline" name="frm" method="post" action="ListPage.cfm">
  <div class="form-group">
    <label for="UserName">UserName</label>
    <div class="input-group">
      <div class="input-group-addon">
      	<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
      </div>
      <input type="text" class="form-control" name="frm.usr" placeholder="JDoe">
    </div>
  </div>
  <div class="form-group">
    <label for="Password">Password</label>
    <div class="input-group">
      <div class="input-group-addon">
      	<span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
      </div>
      <input type="password" class="form-control" name="frm.pwd">
    </div>
  </div>
  <button type="submit" class="btn btn-primary" id="btn_LogIn_id">Submit</button>
</form>


<!--THESE WILL BE IN A TEMPLATE-->
<link href="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/themes/flick/jquery-ui.min.css" rel="stylesheet" type="text/css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
<script src="Scripts/app.js"></script>

<body>
</body>
</html>