<cfoutput>
	<h2>Welcome to the third security model</h2>
	
	<p>
		In the Application.cfc is a method called hasAccess(). For every event you simply add <i>&lt;cfset fw.hasAccess() /></i>
		to your controller events. Usage:
		<dd>
			<dt>&lt;cfset hasAccess = fw.hasAccess() /></dt>
			<dd>This will populate hasAccess variable with either true/false based on the current 'action' from the request context.</dd>
			<dt>&lt;cfset hasAccess = fw.hasAccess('main.adminOnly') /></dt>
			<dd>This will populate hasAccess variable with either true/false for the action 'main.adminOnly'.</dd>
			<dt>&lt;cfset fw.hasAccess(throwError=true) /></dt>
			<dd>Rather than returning true/false this will throw an exception</dd>						
		</dd>
	</p>
	
	
	<h2>In Application.cfc</h2>
	
	<code>
		&lt;cffunction name="<span class="highListAttribute">hasAccess</span>" access="public" returntype="void" ><br/>
			&lt;cfargument name="inAction" default="" hint="By default we use the current action but you can pass this in to override it" />	<br/>
			&lt;cfargument name="throwError" default="false" type="boolean" hint="If true then throw error else return boolean result"  /><br/>
<br/>
			&lt;cfset var thisAction = request.context['action'] /><br/>
			&lt;cfset var hasAccess = true /><br/>
<br/>
			&lt;!--- Override looking at current action ---><br/>
			&lt;cfif len(trim(arguments.inAction))>&lt;cfset thisAction = arguments.inAction />&lt;/cfif><br/>
<br/>
			&lt;!--- For testing we are throwing an error for the "adminOnly" event ---><br/>
			&lt;cfif thisAction EQ "main.adminOnly">&lt;cfset var hasAccess = false />&lt;/cfif><br/>
<br/>
			&lt;cfif NOT hasAccess AND arguments.throwError><br/>
				&lt;cfthrow message="ACCESS DENIED!" /><br/>
			&lt;/cfif><br/>
<br/>
			&lt;cfreturn hasAccess /><br/>
		&lt;/cffunction><br/>
	</code>
	
	<h2>In the controller.cfc</h2>
	<code>
		&lt;cffunction name="adminOnly" output="false" securityroles="admin"><br/>
			&lt;cfargument name="rc" />		<br/>
			&lt;cfset fw.hasAccess() /><br/>
		&lt;/cffunction>		<br/>
	</code>
	    	
	
</cfoutput>