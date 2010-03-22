<cfsetting enablecfoutputonly="true" />
<cfoutput>
<html>
	<head>
		<title>FW/1 - Framework One</title>
		<base href="<cfoutput>#getDirectoryFromPath( CGI.SCRIPT_NAME )#</cfoutput>" />
		<link rel="stylesheet" type="text/css" href="../../css/fw1.css" />
	</head>
	<body>
		<div class="wrap">
			<!--- Top Navigation --->
			<h1>Security Model</h1>
			
			<div class="topNav">
				<a href="../../">&lt;&lt; Back to examples</a> /
				<a href="#buildUrl(variables.framework.home)#">Home</a> /			
				<a href="#buildUrl('main.adminOnly')#">Admin Only</a>			 				
			</div>
				
			
			<!--- Body --->
			#body#
			
		</div>
	</body>
</html>
</cfoutput>
<cfsetting enablecfoutputonly="false" showdebugoutput="false" />

