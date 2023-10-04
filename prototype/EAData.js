// JavaScript Document
function EAData (){
	this.isMinLength = isMinLength;
	this.isMaxLength = isMaxLength;
	this.isValidLength = isValidLength;
	this.isAlphanumeric = isAlphanumeric;
	this.isGRAlphanumeric = isGRAlphanumeric;
	this.isLatinAlphanumeric = isLatinAlphanumeric;
	this.isAlphabetic = isAlphabetic;
	this.isGRAlphabetic = isGRAlphabetic;
	this.isLatinAlphabetic = isLatinAlphabetic;
	this.isNumeric = isNumeric;
	this.removeBadCharacters = removeBadCharacters;
	this.removeThisCharacter = removeThisCharacter;
	this.removeSpaces = removeSpaces;
	this.trimWhitespace = trimWhitespace;
	this.removeGRStressMarks = removeGRStressMarks;
	this.toGRUpperCase = toGRUpperCase;
	this.toGRLowerCase = toGRLowerCase;
	this.isEmpty = isEmpty;
		this.isValidDate=isValidDate;
		this.isBetween=isBetween;
        this.isEarlier=rootEarlyLater;
        this.isLater=rootEarlyLater;
		this.isEqualDate=isEqualDate;
		



}

var EAData = new EAData();


// Check that a string has a minimum length
function isMinLength(data, min){
	if (data.length < min)
		return false;
	else
		return true;
}

// Check that a string has a maximum length
function isMaxLength(data, max){
	if (data.length > max)
		return false;
	else
		return true;
}

// Check that a string has a specific length, between 'min' and 'max'
function isValidLength(data, min, max){
	if (data.length < min || data.length > max)
		return false;
	else
		return true;
}

// Check that a string contains only letters (greek - latin) and numbers
function isAlphanumeric(data, ignoreWhiteSpace) {
   if (data.search) {   
   	  if ((ignoreWhiteSpace && data.search(/[^α-ωΑ-ΩάέήίόύώΆΈΉΊΌΎ\w\s]/) != -1) || (!ignoreWhiteSpace && data.search(/[^α-ωΑ-ΩάέήίόύώΆΈΉΊΌΎ\w]/) != -1)) 
	  	return false;
   }
   return true;
}

// Check that a string contains only greek letters and numbers
function isGRAlphanumeric(data, ignoreWhiteSpace) {
   if (data.search) {
   	  if ((ignoreWhiteSpace && data.search(/[^α-ωΑ-ΩάέήίόύώΆΈΉΊΌΎ\d\s]/) != -1) || (!ignoreWhiteSpace && data.search(/[^α-ωΑ-ΩάέήίόύώΆΈΉΊΌΎ\d]/) != -1)) 
	  	return false;
   }
   return true;
}

// Check that a string contains only latin letters and numbers
function isLatinAlphanumeric(data, ignoreWhiteSpace) {
   if (data.search) {
   	  if ((ignoreWhiteSpace && data.search(/[^\w\s]/) != -1) || (!ignoreWhiteSpace && data.search(/\W/) != -1)) 
	  	return false;
   }
   return true;
}

// Check that a string contains only letters (greek - latin)
function isAlphabetic(data, ignoreWhiteSpace) {
   if (data.search) {
	  if ((ignoreWhiteSpace && data.search(/[^α-ωΑ-ΩάέήίόύώΆΈΉΊΌΎa-zA-Z\s]/) != -1) || (!ignoreWhiteSpace && data.search(/[^α-ωΑ-ΩάέήίόύώΆΈΉΊΌΎa-zA-Z]/) != -1)) 
	  	return false;
   }
   return true;
}

// Check that a string contains only greek letters
function isGRAlphabetic(data, ignoreWhiteSpace) {
   if (data.search) {
   	  if ((ignoreWhiteSpace && data.search(/[^α-ωΑ-ΩάέήίόύώΆΈΉΊΌΎ\s]/) != -1) || (!ignoreWhiteSpace && data.search(/[^α-ωΑ-ΩάέήίόύώΆΈΉΊΌΎ]/) != -1)) 
	  	return false;
   }
   return true;
}

// Check that a string contains only latin letters
function isLatinAlphabetic(data, ignoreWhiteSpace) {
   if (data.search) {
   		if ((ignoreWhiteSpace && data.search(/[^A-Za-z\s]/) != -1) || (!ignoreWhiteSpace && data.search(/[^A-Za-z]/) != -1)) 
	  		return false;
   }
   return true;
}

// Check that a string contains only numbers
function isNumeric(data, ignoreWhiteSpace) {
   if (data.search) {
      if ((ignoreWhiteSpace && data.search(/[^\d\s]/) != -1) || (!ignoreWhiteSpace && data.search(/\D/) != -1)) 		
	  	return false;
   }
   return true;
}

// Remove characters that might cause security problems from a string 
function removeBadCharacters(data) {
   if (data.replace) {
	  data = data.replace(/[\<\>\"\'\%\;\)\(\&\+\{\}\^]/g,'');
   }
   return data;
}

// Remove a specific character from a string 
function removeThisCharacter(data, charToRemove) {
	if (data.replace) {
	  data = data.replace(new RegExp(charToRemove, 'g'),'');
   }
   return data;
}

// Remove spaces from a string 
function removeSpaces(data) {
	if (data.replace) {
	  data = data.replace(new RegExp(' ', 'g'),'');
   }
   return data;
}

// Remove leading and trailing whitespace from a string
function trimWhitespace(data) {
   var newString  = '';
   var substring  = '';
   beginningFound = false;
   
   // copy characters over to a new string
   // retain whitespace characters if they are between other characters
   for (var i = 0; i < data.length; i++) {
      
      // copy non-whitespace characters
      if (data.charAt(i) != ' ' && data.charCodeAt(i) != 9) {
         
         // if the temporary string contains some whitespace characters, copy them first
         if (substring != '') {
            newString += substring;
            substring = '';
         }
         newString += data.charAt(i);
         if (beginningFound == false) beginningFound = true;
      }
      
      // hold whitespace characters in a temporary string if they follow a non-whitespace character
      else if (beginningFound == true) substring += data.charAt(i);
   }
   return newString;
}

// Remove greek stress marks from letters in greek words
function removeGRStressMarks(data){
   if (data.replace) {
	  data = data.replace(new RegExp('ά', 'g'),'α');
	  data = data.replace(new RegExp('έ', 'g'),'ε');
	  data = data.replace(new RegExp('ή', 'g'),'η');
	  data = data.replace(new RegExp('ί', 'g'),'ι');
	  data = data.replace(new RegExp('ύ', 'g'),'υ');
	  data = data.replace(new RegExp('ό', 'g'),'ο');
	  data = data.replace(new RegExp('ώ', 'g'),'ω');
	  data = data.replace(new RegExp('Ά', 'g'),'Α');
	  data = data.replace(new RegExp('Έ', 'g'),'Ε');
	  data = data.replace(new RegExp('Ή', 'g'),'Η');
	  data = data.replace(new RegExp('Ί', 'g'),'Ι');
	  data = data.replace(new RegExp('Ύ', 'g'),'Υ');
	  data = data.replace(new RegExp('Ό', 'g'),'Ο');
	  data = data.replace(new RegExp('Ώ', 'g'),'Ω');
	  data = data.replace(new RegExp('ϊ', 'g'),'ι');
	  data = data.replace(new RegExp('ϋ', 'g'),'υ');
	  data = data.replace(new RegExp('Ϊ', 'g'),'Ι');
	  data = data.replace(new RegExp('Ϋ', 'g'),'Υ');
	  data = data.replace(new RegExp('ΰ', 'g'),'υ');
	  data = data.replace(new RegExp('ΐ', 'g'),'ι');
   }
   return data;	
}

// A greek version of 'toUpperCase()' focused in greek final sigma
function toGRUpperCase(data){
   if (data.replace) {
	  data = data.replace(new RegExp('ς', 'g'),'σ');
   }
   data = data.toUpperCase();
   return data;		
}

// A greek version of 'toLowerCase()' focused in greek final sigma 
function toGRLowerCase(data){
   if (data.charAt(data.length-1) == 'Σ'){
   	  data = data.slice(0,data.length-1);
	  data = data + "ς";
	  alert(data);
   }
   data = data.toLowerCase();
   return data;			
}

// Check for empty strings or white spaces strings
function isEmpty(data, ignoreWhiteSpace){
	if(ignoreWhiteSpace){
		data = EAData.removeSpaces(data);
	}
	if (data.charAt(0)=='')
		return true;
	else
		return false;
}



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


// 
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

function isBetween(fromDate,thisDate,toDate){

	if(EAData.isEarlier(thisDate,toDate) && EAData.isLater(fromDate,thisDate))
   		{return true;}
	else
 		return false;
}


function isEqualDate(fromDate,toDate){

	if(!EAData.isEarlier(fromDate,toDate) && !EAData.isLater(toDate,fromDate))
   		{return true;}
	else
 		return false;
}

