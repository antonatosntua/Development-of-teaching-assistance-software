function EAData (){
		this.isValidDate=isValidDate;
		this.isBetween=isBetween;
        this.isEarlier=rootEarlyLater;
        this.isLater=rootEarlyLater;
		this.isEqualDate=isEqualDate;
}



//check the validation for date string
function isValidDate(dateForCheck)
{	

var thesi=-1;
var thesiSlash=0;
var dayCheck=0;
var monthCheck=0;
var yearCheck=0;
var day2=0;
var month2=0;
var year2=0;
var DateFormat =/^[0-9]{1,2}[\/-]{1}[0-9]{1,2}[\/-]{1}[0-9]{4}$/;
if(!DateFormat.test(dateForCheck))
return false;
thesiSlash=dateForCheck.indexOf('/',thesi+1);
dayCheck=dateForCheck.substring(thesi+1,thesiSlash);

thesi=thesiSlash;
thesiSlash=dateForCheck.indexOf('/',thesi+1);
monthCheck=dateForCheck.substring(thesi+1,thesiSlash);

thesi=thesiSlash;

thesiSlash=dateForCheck.indexOf('/',thesi+1);
yearCheck=dateForCheck.substring(thesi+1,dateForCheck.value);

var dateIn= new Date();
dateIn.setFullYear(yearCheck,monthCheck,dayCheck);
dateIn.setMonth(dateIn.getMonth()-1);
if(dateIn.getMonth()+1!=monthCheck){
  return false; 
  }
else
return true;

}


//check the comparison for two date strings
function rootEarlyLater(fromDate,toDate)
{

var thesi=-1;
var thesiSlash=0;
var day1=0;
var month1=0;
var year1=0;
var day2=0;
var month2=0;
var year2=0;


		thesiSlash=fromDate.indexOf('/',thesi+1);
		day1=fromDate.substring(thesi+1,thesiSlash)
		if(thesiSlash-thesi<3){
		day1="0"+day1;
		}
	thesi=thesiSlash;
	thesiSlash=fromDate.indexOf('/',thesi+1);
	month1=fromDate.substring(thesi+1,thesiSlash)
	if(thesiSlash-thesi<3){
		month1="0"+month1;
		}
	thesi=thesiSlash;
	thesiSlash=fromDate.indexOf('/',thesi+1);
	year1=fromDate.substring(thesi+1,fromDate.value)
	var fromDateNum=year1+""+month1+""+day1;
	//   	   alert("a"+d1);
	
	var thesi=-1;
var thesiSlash=0;
	
	
			thesiSlash=toDate.indexOf('/',thesi+1);
		day2=toDate.substring(thesi+1,thesiSlash)
		if(thesiSlash-thesi<3){
		day2="0"+day2;
		}
	thesi=thesiSlash;
	thesiSlash=toDate.indexOf('/',thesi+1);
	month2=toDate.substring(thesi+1,thesiSlash)
	if(thesiSlash-thesi<3){
		month2="0"+month2;
		}
	thesi=thesiSlash;
	thesiSlash=toDate.indexOf('/',thesi+1);
	year2=toDate.substring(thesi+1,toDate.value)
	var toDateNum=year2+""+month2+""+day2;
   if(fromDateNum<toDateNum)
    return true ;
   else
	 return false;
}

//check the comparison for  date string between two date strings
function isBetween(fromDate,thisDate,toDate){

	if(EAData.isEarlier(thisDate,toDate) && EAData.isLater(fromDate,thisDate))
   		{return true;}
	else
 		return false;
}

//check two date strings for equal 

function isEqualDate(Date1,Date2){

	if(!EAData.isEarlier(Date1,Date2) && !EAData.isLater(Date2,Date1))
   		{return true;}
	else
 		return false;
}

 