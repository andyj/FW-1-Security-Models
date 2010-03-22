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
		<cfset fw.hasAccess(throwError=true) />
	</cffunction>


		
		
</cfcomponent>