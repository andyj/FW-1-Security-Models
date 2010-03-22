<cfcomponent>



		<cfscript>
			/**
			* Accepts a specifically formatted chunk of text, and returns it as a query object.
			* v2 rewrite by Jamie Jackson
			*
			* @param queryData      Specifically format chunk of text to convert to a query. (Required)
			* @return Returns a query object.
			* @author Bert Dawson (bert@redbanner.com)
			* @version 2, December 18, 2007
			*/
			function querySim(queryData) {
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
			    listOfColumns = Trim(ListGetAt(queryData, 1, lineDelimiter));
				listOfTypes   = Trim(ListGetAt(queryData, 2, lineDelimiter));

			    // create a temporary Query
			    tmpQuery = QueryNew(listOfColumns,listOfTypes);
			    // the number of lines in the queryData
			    numLines = ListLen(queryData, lineDelimiter);

			    // loop though the queryData starting at the second line
			    for(lineNum=3; lineNum LTE numLines; lineNum = lineNum + 1) {
			     cellValues = ListGetAt(queryData, lineNum, lineDelimiter);

			        if (ListLen(cellValues, fieldsDelimiter) IS ListLen(listOfColumns,",")) {
			            QueryAddRow(tmpQuery);
			            for (colPosition=1; colPosition LTE ListLen(listOfColumns); colPosition = colPosition + 1){
			                cellValue = Trim(ListGetAt(cellValues, colPosition, fieldsDelimiter));
			                colName = Trim(ListGetAt(listOfColumns,colPosition));
			                QuerySetCell(tmpQuery, colName, cellValue);
			            }
			        }
			    }

			    return( tmpQuery );

			}
		</cfscript>

</cfcomponent>