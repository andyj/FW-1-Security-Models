<cfcomponent output="false" extends="controllers.Base">

	<cffunction name="init" access="public" output="false" returntype="any">
		<cfargument name="fw">
		<cfset variables.fw = arguments.fw>
		<cfreturn this>
	</cffunction>


	<cffunction name="checkAuthorisation" access="public" output="false" returntype="any">
		<cfargument name="rc">
		<cfset var actionWhiteList = [
			"main.default"
		] />

	    <cfset var isAuthorised = false />
	
		<cfparam name="request.context.message" default="" />		

		<cfif NOT arrayFind(actionWhiteList, rc.action) AND session.user.isloggedin EQ false>
			<cfset rc.loggedin = 0 />
			<cfset variables.fw.redirect( 'gpr.welcome' , false , 'loggedin' ) />
		</cfif>



		<cfreturn this>
	</cffunction>

</cfcomponent>