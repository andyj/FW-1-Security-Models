<h2>Examples</h2>
<ul>
	<cfoutput query="rc.files">
		<!--- updated to omit common/home which are part of the subsystems demo --->
		<cfif rc.files.type is 'dir' and left(rc.files.name,1) is not '.' and
				rc.files.name is not 'common' and rc.files.name is not 'home'>
			<li><a href="examples/#rc.files.name#/">#rc.files.name#</a></li>
		</cfif>
	</cfoutput>
</ul>