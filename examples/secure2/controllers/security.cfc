<cfcomponent output="false" >

	<cffunction name="init" access="public" output="false" returntype="any">
		<cfargument name="fw">
		<cfset variables.fw = arguments.fw>
		<cfreturn this>
	</cffunction>


	<cffunction name="checkAuthorisation" access="public" output="false" returntype="any">
		<cfargument name="rc">
		<cfset var actionWhiteList = [
			"main.default",
			"users.login"
		] />

	    <cfset var isAuthorised = false />
	
		<cfparam name="request.context.message" default="" />		
		<cfparam name="session.user.isloggedin" default="false" />


		<cfif NOT arrayFind(actionWhiteList, rc.action) AND NOT session.user.isloggedin>
			<cfset rc.loggedin = 0 />
			<cfset variables.fw.redirect( 'users.login') />
		</cfif>
		

		<cfreturn this>
	</cffunction>

</cfcomponent>