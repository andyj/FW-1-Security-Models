<cfcomponent extends="mockDAO" output="false">
	<cffunction name="init" access="public" output="false" returntype="any">

		<cfscript>
			var fieldNames = 'id,category';
			var fieldTypes = 'bigint,varchar';

			querySim('
			#fieldNames#
			#fieldTypes#
			1  | Computer
			2  | Office Equipment
			3  | Printer
			4  | Notebook
			');
		</cfscript>

		<cfreturn this />
	</cffunction>

<!--- inherited --->
	<cffunction name="getData" access="public" output="false" returntype="query">
		<cfargument name="orderBy" type="string" required="false" default="category" />

		<cfreturn super.getData(ARGUMENTS.orderBy) />
	</cffunction>

	<cffunction name="getByID" access="public" output="false" returntype="query">
		<cfargument name="id"  type="numeric" required="true" />

		<cfreturn super.getByID(ARGUMENTS.id) />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="void">
		<cfargument name="id"  type="numeric" required="true" />

		<cfreturn super.delete(ARGUMENTS.id) />
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="void">
		<cfreturn super.save(ARGUMENTCOLLECTION=ARGUMENTS) />
	</cffunction>

<!--- // inherited --->
		
</cfcomponent>