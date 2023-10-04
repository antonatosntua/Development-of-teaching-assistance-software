function valOfDate()
{
	this.checkDate=checkDate;

}
var valOfDate = new valOfDate();
//--------------------

function checkDate(date_test)
{	
		  var check_the_date =/^[0-9]{1,2}[\/-]{1}[0-9]{1,2}[\/-]{1}[0-9]{1}[0-9]{3,3}$/;
			if(!check_the_date.test(date_test))
			{
    			return false;
			}
			if(check_the_date.test(date_test))
			{
    			return true;
			}

}
