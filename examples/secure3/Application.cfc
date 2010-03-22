<cfcomponent extends="org.corfield.framework">
	<cfset this.name = "fw1-examples">

	<cffunction name="setupSession" access="public" returntype="void" >
	    <cfparam name="session.isAuthenticated" default="false" />
	    <cfparam name="session.roles" default="public" />
	</cffunction>

	<cffunction name="hasAccess" access="public" returntype="void" >
		<cfargument name="inAction" default="" hint="By default we use the current action but you can pass this in to override it" />	
		<cfargument name="throwError" default="false" type="boolean" hint="If true then throw error else return boolean result"  />
		
		<cfset var thisAction = request.context['action'] />
		<cfset var hasAccess = true />
		
		<!--- Override looking at current action --->
		<cfif len(trim(arguments.inAction))><cfset thisAction = arguments.inAction /></cfif>
		
		<!--- For testing we are throwing an error for the "adminOnly" event --->
		<cfif thisAction EQ "main.adminOnly"><cfset var hasAccess = false /></cfif>
		
		<cfif NOT hasAccess AND arguments.throwError>
			<cfthrow message="ACCESS DENIED!" detail="You are not authorised to be here" /><cfabort>
		</cfif>
		
		<cfreturn hasAccess />
	</cffunction>

</cfcomponent>