<cfcomponent output="no">
  <cfset config=createObject("component", "ServerPages.Applications.Login.Components.Config") />
  <cfset config.init()>
  
  <!---Ideally this where it connects to Active Directory (AD) and authenticate this user. 
  In Coldfusion environment, this is this would exsist in Application.cfc. And that's also where the session variables are created etc.---> 
  <cffunction name="AuthThisUser" output="no" access="remote" returntype="struct">
  	<cfargument name="usrName" type="string" required="yes">
    <cfargument name="pssWord" type="string" required="yes">
	<cfset AuthThisUser_strct ={}>
    <!--Default values-->
	<cfset AuthThisUser_strct.Status = 'NotGood'>
    <cfset AuthThisUser_strct.Proceed = false>
    <cfset AuthThisUser_strct.uID = 999>
    <cfset AuthThisUser_strct.fName = 'default_FirstName'>
    <cfset AuthThisUser_strct.lName = 'default_LastName'>
    <cfset AuthThisUser_strct.Role = 99>
      
    <!--Checking in Table for User Entry-->
    <cfquery name="CheckHere" datasource="#config.DNS(1)#">
      SELECT U.uID, U.uName, U.Password, U.RoleID AS Role, UD.FirstName AS fName, UD.LastName As lName
      FROM TEST_User U
      LEFT JOIN TEST_UserDetails UD
      ON U.uID = UD.uID 
      WHERE U.uName = <cfqueryparam value="#trim(ARGUMENTS.usrName)#" cfsqltype="cf_sql_varchar">
      	AND U.Password = <cfqueryparam value="#trim(ARGUMENTS.pssWord)#" cfsqltype="cf_sql_varchar">	
        AND UD.Active = <cfqueryparam value="Y" cfsqltype="cf_sql_varchar">
    </cfquery>
    <!--Check for whether exists -->
    <CFIF CheckHere.RecordCount GT 0> <!--User Good to Go-->
      <cfset AuthThisUser_strct.Status = 'GoodToGo'>
      <cfset AuthThisUser_strct.Proceed = true>
      <cfset AuthThisUser_strct.uID = trim(CheckHere.uID)>
	  <cfset AuthThisUser_strct.fName = trim(CheckHere.fName)>
      <cfset AuthThisUser_strct.lName = trim(CheckHere.lName)>
      <cfset AuthThisUser_strct.Role = trim(CheckHere.Role)>
    </CFIF>	
	<cfreturn AuthThisUser_strct>
  </cffunction>
  
  <!---Get User Info--->
  <cffunction name="GetUserInfo" output="no" access="remote" returntype="struct">
  	<cfargument name="uID" type="numeric" required="yes">
    <cfset UserInfo_strct = {}>
    <cfquery name="qGetUserInfo" datasource="#config.DNS(1)#">
      SELECT UD.uID, UD.FirstName, UD.LastName, U.RoleID
      FROM TEST_UserDetails UD
      LEFT JOIN TEST_User U
      ON UD.uID = U.uID
      WHERE UD.uID = <cfqueryparam value="#ARGUMENTS.uID#" cfsqltype="cf_sql_integer">
    </cfquery>
    <!--Into UserInfo_strct Struct-->
    <cfset UserInfo_strct.uID = trim(qGetUserInfo.uID)>
    <cfset UserInfo_strct.firstName = trim(qGetUserInfo.FirstName)>
    <cfset UserInfo_strct.lastName = trim(qGetUserInfo.LastName)>
    <cfset UserInfo_strct.roleID = trim(qGetUserInfo.RoleID)>
    <cfreturn UserInfo_strct>
  </cffunction>
  
  <!---Get All Users--->
  <cffunction name="GetAllUsers" output="no" access="remote" returntype="query">
  	<cfquery name="qGetAllUsers" datasource="#config.DNS(1)#">
      SELECT * 
      FROM TEST_UserDetails UD, TEST_User U, TEST_Role R
      WHERE U.uID = UD.uID AND U.RoleID = R.RoleID 	
      ORDER BY UD.LastName
    </cfquery>
    <cfreturn qGetAllUsers>
  </cffunction>

</cfcomponent>