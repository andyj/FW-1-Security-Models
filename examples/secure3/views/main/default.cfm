<cfoutput>
	<h2>Welcome to the first security model</h2>
	
	<p>In the controller &amp; for each function you want to secure add a 'securityroles' attributed</p>
	
	<code>
		&lt;cffunction name="edit" access="public" output="false" returntype="void" securityroles="<span class="highListAttribute">admin,it,marketing</span>"><br/>
		<br/>
		&lt;/cffunction><br/>
	</code>
	
	
	    	
	
</cfoutput>