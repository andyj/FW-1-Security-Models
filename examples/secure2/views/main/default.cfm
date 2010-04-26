<cfoutput>
	<h2>Welcome to the second security model</h2>
	
	<p>This works by using a "white list" of events that are documented in the method within /controllers/security.cfc</p>
	<p>
		The method checkAuthorisation() is then called on every event call and if the page isn't in the white list then
		the user is redirected to "users.login" (or any event in the white list)
	</p>
	
	<p>
		This example is only good for a sites with minimal logins and only one role type.
	
	</p>
	    	
	
</cfoutput>