var xmlHttp=null;

function dd3s(Sx1,Sx2){

var xmlhttp5=false;

 try {
  xmlhttp5 = new ActiveXObject("Msxml2.XMLHTTP");
 } catch (e) {
  try {
   xmlhttp5 = new ActiveXObject("Microsoft.XMLHTTP");
  } catch (E) {
   xmlhttp5 = false;
  }
 }
if (!xmlhttp5 && typeof XMLHttpRequest!='undefined') {
	try {
		xmlhttp5 = new XMLHttpRequest();
	} catch (e) {
		xmlhttp5=false;
	}
}
if (!xmlhttp5 && window.createRequest) {
	try {
		xmlhttp5 = window.createRequest();
	} catch (e) {
		xmlhttp5=false;
	}
}


//var o_b = timh.substring(1,2);
//alert(timh.substring(6,8));
var timh1 =  Sx1.replace('p','') ;
var ptimh
var timh2 =  Sx2.replace('p','') ;
//alert(timh1.substring(0,2));
if (timh1.substring(0,2) < timh2.substring(0,2))
{  ptimh = 'daa'+timh1.substring(0,2)+timh2.substring(0,2)+'_k';}
else { ptimh = 'daa'+timh2.substring(0,2)+timh1.substring(0,2)+'_k';}
//alert(ptimh);
xmlhttp5.open("HEAD", ptimh+'.jsp',true);
 xmlhttp5.onreadystatechange=function() {
   if (xmlhttp5.readyState==4) {
   if (xmlhttp5.status==200) {//alert("URL Exists!");  
                             //  document.getElementById('tabIframe2').src= ptimh+'.jsp';
                            ShowText(crt_jsp());
                             }
    else if (xmlhttp5.status==404) {
	                                 //alert("URL doesn't exist!")
	                              // alert(xmlhttp.readyState+"Δεν Υπαρχει η Σελίδα !!!!!"+ptimh);
								  alert(" Δεν υπάρχει δυνατότητα συσχέτισης των ανωτέρω οντοτήτων ");
								      return false;}
     else alert("Status is "+xmlhttp5.status+ptimh)
  }
 }
 xmlhttp5.send(null)


//alert(ptimh);

}

function ShowText1(url){
	alert('ggggggggggggggggggggggggggggggggggggggggggg');
	var xmlout;
var request = (typeof(XMLHttpRequest) != "undefined") ?
    new XMLHttpRequest() : new ActiveXObject("Msxml2.XMLHTTP");
request.open("GET", url, false);
request.send(null);
if(!request.getResponseHeader("Date"))
{
  var cached = request;
  request = (typeof(XMLHttpRequest) != "undefined") ?
      new XMLHttpRequest() :
      new ActiveXObject("Msxml2.XMLHTTP");
  var ifModifiedSince = cached.getResponseHeader("Last-Modified");
  ifModifiedSince = (ifModifiedSince) ?
      ifModifiedSince : new Date(0); // January 1, 1970
  request.open("GET", url, false);
  request.setRequestHeader("If-Modified-Since", ifModifiedSince);
  request.send("");
  if(request.status == 304)
  {
    request = cached;
  }
  if (request.readyState==4 && request.status == 200)
{ 
	xmlout = request.responseText;
	
	
 //   var err = "<fieldset><legend><b>EAEC-----</b></legend> <TABLE  bgcolor=#FF0066><tr><td><font color=#FFFFFF> <strong>"+xmlHttp.responseText+"</strong></font></td></tr></TABLE></fieldset>";
	
	//document.getElementById("txtHint").innerHTML="";
	
	document.getElementById("txtHint").innerHTML=xmlout;
	}
}
}

function GetXmlHttpObject()
{
var   xmlHttp1 =null;
try
  {
  // Firefox, Opera 8.0+, Safari
  xmlHttp1=new XMLHttpRequest();

  }
catch (e)
  {
  // Internet Explorer
  try
    {//alert('fffffffffffffffffffffffffff');
    xmlHttp1=new ActiveXObject("Msxml2.XMLHTTP");
    }
  catch (e)
    {//alert('fffffffffffffffffffffffffff');
    xmlHttp1=new ActiveXObject("Microsoft.XMLHTTP");
    }
  }
return xmlHttp1;
}

function ShowText(purl)
{ 
//alert('fffffffffffffffffffffffffff'+purl);
xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
  {
  alert ("Your browser does not support AJAX!");
  return;
  } 
var url=purl;

xmlHttp.onreadystatechange=stateChanged_ShowText;
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
}

function stateChanged_ShowText() 
{
	var xmlout;
//document.getElementById("txtHint").innerHTML="<div align='center' style='color:red'  ><font  size='5' face='Times New Roman, Times, serif'> Παρακαλώ Περιμένετε !! </font></div>";	
	//alert('frrr');
	// var err = "<fieldset><legend><b>EAEC-----</b></legend> <TABLE  bgcolor=#FF0066><tr><td><font color=#FFFFFF> <strong>"+xmlHttp.responseText+"</strong></font></td></tr></TABLE></fieldset>";
		// alert(err);
if (xmlHttp.readyState==4 && xmlHttp.status == 200)
{ 
	xmlout = xmlHttp.responseText;
 alert('dddddddd11111---200');
	
   //var err = "<fieldset><legend><b>EAEC-----</b></legend> <TABLE  bgcolor=#FF0066><tr><td><font color=#FFFFFF> <strong>"+xmlHttp.responseText+"</strong></font></td></tr></TABLE></fieldset>";
	//alert(xmlout);
	document.getElementById("txtHint").innerHTML="";
	
	document.getElementById("txtHint").innerHTML=xmlout;
	}
//else {
//	document.getElementById("txtHint").innerHTML="<div align='center' style='color:red'  ><font  size='5' face='Times New Roman, Times, serif'> Δεν μπορείτε να συσχετίσετε τις ανωτέρω οντότητες !! </font></div>";	

//	}

}

function ShowText_photo(purl)
{ 
//alert('fffffffffffffffffffffffffff'+purl);
xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
  {
  alert ("Your browser does not support AJAX!");
  return;
  } 
var url=purl;

xmlHttp.onreadystatechange=stateChanged_ShowText_photo;
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
}

function stateChanged_ShowText_photo() 
{
	var xmlout;
document.getElementById("txtHint1").innerHTML="<div align='center' style='color:red'  ><font  size='5' face='Times New Roman, Times, serif'> Παρακαλώ Περιμένετε !! </font></div>";	
//	alert('frrr');
//	 var err = "<fieldset><legend><b>EAEC-----</b></legend> <TABLE  bgcolor=#FF0066><tr><td><font color=#FFFFFF> <strong>"+xmlHttp.responseText+"</strong></font></td></tr></TABLE></fieldset>";
		// alert(err);
if (xmlHttp.readyState==4 && xmlHttp.status == 200)
{ 
	xmlout = xmlHttp.responseText;
  // alert('dddddddd11111');
	
   //var err = "<fieldset><legend><b>EAEC-----</b></legend> <TABLE  bgcolor=#FF0066><tr><td><font color=#FFFFFF> <strong>"+xmlHttp.responseText+"</strong></font></td></tr></TABLE></fieldset>";
	//alert(xmlout);
	document.getElementById("txtHint1").innerHTML="";
	
	document.getElementById("txtHint1").innerHTML=xmlout;
	}
//else {
//	document.getElementById("txtHint").innerHTML="<div align='center' style='color:red'  ><font  size='5' face='Times New Roman, Times, serif'> Δεν μπορείτε να συσχετίσετε τις ανωτέρω οντότητες !! </font></div>";	

//	}

}


function ShowText_Top(purl)
{ 
//alert('fffffffffffffffffffffffffff'+purl);
xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
  {
  alert ("Your browser does not support AJAX!");
  return;
  } 
var url=purl;

xmlHttp.onreadystatechange=stateChanged_ShowText_Top;
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
}

function stateChanged_ShowText_Top() 
{
	var xmlout;
	
	alert('frrr'+xmlHttp.status);
if (xmlHttp.readyState==4 && xmlHttp.status == 200)
{ 
	xmlout = xmlHttp.responseText;
  // alert('dddddddd');
	
 //   var err = "<fieldset><legend><b>EAEC-----</b></legend> <TABLE  bgcolor=#FF0066><tr><td><font color=#FFFFFF> <strong>"+xmlHttp.responseText+"</strong></font></td></tr></TABLE></fieldset>";
	//alert(xmlout);
	document.getElementById("D_Top").innerHTML="";
	
	document.getElementById("D_Top").innerHTML=xmlout;
	}


}

function crt_jsp_ob_ob(tim) {
 var tm = tim;
 var  p_kat_a = ""+document.form_ypoth.kata.value;
 var  p_i_a = ""+document.form_ypoth.ida.value;
 var  dp_i_a = ""+document.form_ypoth.Dkata.value;
 var  yp_ida = ""+ document.form_ypoth.yp_ida.value;
 //var  pk_ida = ""+ document.form_ypoth.pk_ida.value;
 
 var  yp_idb = ""+ document.form_ypoth.yp_idb.value;
 var  p_kat_b = ""+document.form_ypoth.katb.value;
 var  p_i_b = ""+document.form_ypoth.idb.value;
 var  dp_i_b = ""+document.form_ypoth.Dkatb.value;;
// var  pk_idb = ""+ document.form_ypoth.pk_idb.value;
 var  yp_dsp ="";
 
 var jsp="";
 //alert(p_kat_a);
// alert(p_kat_b);
 if ( tm == '1') {p_kat_b='p01'; p_i_b = yp_idb; dp_i_b= yp_dsp;}
 if ( tm == '2') {p_kat_a='p01'; p_i_a = yp_ida; dp_i_b= yp_dsp;}
 
  if (p_kat_a >   p_kat_b)
  {
  jsp='daa'+p_kat_b.replace('p','')+p_kat_a.replace('p','')+'_i.jsp'+'?BT_CHK=1&'+'kat_a='+p_kat_b+'&id_a='+p_i_b+'&did_a='+dp_i_b+'&kat_b='+p_kat_a+'&id_b='+p_i_a+'&did_b='+dp_i_a;
  
  }
  else
  {
  jsp='daa'+p_kat_a.replace('p','')+p_kat_b.replace('p','')+'_i.jsp'+'?BT_CHK=1&'+'kat_a='+p_kat_a+'&id_a='+p_i_a+'&did_a='+dp_i_a+'&kat_b='+p_kat_b+'&id_b='+p_i_b+'&did_b='+dp_i_b;
  
  }
 //alert(jsp);
  
  return(jsp);
  }


function crt_jsp(tim) {
 var tm = tim;
 var  p_kat_a = ""+document.form_ypoth.kata.value;
 var  p_i_a = ""+document.form_ypoth.ida.value;
 var  dp_i_a = ""+document.form_ypoth.Dida.value;
 var  yp_ida = ""+ document.form_ypoth.yp_ida.value;
 var  pk_ida = ""+ document.form_ypoth.pk_ida.value;
 
 var  yp_idb = ""+ document.form_ypoth.yp_idb.value;
 var  p_kat_b = ""+document.form_ypoth.katb.value;
 var  p_i_b = ""+document.form_ypoth.idb.value;
 var  dp_i_b = ""+document.form_ypoth.Didb.value;
 var  pk_idb = ""+ document.form_ypoth.pk_idb.value;
 var  yp_dsp =""+document.form_ypoth.yp_dsp.value;
 
 var jsp="";
 //alert('ffffffffffsasasasffffffffff');
// alert(p_kat_a);
// alert(p_kat_b);



 if ( tm == '1') {p_kat_b='p01'; p_i_b = yp_idb; dp_i_b= yp_dsp;}
 if ( tm == '2') {p_kat_a='p01'; p_i_a = yp_idb; dp_i_a= yp_dsp;}
 
 
 //alert('p_kat_a'+p_kat_a);
 //alert('p_kat_b'+p_kat_b);
  if (p_kat_a >   p_kat_b)
  { //alert(p_kat_a+' > '+  p_kat_b);
  jsp='daa'+p_kat_b.replace('p','')+p_kat_a.replace('p','')+'_i.jsp'+'?BT_CHK=1&'+'kat_a='+p_kat_b+'&id_a='+p_i_b+'&did_a='+dp_i_b+'&kat_b='+p_kat_a+'&id_b='+p_i_a+'&did_b='+dp_i_a;
  
  }
  else
  {
	  if (p_kat_a == p_kat_b) 
	  
{ 
  jsp='daa'+p_kat_a.replace('p','')+p_kat_b.replace('p','')+'_i.jsp'+'?BT_CHK=1&'+'&fk1='+p_i_a+'&fk2='+p_i_b+'&kat_a='+p_kat_a+'&id_a='+pk_ida+'&did_a='+dp_i_a+'&kat_b='+p_kat_b+'&id_b='+pk_idb+'&did_b='+dp_i_b;
}
else{  
       jsp='daa'+p_kat_a.replace('p','')+p_kat_b.replace('p','')+'_i.jsp'+'?BT_CHK=1&'+'kat_a='+p_kat_a+'&id_a='+p_i_a+'&did_a='+dp_i_a+'&kat_b='+p_kat_b+'&id_b='+p_i_b+'&did_b='+dp_i_b;}
  }

return(jsp);

  }

