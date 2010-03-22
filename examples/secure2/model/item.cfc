<cfcomponent extends="mockDAO" output="false">
	<cffunction name="init" access="public" output="false" returntype="any">

		<cfscript>
			var fieldNames = 'id,owner,category,description,detail,photo,createDate,endDate,price,assetNo,model,serialNo';
			var fieldTypes = 'bigint,varchar,varchar,varchar,varchar,varchar,TIMESTAMP,TIMESTAMP,Double,varchar,varchar,varchar';

			querySim('
			#fieldNames#
			#fieldTypes#
			1  | IT Dept       | Computer         | Computer                       | <ul><li>PC - impressive specs (not)</li><li>17" LCD monitor</li><li>USB keybord &amp; mouse</li><li>Windows XP</li></ul> | no-photo.jpg | #DateAdd('d',-3, Now())#  | #DateAdd('h',2, Now())#   | 110.00 | PSL00001 | TFN17 | TFN17-XXX-XXX-XXX-XXX
			2  | IT Dept       | Computer         | This is another iterm for sale | some really interesting information                                                                                      | no-photo.jpg | #DateAdd('d',-3, Now())#  | #DateAdd('d',20, Now())#  | 140.60 | PSL00002 | ANCDE | xxx
			3  | Andrew Mercer | Computer         | Item description goes here     | short blurb here                                                                                                         | no-photo.jpg | #DateAdd('d',-7, Now())#  | #DateAdd('d',44, Now())#  | 150.40 | NULL     | NULL  | NULL
			4  | IT Dept       | Computer         | Computer                       | <ul><li>PC - impressive specs (not)</li><li>17" LCD monitor</li><li>USB keybord &amp; mouse</li><li>Windows XP</li></ul> | no-photo.jpg | #DateAdd('d',-3, Now())#  | #DateAdd('d',56, Now())#  | 99.20  | NULL     | NULL  | NULL
			5  | IT Dept       | Computer         | This is another iterm for sale | some really interesting information                                                                                      | no-photo.jpg | #DateAdd('h',-75, Now())# | #DateAdd('s',234, Now())# | 87.60  | NULL     | NULL  | NULL
			6  | IT Dept       | Computer         | Item description goes here     | short blurb here                                                                                                         | no-photo.jpg | #DateAdd('d',-3, Now())#  | #DateAdd('d',76, Now())#  | 72.50  | NULL     | NULL  | NULL
			7  | Andrew Mercer | Office Equipment | Computer Desk                  | you put you computer on it                                                                                               | no-photo.jpg | #DateAdd('d',-1, Now())#  | #DateAdd('d',5, Now())#   | 56.20  | NULL     | NULL  | NULL
			8  | IT Dept       | Computer         | This is anotheitemrm for sale  | some really interesting information                                                                                      | no-photo.jpg | #DateAdd('d',-13, Now())# | #DateAdd('d',17, Now())#  | 990.00 | NULL     | NULL  | NULL
			9  | IT Dept       | Computer         | Item description goes here     | short blurb here                                                                                                         | no-photo.jpg | #DateAdd('d',-7, Now())#  | #DateAdd('h',35, Now())#  | 66.60  | NULL     | NULL  | NULL
			10 | IT Dept       | Computer         | Computer                       | <ul><li>PC - impressive specs (not)</li><li>17" LCD monitor</li><li>USB keybord &amp; mouse</li><li>Windows XP</li></ul> | no-photo.jpg | #DateAdd('d',-17, Now())# | #DateAdd('d',9, Now())#   | 75.00  | NULL     | NULL  | NULL
			11 | IT Dept       | Computer         | This is anotheitemrm for sale  | some really interesting information                                                                                      | no-photo.jpg | #DateAdd('d',-5, Now())#  | #DateAdd('d',12, Now())#  | 10.00  | NULL     | NULL  | NULL
			12 | IT Dept       | Office Equipment | Rack                           | Dell Server rack                                                                                                         | no-photo.jpg | #DateAdd('d',-4, Now())#  | #DateAdd('d',3, Now())#   | 170.80 | NULL     | NULL  | NULL
			');
		</cfscript>

		<cfreturn this />
	</cffunction>

<!--- inherited --->
	<cffunction name="getData" access="public" output="false" returntype="query">
		<cfargument name="orderBy" type="string" required="false" default="" />

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
	<cffunction name="getByOwner" access="public" output="false" returntype="query">
		<cfargument name="value"   type="string" required="true"  />
		<cfargument name="orderBy" type="string" required="false" default="" />

		<cfset var qryData = QueryNew('') />

		<cfquery name="qryData" dbtype="query">
			SELECT #VARIABLES.listOfColumns#
			FROM VARIABLES.qryData
			WHERE owner = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#ARGUMENTS.value#"  />
			<cfif ARGUMENTS.orderBy NEQ "">ORDER BY #ARGUMENTS.orderBy#</cfif>
		</cfquery>

		<cfreturn qryData />
	</cffunction>

	<cffunction name="getByCategory" access="public" output="false" returntype="query">
		<cfargument name="value"   type="string" required="true"  />
		<cfargument name="orderBy" type="string" required="false" default="" />

		<cfset var qryData = QueryNew('') />

		<cfquery name="qryData" dbtype="query">
			SELECT #VARIABLES.listOfColumns#
			FROM VARIABLES.qryData
			WHERE category = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#ARGUMENTS.value#"  />
			<cfif ARGUMENTS.orderBy NEQ "">ORDER BY #ARGUMENTS.orderBy#</cfif>
		</cfquery>

		<cfreturn qryData />
	</cffunction>

	<cffunction name="getNew" access="public" output="false" returntype="query">
		<cfargument name="value"   type="date" required="true"  />
		<cfargument name="orderBy" type="string" required="false" default="" />

		<cfset var qryData = QueryNew('') />

		<cfquery name="qryData" dbtype="query">
			SELECT #VARIABLES.listOfColumns#
			FROM VARIABLES.qryData
			WHERE createDate >= <cfqueryparam cfsqltype="CF_SQL_timestamp" value="#ARGUMENTS.value#"  />
			<cfif ARGUMENTS.orderBy NEQ "">ORDER BY #ARGUMENTS.orderBy#</cfif>
		</cfquery>

		<cfreturn qryData />
	</cffunction>

</cfcomponent>