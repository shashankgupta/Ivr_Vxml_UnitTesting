 

function totalDAABalance(daInfoStr)
{
   var totalAmount = 0;
    var array1 = daInfoStr.split("#");

    for(var i = 0; i < array1.length; i++) {
	  var strToken = array1[i].split(",");
  	  var amountRelative = strToken[1];
      totalAmount = addNumericalStrings(amountRelative, totalAmount);
    }

    var value = parseFloat(totalAmount);
    return value;
}



    function getDABalance_Curr1(daId, dedicatedAccountList)
    {
      var arr = dedicatedAccountList.split("#");
      for (var i = 0; i < arr.length ; i++ ) {
        var arr2 = arr[i].split(",");
        if (arr2[0] == daId) {
          if(arr2[1] != "NULL") {
            return arr2[1];
          } else {
            return "NULL";
          }
        }
        if (i == (arr.length -1)) {
          return "NULL";
        }
      }
    }


    function getDABalance_Curr2(daId, dedicatedAccountList)
    {
      var arr = dedicatedAccountList.split("#");
      for (var i = 0; i < arr.length ; i++ ) {
        var arr2 = arr[i].split(",");
        if (arr2[0] == daId) {
          if(arr2[1] != "NULL") {
            return arr2[3];
          } else {
            return "NULL";
          }
        }
        if (i == (arr.length -1)) {
          return "NULL";
        }
      }
    }


    function removeLeadingZeros(str1)
    {
      var i = 0;
      var strLength = str1.length;
      var newstr = "";

      if(str1.charAt(0) == '-') {
        newstr = "-";
        i=1;
      }

      for (; i < strLength; i++) {
        if (str1.charAt(i) != '0') {
          newstr = newstr.concat(str1.substr(i, strLength));
          return newstr;
        }
      }
      return str1;
    }


    function addNumericalStrings(value1, value2)
    {
      var resultIntValue = 0;

      var valueStr1 = value1.toString();
      var valueStr2 = value2.toString();

      valueStr1 = removeSpaces(valueStr1);
      valueStr2 = removeSpaces(valueStr2);

      var decIndex = valueStr1.indexOf(".");
      var decimalPtPosition = (valueStr1.length - 1) - decIndex;

      valueStr1 = valueStr1.replace(".","");
      valueStr2 = valueStr2.replace(".","");

      valueStr1 = removeLeadingZeros(valueStr1);
      valueStr2 = removeLeadingZeros(valueStr2);

      var intVal1 = parseInt(valueStr1);
      var intVal2 = parseInt(valueStr2);

      resultIntValue = intVal1 + intVal2;

      var resultStrValue = resultIntValue.toString();
      var resultStrLength = resultStrValue.length;

      resultStrValue = insertDecimal(resultStrValue, ".", decimalPtPosition);
      return resultStrValue;
    }


    function removeSpaces(valueStr)
    {
      var resultStr = valueStr.toString();
      resultStr = resultStr.replace(" ","");
      return resultStr;
    }


    function insertDecimal(str, insertChar, index) {
      var localStr = str.toString();
      var strLength = localStr.length;
      var diff = strLength - index;

      while (diff <= 0) {
        localStr = "0".concat(localStr);
        ++diff;
      }
      strLength = localStr.length;

      var temp = localStr.substr(0, strLength - index);
      temp = temp.concat(insertChar);
      temp = temp.concat(localStr.substring(strLength - index, strLength));
      return temp;
    }

   function convertStringToInteger(inputString)
    {
	var value = parseInt(inputString);
	return value;
    }

   function convertStringToFloat(inputString)
    {
	var value = parseFloat(inputString);
	return value;
    }
	
	
	//function added for Us 1339 WATA 015
	function getRefDABalanceAmount(daInfoStr, configuredDAref,currency)
    {
	var valueReturned=new Object();
	if(daInfoStr!= null)
	{
		var array1 = daInfoStr.split("#");
		for(var i = 0; i < array1.length; i++) 
		{
		  var strToken = array1[i].split(",");
		  var dARefId = strToken[0];
		  if(dARefId==configuredDAref)
		  {
		  	valueReturned.dedicatedAccountUnit=strToken[35];
		  	if(currency=="currency1")
				valueReturned.balanceAmount=strToken[1];
			else
				valueReturned.balanceAmount=strToken[4];
		  }
		}
	}
		return valueReturned;
    }
    
	
	
  

