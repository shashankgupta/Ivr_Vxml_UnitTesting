// Function to populate array object from data JSP's populated from backend request using <data> tag 
function getFunctionsData(dataObj, funcName)
{
  // Get list of all elements with tag var
  var dataObjChildNodeList = dataObj.documentElement.getElementsByTagName("script").item(0).getTextContent();

  var indx = dataObjChildNodeList.indexOf(funcName);
  var functionText = "";
  if(indx > 0) {
    functionText = dataObjChildNodeList.substr(indx);
    functionText = functionText.toString();
    var from = functionText.indexOf("{");
    var to = functionText.indexOf("}");
    from = from + 1;
    to = to - from;
    functionText = functionText.substr(from, to);
  }
  var functionObj = new Function(functionText);
  return functionObj();
}


// Function to populate object from data JSP's populated from backend request using <data> tag 
function getDataObj(dataObj) 
{
  // Object to be returned
  var returnDataObj = new Object();

  // Get list of all elements with tag var
  var dataObjChildNodeList = dataObj.documentElement.getElementsByTagName("var");

  // Loop to fill the object with all the variable values
  for (var i = 0; i < dataObjChildNodeList.length; i++) {
    // to extract value of variable name and value inside it
    var name1 = dataObjChildNodeList.item(i).getAttribute("name");
    var expr1 = dataObjChildNodeList.item(i).getAttribute("expr");

	// skipping the expressions which are ECMAScript method calls. For Example: method()
    if( !(!expr1.contains("'") && expr1.contains("(") )) {
      // To create dynamic variable populated inside object
      eval("returnDataObj." + name1 + " = " + expr1);
    }
  }
  return returnDataObj;
}


// Function that gives comparison for date2 - date1
function calculateDurationExtension(date1, date2)
{
    var date1Arr = date1.split("-");
    var date2Arr = date2.split("-");

    var year1 = date1Arr[0];
    var month1 = date1Arr[1];
    var day1 = date1Arr[2];

    var year2 = date2Arr[0];
    var month2 = date2Arr[1];
    var day2 = date2Arr[2];

    date1 = new Date(year1, month1-1, day1);
    date2 = new Date(year2, month2-1, day2);

    var durationExtensionMillis = date2 - date1;
    var milliSecondsInDay = 24*60*60*1000;

    var durationExtension = Math.floor(durationExtensionMillis / milliSecondsInDay);
    return durationExtension;
}


// Function to get Current Date
function getCurrentDate()
{
    var date = new Date();
    var day = date.getDate();
    var month = date.getMonth() + 1;
    var year = date.getFullYear();
    var dayStr = day.toString();
    var monthStr = month.toString();
    var yearStr = year.toString();

    if(dayStr.length < 2)
    {
        dayStr = "0" + dayStr;
    }
    if(monthStr.length < 2)
    {
        monthStr = "0" + monthStr;
    }
    for(var i = 4; i > yearStr.length; --i)
    {
        dayStr = "0" + dayStr;
    }

    var dateStr = yearStr + "-" + monthStr + "-" + dayStr;
    return dateStr;
}


// Function to search for Number in List
// number1:  argument to be searched
// list1:    list in which number searched
// sptr:     seperator to make a list
function searchInList(number1, list1, sptr)
{
    var string1 = number1.toString();
    var string2 = list1.toString();

    var arr = string2.split(sptr);
    for (var i = 0; i < arr.length; i++)
    {
      if(string1 == arr[i])
      {
        return "true"
      }
    }
    return "false";
}// Function to get Current Time
function getTimeStr()
{
	var now = new Date();
	var hour = getTwoDigitTime(now.getHours());
	var min = getTwoDigitTime(now.getMinutes());	
	var sec = getTwoDigitTime(now.getSeconds());    
	var timeStr = hour + ":" +min + ":" + sec; 	
	return timeStr;		
	
}

function getTwoDigitTime(number)
{
	if(number.valueOf() < 10)
	{
		number = "0"+number;		
	}
	return number;	
}

// endTime - startTime
function getDuration(startTime, endTime)
{
	var duration = 0;
	var startTimeInSec = 0;
	var endTimeInSec = 0;
	if(startTime != null && endTime != null)
	{
		startTimeInSec = getTimeInSec(startTime);
		endTimeInSec = getTimeInSec(endTime);
		duration = endTimeInSec - startTimeInSec;
		if(duration < 0)
		{
			var midStartTime = (24*60*60) - startTimeInSec;
			duration = endTimeInSec + midStartTime;
		}
	}	
	return duration;
}

function getTimeInSec(aTime)
{
	var timeInsec = 0;
	if(aTime != null)
	{
		var TimeArr = aTime.split(":");
		if(TimeArr.length >0)
		{
			var hour = TimeArr[0];
			var min = TimeArr[1];
			var sec  = TimeArr[2];
			timeInsec = (ConvertToNumber(hour) * 60 *60) + (ConvertToNumber(min)*60) + (ConvertToNumber(sec)*1);			
		}else
		{
			timeInsec = 0;
		}		
		
	}
	return timeInsec;	
}

function ConvertToNumber(numberStr)
{
	var num =0;
	num = numberStr.valueOf();
	return num;	
}

function concatCurrency(currency, amount)
{
     var retVal = "";
     retVal = currency + " " + amount;
     return retVal;
}

function numberOfDays(currDate, newDate)
{
    var myString = new String(currDate);
    var splitString = myString.split("-");

    var date1 =new Date();
    date1.setFullYear(splitString[0],splitString[1]-1,splitString[2]);

    myString = new String(newDate);
    splitString = myString.split("-");

    var date2 =new Date();
    date2.setFullYear(splitString[0],splitString[1]-1,splitString[2]);

    var one_day=1000*60*60*24;

    //Calculate difference btw the two dates, and convert to days
    var diff=date2.getTime()-date1.getTime();
    diff=diff/one_day;
    diff = Math.floor(diff);
    
    return diff;
}

function formatDays(numberOfDays)
{
    var numberOfDays = Math.abs(numberOfDays);
    var formattedDaysStr = new String(numberOfDays);
    formattedDaysStr = formattedDaysStr + ":00:00:00";
    return formattedDaysStr;

}

// FC 154
// This function is used to concat currency in the format "EUR+12" e.g, to be used in the EcmaScript call.
function concatCurrencyForEcmaCall(currency, amount)
{
     var retVal = "";
     retVal = currency+"+"+amount;
     return retVal;
}

// FC 154
// Function to create Vb Script URL.To be used in the EcmaScript call
function createVbScriptUrl(voiceBaseURL,lang,type,format,arg,speaker,gender,mode)
{
    var scriptUrl = voiceBaseURL + "?lang="+lang+"&type="+type+"&format="+format+"&arg="+arg+"&speaker="+speaker+"&gender="+gender+"&mode="+mode;
    return scriptUrl;
}


    <!--Turkcell StatLogger Start -->
	<!-- variables to store comma-separated values of Stat Types, Voucher Numbers and Status Codes -->

	var statisticsLogger_statType = 'NULL';

	var statisticsLogger_voucherNumber = 'NULL';

	var statisticsLogger_statusCode = 'NULL';

	<!-- getter methods -->

	function getStatType()
	{
		return statisticsLogger_statType;
	}

	function getVoucherNumber()
	{
		return statisticsLogger_voucherNumber;
	}

	function getStatusCode()
	{
		return statisticsLogger_statusCode;
	}

	<!-- setter methods -->

	function setStatType(statTypeValue)
	{
		if(statisticsLogger_statType == 'NULL')
		{
			statisticsLogger_statType = statTypeValue;
		}
		else
		{
			if(statTypeValue == '')
			{
				statTypeValue = ' ';
			}
			statisticsLogger_statType = statisticsLogger_statType + ',' + statTypeValue;
		}
	}

	function setVoucherNumber(voucherNumberValue)
	{
		if(statisticsLogger_voucherNumber == 'NULL')
		{
			statisticsLogger_voucherNumber = voucherNumberValue;
		}
		else
		{
			if(voucherNumberValue == '')
			{
				voucherNumberValue = ' ';
			}
			statisticsLogger_voucherNumber = statisticsLogger_voucherNumber + ',' + voucherNumberValue;
		}
	}

	function setStatusCode(statusCodeValue)

	{

		var statusCodeValue = ''+statusCodeValue;
		if(statisticsLogger_statusCode == 'NULL')
		{
			statisticsLogger_statusCode = statusCodeValue;
		}
		else
		{
			if(statusCodeValue == '')
			{
				statusCodeValue = ' ';
			}
			statisticsLogger_statusCode = statisticsLogger_statusCode + ',' + statusCodeValue;
		}
	}
<!--Turkcell StatLogger End -->

// function to return promtID of respective dtmfs.
	function findDtmfPrompt(number)
     {
        var string1 = number.toString();
        if(string1 == "1")
          return "GEN_DTMF_1_MSG";
        if(string1 == "2")
          return "GEN_DTMF_2_MSG";
        if(string1 == "3")
          return "GEN_DTMF_3_MSG";
        if(string1 == "4")
          return "GEN_DTMF_4_MSG";
        if(string1 == "5")
          return "GEN_DTMF_5_MSG";
        if(string1 == "6")
          return "GEN_DTMF_6_MSG";
        if(string1 == "7")
          return "GEN_DTMF_7_MSG";
        if(string1 == "8")
          return "GEN_DTMF_8_MSG";
        if(string1 == "9")
          return "GEN_DTMF_9_MSG";
        if(string1 == "0")
          return "GEN_DTMF_0_MSG";
        if(string1 == "*")
          return "GEN_DTMF_STAR_MSG";
        if(string1 == "#")
          return "GEN_DTMF_HASH_MSG";
      }
	<!-- Added for Telma V001 -->
	// Strips End and Cancel digit from the number 
   function stripEndCharacter(number1,endDTMF,canceldigit)
        {
          var newNumber ="";
          var string1 = number1.toString();
          newNumber = number1.toString();
          if( string1.charAt(string1.length - 1) == endDTMF || string1.charAt(string1.length - 1) == canceldigit ) {
            newNumber = string1.substr(0,string1.length -1);
          }
          return newNumber;
        }
     
     // returns true if cancel digit present in number else false
        function containCancelDigit(number1,canceldigit)
        {
          var string1 = number1.toString();
          var result = false;
          if( string1.charAt(string1.length - 1) == canceldigit ) {
            result = true;
          }         
          return result;
        }
     
     // Trim spaces from number
        function removeSpaces(number1)
        {
          var string1 = number1.toString();
          var string2 = "";
          var arr = string1.split(" ");
          for (var i = 0; i < arr.length ; i++ ) {
             string2= string2+arr[i];  
          }
          return string2;
        }



      

	// Functions to improve the Statistic Logging against the PMR493
	// Starts Here
      
	function statTypeForStatisticsLogging(statisticsLogger_statTypeString,statTypeValue)
	{
		if(statisticsLogger_statTypeString == 'NULL')
		{
			statisticsLogger_statTypeString = statTypeValue;
		}
		else
		{
			if(statTypeValue == '')
			{
				statTypeValue = ' ';
			}
			statisticsLogger_statTypeString = statisticsLogger_statTypeString + ',' + statTypeValue;
		}
		return statisticsLogger_statTypeString;
	}

	function voucherNumberForStatisticsLogging(statisticsLogger_voucherNumberString,voucherNumberValue)
	{
		if(statisticsLogger_voucherNumberString == 'NULL')
		{
			statisticsLogger_voucherNumberString = voucherNumberValue;
		}
		else
		{
			if(voucherNumberValue == '')
			{
				voucherNumberValue = ' ';
			}
			statisticsLogger_voucherNumberString = statisticsLogger_voucherNumberString + ',' + voucherNumberValue;
		}
		return statisticsLogger_voucherNumberString;
	}

	function statusCodeForStatisticsLogging(statisticsLogger_statusCodeString,statusCodeValue)
	{
		if(statisticsLogger_statusCodeString == 'NULL')
		{
			statisticsLogger_statusCodeString = statusCodeValue;
		}
		else
		{
			if(statusCodeValue == '')
			{
				statusCodeValue = ' ';
			}
			statisticsLogger_statusCodeString = statisticsLogger_statusCodeString + ',' + statusCodeValue;
		}
		return statisticsLogger_statusCodeString;
	}
	
	function compareVXMLIVRFormatDates(date1, date2)
      {
      		var dateSplitString1 = date1.split("-");
      		var dateSplitString2 = date2.split("-");
      		
      		var numToCompare1 = dateSplitString1[0] + dateSplitString1[1] + dateSplitString1[2];
      		var numToCompare2 = dateSplitString2[0] + dateSplitString2[1] + dateSplitString2[2];
      		
      		if(numToCompare1 < numToCompare2)
      		{
      			return -1;
      		}
      		else if(numToCompare1 > numToCompare2)
      		{
      			return 1;
      		}
      		
      		return 0;
      }

      function checkLoggingEnabled(moduleString, moduleName){
      moduleString = moduleString.toString();
      var result = "";
	if(moduleString.indexOf(moduleName) != -1)
	  result = "true";
	else
	  result = "false";

	  return result;
      }
	  
	  
function getSpecificDAValue(daId, dedicatedAccountList)   {
var array1 = dedicatedAccountList.split("#");
for (var i = 0; i < array1.length; i++) {
	var array2 = array1[i].split(",");
	if (array2[0] == daId) {
		if(array2[1] != "NULL") {
		  return array2[1];
		} else {
		  return "NULL";
		}
	  }
	  if (i == (array1.length -1)) {
		return "NULL";
	  }
	}
} 



 

function getSpecificACValue (acId, accumulatorsArray) {

	for (var i = 0; i < accumulatorsArray.length; i++) {
		var accumulatorId = accumulatorsArray[i].accumulatorId;
		if (acId == accumulatorId) {
			return accumulatorsArray[i].accumulatorUnitsAbs;
		}
	}
}




	
	//Ends Here

