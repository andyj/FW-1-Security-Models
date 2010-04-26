<cfcomponent extends="org.corfield.framework"><cfscript>

	this.name = 'fw1-secure2';
	this.sessionManagement = true;

	function onSessionStart(){
	    session.isAuthenticated = "false";
	    session.roles = "public";
	}

	function setupRequest() {
		// security controller
		var security = getController('security');

		doController(security,'checkAuthorisation');

	}
</cfscript></cfcomponent>