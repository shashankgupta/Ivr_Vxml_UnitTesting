function factorial(n) 
	{ 
		return (n <= 1) ? 1 : n * factorial (n - 1);
	}
	
	
	
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