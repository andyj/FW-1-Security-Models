<cfcomponent output="false">
	
	<cffunction name="init" access="public" output="false" returntype="any">
		<cfargument name="fw">
		<cfset variables.fw = arguments.fw>
		<cfreturn this>
	</cffunction>	
	
	<cffunction name="default" output="false">
		<cfargument name="rc" />
	</cffunction>


	<cffunction name="adminOnly" output="false" securityroles="admin">
		<cfargument name="rc" />		
	</cffunction>


	<cffunction name="adminItOnly" output="false" securityroles="admin,it">
		<cfargument name="rc" />
	</cffunction>
	
	
	<cffunction name="changeUserRole" output="false">
		<cfargument name="rc" />
		<cfparam name="rc.userRole" default="public" />	
		
	    <cfset session.roles = rc.UserRole />	
		<cfset variables.fw.redirect('main.default') />
		
	</cffunction>
		
		
		
</cfcomponent>