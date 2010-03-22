<cfcomponent hint="Query of Query" output="false">

<cfset VARIABLES.listOfColumns = "" />
<cfset VARIABLES.listOfTypes   = "" />
<cfset VARIABLES.qryData       = QueryNew('') />

	<cffunction name="getData" access="public" output="false" returntype="query">
		<cfargument name="orderBy" type="string" required="false" default="" />

		<cfset var qryData = QueryNew('') />

		<cfquery name="qryData" dbtype="query">
			SELECT #VARIABLES.listOfColumns#
			FROM VARIABLES.qryData
			<cfif ARGUMENTS.orderBy NEQ "">ORDER BY #ARGUMENTS.orderBy#</cfif>
		</cfquery>
		<cfreturn VARIABLES.qryData />
	</cffunction>

	<cffunction name="getByID" access="public" output="false" returntype="query">
		<cfargument name="id"  type="numeric" required="true" />

		<cfset var qryData = QueryNew('') />

		<cfquery name="qryData" dbtype="query">
			SELECT #VARIABLES.listOfColumns#
			FROM VARIABLES.qryData
			WHERE ID = <cfqueryparam cfsqltype="cf_sql_bigint" value="#ARGUMENTS.id#" />
		</cfquery>

		<cfreturn qryData />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="void">
		<cfargument name="id"  type="numeric" required="true" />

		<cfquery name="VARIABLES.qryData" dbtype="query">
			SELECT #VARIABLES.listOfColumns#
			FROM VARIABLES.qryData
			WHERE id != <cfqueryparam cfsqltype="cf_sql_bigint" value="#ARGUMENTS.id#" />
		</cfquery>
<!--- 		<cf_qoq>
			DELETE FROM qryData
			WHERE ID = '#ARGUMENTS.id#'
		</cf_qoq> --->
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="void">

		<cfset var field       = '' />
		<cfset var fieldValues = '' />
		<cfset var qryMaxItems = QueryNew('id', 'integer') />
		<cfset var pk          = 0 />

		<cfif ARGUMENTS.id EQ 0>
			<cfquery name="qryMaxItems" dbtype="query">
				SELECT MAX(id) as id
				FROM VARIABLES.qryData
			</cfquery>
			<cfset pk           = qryMaxItems.id />
			<cfset ARGUMENTS.id = pk + 1 />
		<cfelse>
			<cfset pk = ARGUMENTS.id />
		</cfif>
		<cfquery name="VARIABLES.qryData" dbtype="query">
			SELECT #VARIABLES.listOfColumns#
			FROM VARIABLES.qryData
			WHERE id != <cfqueryparam cfsqltype="CF_sql_integer" value="#ARGUMENTS.id#" />
			UNION
			SELECT
			<cfloop from="1" to="#ListLen(VARIABLES.listOfColumns)#" index="field">
			<cfqueryparam cfsqltype="CF_sql_#ListGetAt(VARIABLES.listOfTypes, field)#" value="#ARGUMENTS[ListGetAt(VARIABLES.listOfColumns, field)]#" /> as #ListGetAt(VARIABLES.listOfColumns, field)#
			<cfif field NEQ ListLen(VARIABLES.listOfColumns)>,</cfif>
			</cfloop>
			FROM VARIABLES.qryData
			WHERE id = <cfqueryparam cfsqltype="cf_sql_bigint" value="#pk#" />
		</cfquery>
	</cffunction>

<cffunction name="querySim" access="public" output="false" returntype="void">
	<cfargument name="queryData"  type="string" required="true"  />
		<cfscript>
			/**
			* http://www.cflib.org/index.cfm?event=page.udfbyid&udfid=255
			* Accepts a specifically formatted chunk of text, and returns it as a query object.
			* v2 rewrite by Jamie Jackson
			*
			* @param queryData      Specifically format chunk of text to convert to a query. (Required)
			* @return Returns a query object.
			* @author Bert Dawson (bert@redbanner.com)
			* @version 2, December 18, 2007
			*/
			 //function querySim(queryData) {
			    var fieldsDelimiter="|";
			    var colnamesDelimiter=",";
			    var listOfColumns="";
			    var listOfTypes="";
			    var tmpQuery="";
			    var numLines="";
			    var cellValue="";
			    var cellValues="";
			    var colName="";
			    var lineDelimiter=chr(10) & chr(13);
			    var lineNum=0;
			    var colPosition=0;

			    // the first line is the column list, eg "column1,column2,column3"
			    VARIABLES.listOfColumns = Trim(ListGetAt(queryData, 1, lineDelimiter));
				VARIABLES.listOfTypes   = Trim(ListGetAt(queryData, 2, lineDelimiter));

			    // create a temporary Query
			    tmpQuery = QueryNew(VARIABLES.listOfColumns,VARIABLES.listOfTypes);
			    // the number of lines in the queryData
			    numLines = ListLen(queryData, lineDelimiter);

			    // loop though the queryData starting at the second line
			    for(lineNum=3; lineNum LTE numLines; lineNum = lineNum + 1) {
			     cellValues = ListGetAt(queryData, lineNum, lineDelimiter);

			        if (ListLen(cellValues, fieldsDelimiter) IS ListLen(VARIABLES.listOfColumns,",")) {
			            QueryAddRow(tmpQuery);
			            for (colPosition=1; colPosition LTE ListLen(VARIABLES.listOfColumns); colPosition = colPosition + 1){
			                cellValue = Trim(ListGetAt(cellValues, colPosition, fieldsDelimiter));

			                if (cellValue EQ 'NULL')
			                	cellValue = '';

			                colName = Trim(ListGetAt(VARIABLES.listOfColumns,colPosition));
			                QuerySetCell(tmpQuery, colName, cellValue);
			            }
			        }
			    }

			    VARIABLES.qryData = tmpQuery ;

			//}
		</cfscript>
	</cffunction>
</cfcomponent>