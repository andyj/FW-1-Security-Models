<cfcomponent extends="org.corfield.framework"><cfscript>
	// Either put the org folder in your webroot or create a mapping for it!
	
	this.name = 'fw1-examplesv001';
	this.sessionManagement = true;
	// FW/1 - configuration:
	variables.framework = structNew();
	variables.framework.usingSubsystems = true;
	
	function setupApplication() 
	{
		setBeanFactory(createObject("component", "models.ObjectFactory").init(expandPath("./assets/config/beans.xml.cfm")));	
	}	
	
</cfscript></cfcomponent>