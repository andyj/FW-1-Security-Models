<cfcomponent extends="org.corfield.framework"><cfscript>
	// Either put the org folder in your webroot or create a mapping for it!
	
	this.name = 'fw1-security';
	// FW/1 - configuration:
	variables.framework = structNew();
	// controllers/layouts/services/views are in this folder:
	variables.framework.base = getDirectoryFromPath( CGI.SCRIPT_NAME ) & 'introduction';
	
	// If your CFML engine supports it, you can create the framework struct like this:
	// variables.framework = {
	// 		base = getDirectoryFromPath( CGI.SCRIPT_NAME ) & 'introduction'
	// }

</cfscript></cfcomponent>