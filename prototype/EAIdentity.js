// JavaScript Document
function EAIdentity (){
	this.isValidIdentity = isValidIdentity;
	this.isGRValidIdentity = isGRValidIdentity;
	this.isLatinValidIdentity = isLatinValidIdentity;
	this.getIdLektiko = getIdLektiko;
	this.getIdNum = getIdNum;
	this.isValidTel=isValidTel;
	this.getTel=getTel;
}

var EAIdentity = new EAIdentity();

function isValidIdentity(idData, lengthOfIdLektiko, lengthOfIdNum){
	
	// make idData free of delimiters like ' ', '-','/'
	idData = idData.replace(new RegExp(' ', 'g'),'');
	idData = idData.replace(/[\-\/]/g,'');

	var tmpIdLektiko = idData.slice(0,lengthOfIdLektiko);
	var tmpIdNum = idData.slice(lengthOfIdLektiko);
	
	//number error
	if ((tmpIdNum.search(/[^\d]/)!=-1) || (tmpIdNum.length != lengthOfIdNum))
		return false;
	
	//type of ID error	
	if (tmpIdLektiko.search(/[^α-ωΑ-Ωa-zA-Z]/)!=-1){
		return false;
	}
	
	return true;
}
function isGRValidIdentity(idData, lengthOfIdLektiko, lengthOfIdNum){
	
	// make idData free of delimiters like ' ', '-','/'
	idData = idData.replace(new RegExp(' ', 'g'),'');
	idData = idData.replace(/[\-\/]/g,'');

	var tmpIdLektiko = idData.slice(0,lengthOfIdLektiko);
	var tmpIdNum = idData.slice(lengthOfIdLektiko);
	
	//number error
	if ((tmpIdNum.search(/[^\d]/)!=-1) || (tmpIdNum.length != lengthOfIdNum))
		return false;
	
	//type of ID error	
	if (tmpIdLektiko.search(/[^α-ωΑ-Ω]/)!=-1){
		return false;
	}
	
	return true;
}
function isLatinValidIdentity(idData, lengthOfIdLektiko, lengthOfIdNum){
	
	// make idData free of delimiters like ' ', '-','/'
	idData = idData.replace(new RegExp(' ', 'g'),'');
	idData = idData.replace(/[\-\/]/g,'');

	var tmpIdLektiko = idData.slice(0,lengthOfIdLektiko);
	var tmpIdNum = idData.slice(lengthOfIdLektiko);
	
	//number error
	if ((tmpIdNum.search(/[^\d]/)!=-1) || (tmpIdNum.length != lengthOfIdNum))
		return false;
	
	//type of ID error	
	if (tmpIdLektiko.search(/[^a-zA-Z]/)!=-1){
		return false;
	}
	
	return true;
}

function getIdLektiko(idData, lengthOfIdLektiko){
		var tmpIdLektiko = idData.slice(0,lengthOfIdLektiko);
		return tmpIdLektiko;
}

function getIdNum(idData, lengthOfIdNum){
	
	// make idData free of delimiters like ' ', '-','/'
	idData = idData.replace(new RegExp(' ', 'g'),'');
	idData = idData.replace(/[\-\/]/g,'');

	var tmpIdNum = idData.slice(idData.length - lengthOfIdNum);
	return tmpIdNum;
}


function isValidTel(data){
var telLength=0;
var telFormat =/^[0-9]$/;
 for (var i = 0; i < data.length; i++){
     if(telFormat.test(data.substring(i,i+1))){
	 telLength++;
	 }
 }
  if(telLength==10)	return true;

 if(telLength!=10)	return false;

}


function getTel(data){

var dataLektiko = EAData.getIdNum(data, 10));
return strTel;
}
/*
var strTel="";
var telFormat =/^[0-9]$/;
 for (var i = 0; i < data.length; i++){
     if(telFormat.test(data.substring(i,i+1))){
	 strTel=strTel+data.substring(i,i+1)
	 }
 }
	return strTel;


}
*/


 