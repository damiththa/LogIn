<cfcomponent output="no">
  <!--Global variables-->	
  <cfset variables.dns_arr = ArrayNew(2)>  
   
  <!---init Function--->
  <cffunction name="init" output="no" access="public" returntype="any" hint="Initializing variable component">
      <!--DNS variables-->
	  <cfset variables.dns_arr[1][1] = 'HKWO'>
    <cfreturn this>
  </cffunction>
  
  <!---DNS--->
  <cffunction name="DNS" output="no" access="remote" returntype="string" hint="Returns called DNS">
  	<cfargument name="dnsWht" type="numeric" required="yes">
    <cfreturn variables.dns_arr[#ARGUMENTS.dnsWht#][1]>
  </cffunction>
  
</cfcomponent>  