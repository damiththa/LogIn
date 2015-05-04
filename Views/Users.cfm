<!doctype html>
<html lang="en-us">
<head>
    <title>Login Page</title>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="../Login.css">
</head>    
<body>
<cfset Auth=createObject("component", "ServerPages.Applications.Login.Components.Authenticate") />

<cfset qUsers="#Auth.GetAllUsers()#"> <!--Into a query variable-->
<br>
<table class="table table-bordered table-condensed span5 center-table">
 <thead>
 	<th>First Name</th>
    <th>Last Name</th>
    <th>Role</th>
    <th>Active</th>
 </thead>
 <cfoutput query="qUsers">
 <tbody>
 	<td>#FirstName#</td>
    <td>#LastName#</td>
    <td>#Role#</td>
    <td>#Active#</td>
 </tbody>
 </cfoutput>
</table>

</body>
</html>