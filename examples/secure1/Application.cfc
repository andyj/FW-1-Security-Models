<cfcomponent extends="org.corfield.framework">
	<cfset this.name = "fw1-secure1">
	<cfset this.sessionManagement = true />
	
	<cffunction name="setupSession" access="public" returntype="void" >
	    <cfparam name="session.isAuthenticated" default="false" />
	    <cfparam name="session.roles" default="public" />
	</cffunction>

	<cffunction name="setupRequest" access="public" returntype="void" output="false">
	    <cfset var stAction = GetMetaData(application[variables.framework.applicationKey].cache.controllers[getSection()][getItem()]) />	
	    <cfset var isAuthorised = false />
	
		<cfparam name="request.context.message" default="" />		
		<!--- The default role for all events is public --->
		<cfparam name="stAction.securityroles" default="public" />
		
		<!--- We only run role check for NON public pages --->
		<cfif stAction.securityroles NEQ "public">
			<!--- Check the roles --->
		    <cfloop list="#stAction.securityroles#" index="role">
		        <cfif ListFindNoCase(session.roles, role) NEQ 0>
		            <cfset isAuthorised = true />
		            <cfbreak />
		        </cfif>
		    </cfloop>

			<!--- If not authorised throw them to the applications home page --->
		    <cfif NOT isAuthorised>
				
		        <cfset request.context['message'] = "Unauthorised" />
		        <cfset redirect(action=variables.framework.home,preserve='message') />
		    </cfif>
	
		</cfif>

	</cffunction>


</cfcomponent>