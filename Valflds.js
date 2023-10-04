var chk = "";
loop1="";
var loop;

function Val_Cur_Date(theElement, idField) {
	
	var givenDate = theElement.value;
	
	if (givenDate !="") {
    if (chk == "") {chk=idField;}
	
	var splits = givenDate.split("/");

	var fullGivenDate = splits[2] + "" + splits[1] + "" + splits[0];
   
	var todaysDate = new Date();	
	
	var year=todaysDate.getYear();
	var month=todaysDate.getMonth()+1;
	if (month < 10) {month = "0" + month;}
	var date=todaysDate.getDate();
	
	var fullTodaysDate = year + "" + month + "" + date;
   
	if (fullGivenDate > fullTodaysDate && chk == idField) {
    	alert(idField + " μεγαλύτερη της σημερινής"); chk = idField; 
		//alert("Η ημερομηνία είναι μεγαλύτερη της σημερινής");
  	    return false;
		}
	else {return true;} 
	}
	else {return true;} 
}
function Val_Date(theElement, idField,intp) {
  str = theElement.value;
  len = str.length;
  fintp = intp;
if (chk == "") {chk = idField;}
if (len == 10 && str.substring(4,5) != '-' ) {fintp = 'DD/MM/YYYY';}
if (len == "") {return true;}
      if (fintp == "YYYYMMDD")   {ln = 8;
                                 strday = str.substring(6,8);
                               strmonth = str.substring(4, 6);
                                stryear = str.substring(0, 4);
						      }
  else if  (fintp == "DDMMYYYY") {ln = 8; 
                                 strday = str.substring(0, 2);
                               strmonth = str.substring(2, 4);
                                stryear = str.substring(4, 8);
						      }
  else if  (fintp == "DD/MM/YYYY") {ln = 10;
                                   strday = str.substring(0, 2);
                                 strmonth = str.substring(3, 5);
                                  stryear = str.substring(6, 10);
                               }
 else if  (fintp == "YYYY-MM-DD") {ln = 10;
                                   strday = str.substring(8, 10);
                                 strmonth = str.substring(5, 7);
                                  stryear = str.substring(0, 4);
                               }

  if(len != ln && chk == idField ) {
    alert( idField + "   (.. 01/01/2010)!!"); chk =idField; 
    return false;
  } 
  
  if( chk == idField && (isNaN(strday) || (strday < 0) || isNaN(stryear) || (stryear < 0))) {
    alert( idField + "   FFFFFF!!");  chk =idField;
    return false;
  } 

  if( (strmonth == "01") || (strmonth == "03") || (strmonth == "05") ||
      (strmonth == "07") || (strmonth == "08") || (strmonth == "10") || 
      (strmonth == "12") ) { monthdays = 31 }
  else if( (strmonth == "04") || (strmonth == "06") || (strmonth == "09") ||
           (strmonth == "11") ) { monthdays = 30 }
  else if(strmonth == "02") { 
    monthdays = ((stryear % 4) == 0) ? 29 : 28;
  }
  else { if (chk == idField ) {
             alert( idField + "   (.. 01/01/2010)!!");  chk =idField; 
             return false;}
  }
  if(strday > monthdays && chk == idField) {
    alert( idField + "   !!"); chk =idField; 
    return false;
  }
  theElement.value = strday +"/"+strmonth+"/"+stryear;
  return true;
}

function Val_AFM(afmv,idField) {
	var afm = afmv.value
   if (!afm.match(/^\d{9}$/) || afm == '000000000'){
      if (afm!=''){
	 alert(" "+idField+': '+afm);
	 chk =idField;
	 return false;
	  }
   }
   var m = 1, sum = 0;
   for (var i = 7; i >= 0; i--) {
      m *= 2;
      sum += afm.charAt(i) * m;
   }

   return sum % 11 % 10 == afm.charAt(8);
}
    function Val_adam_null(p_value,idField,kae,poso,fpa)
	     {   
		  var vl = p_value;
		  var pposo = 0;
		  pposo = (pposo+poso)/  (1+(fpa/100));
          //alert('kae='+kae+ pposo);
          if ((pposo >= 1000 && kae != "0711") 
			   && (pposo >= 1000 && kae != "0712") 
               && (pposo >= 1000 && kae != "0713") 
		       && (pposo >= 1000 && kae != "0881")
			   && (pposo >= 1000 && kae != "1611")
			   && (pposo >= 1000 && kae != "2739"))  {  //alert('1111');
			  if (chk == "") {chk=idField;}
			   if (vl.value == "" && chk == idField)
			        {alert("  ( " + idField +" )" ); chk =idField;  return false;}
               else {return true;} 
		   } else {return true;}
	     }
	
         function Val_null(p_value,idField)
	     {  
		  var vl = p_value;
		       if (chk == "") {chk=idField;}
			   if (vl.value == "" && chk == idField)
			        {alert("  ( " + idField +" )" ); chk =idField;  return false;}
               else {return true;} 
	     }
		 function Val_null_0813_9811(p_value,pkae_value,idField)
	     {  
		  var vl = p_value;
		  var vlkae = ""+pkae_value;
		  var vlkaev = pkae_value.value;
		  
		      //alert(vlkaev);
              if (vlkaev == "0813" || vlkaev == "9811" ) 
			  {
		       if (chk == "") {chk=idField;}
			   if (vl.value == "" && chk == idField)
			        {alert("  ( " + idField +" )" ); chk =idField;  return false;}
               else {return true;} 
			  }
			  else {return true;} 
	     }
		 
        function Val_num(p_value,idField)
		{
          var i=0;
		  var ok = false;
		  var vl = p_value;
		       if (chk == "") {chk = idField;}
			   if ( vl.value != "" && chk == idField )
			   {     
				  for(i=0;i<vl.value.length;i++)
				  { 
                     if(parseInt(vl.value.charAt(i))>=0 && parseInt(vl.value.charAt(i))<=9 )
                     { ok = true;}
                     else {ok =false; break;}
                  }
			      if (ok == true )  { return true;} 
			      else {alert("   ( " +idField +" )" ); chk =idField; return false;} 
			   }
			   else {return true;}
		}

    function Val_trans(vl ,tp,idField,ex) {
    var tr  =  vl.value;
	   var tr_init = vl.value;
	   var sp  = "Q!@#$%^&*()_-+,.;:|\}]{[|\"\'";
    var nm  = "1234567890";
    var nl  = ""; 
    var lt = "ABGDEZHUIKLMNJOPRSTYFXCVW";
    var gr = "ΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩΣ";
    var from ="";
	   var to = ""; 
	   var lekt = "";
    for (j=0; j<= lt.length;j++) {
         sp = sp.replace(ex.charAt(j),'');
		  }
    if (chk == "") {chk = idField;}
    tr = tr.toUpperCase();
	if (tp == "gr") {sp = nm+sp; from = lt; to = gr; lekt=" Γράμματα ";}
    else if (tp == "en") {sp = nm+sp; from = gr; to = lt; lekt=" Γράμματα ";}
	else if (tp == "enn") {sp = sp; from = gr+nm; to = lt+nm; lekt=" Γράμματα και Αριθμούς ";}
	else if (tp == "grn") {sp = sp; from = lt+nm; to = gr+nm; lekt=" Γράμματα και Αριθμούς "; }
	else if (tp == "nm") {sp = sp+lt+gr; from = nm; to = nm;  lekt=" Αριθμούς "; }
	
	for (j=0; j<= sp.length;j++) {
	      for (i=0; i<= tr.length;i++) {
           tr = tr.replace(sp.charAt(j),nl.charAt(j));
        }
    }
	if (tr.length != vl.value.length && chk == idField)
	     {alert("Συπληρώστε μόνο"+lekt+"στο πεδίο " + idField ); chk =idField; return false;}
	else {
 	      for (j=0; j<= lt.length;j++) {
	         for (i=0; i<= tr.length;i++) {
          tr = tr.replace(from.charAt(j),to.charAt(j));
	          }
           }
           vl.value = tr;
           return true;
	      }
    } 
    
	
	function Val_trans1(vl ,tp,idField,ex) {
    var tr  =  vl.value;
	   var tr_init = vl.value;
	   var sp  = "!@#$%^&*()_-+,.;:|\}]{[|\"\'";
    var nm  = "1234567890";
    var nl  = ""; 
    var lt = "ABGDEZHUIKLMNJOPRSTYFXCVWQ";
    var gr = "";
    var from ="";
	   var to = ""; 
	   var lekt = "  ";
    for (j=0; j<= lt.length;j++) {
         sp = sp.replace(ex.charAt(j),'');
		  }
    if (chk == "") {chk = idField;}
tr = tr.toUpperCase().replace('','');
	if (tp == "gr") {sp = nm+sp; from = lt; to = gr; lekt="  ";}
    else if (tp == "en") {sp = nm+sp; from = gr; to = lt; lekt="  ";}
	else if (tp == "enn") {sp = sp; from = gr+nm; to = lt+nm; lekt="    ";}
	else if (tp == "grn") {sp = sp; from = lt+nm; to = gr+nm; lekt="    "; }
	else if (tp == "nm") {sp = sp+lt+gr; from = nm; to = nm;  lekt="  "; }
	
	for (j=0; j<= sp.length;j++) {
	      for (i=0; i<= tr.length;i++) {
           tr = tr.replace(sp.charAt(j),'');
		   alert(tr);
        }
    }
	alert(tr.length+' '+vl.value.length+' '+chk+' '+idField);
	if (tr.length != vl.value.length && chk == idField)
	     {alert("  "+lekt+"   (" + idField + " )" ); chk =idField;  return false;}
	else {
 	      for (j=0; j<= lt.length;j++) {
	         for (i=0; i<= tr.length;i++) {
          tr = tr.replace(from.charAt(j),to.charAt(j));
	          }
           }
           vl.value = tr;
           return true;
	      }
    } 
 function Val_All() 
 {   
 for (var i = 0,j=arguments.length;i<j; i++){
	  arguments[i].focus();
	  arguments[i].blur();
	  
	   
	  //lp= loop1;
	 }
	 
     if (chk!="")  {form39.submit();}
	 //
 }
 
function currDate(vl){
	      var now=new Date();
	      var year=now.getYear();
	      var month=now.getMonth()+1;
		  var day=now.getDay();
		  var date=now.getDate();
		
		if (date < 10 ) {date="0"+date; }
		if (month < 10) {month="0"+month; }
	//	alert(date+"/"+month+"/"+year);
	       vl = date+"/"+month+"/"+year;
           return true;
		
	//	alert(now); alert(year); alert(month); alert(day); alert(date); 
	
	
	} 
	
function get_Year(fld)
		{

var currentTime = new Date()
var month = currentTime.getMonth() + 1
var day = currentTime.getDate()
var year = currentTime.getFullYear()
fld.value = year;
//document.write(month + "/" + day + "/" + year)
		}


function Val_ora(p_value,idField)
		{
          var i=0;
		  var ok = false;
		  var vl = p_value;
		  var ora = vl.value.substring(0,2);
		  var telia =  vl.value.substring(2,3);
		  var lept = vl.value.substring(3,5);
		  var vln=ora+lept;
		// alert(ora);alert(telia);alert(lept);
		       if (chk == "") {chk = idField;}
			   if ( vl.value != "" && chk == idField )
			   {     
				  for(i=0;i<vln.length;i++)
				  { 
                    if(parseInt(vln.charAt(i))>=0 && parseInt(vln.charAt(i))<=9 )
                     { ok = true;}
                     else {ok =false; break;}
                  }
			      if (ok == true )  {
                    if(parseInt(ora.charAt(0)+ ora.charAt(1)) >=0 &&
				       parseInt(ora.charAt(0)+ora.charAt(1))<=23 &&
				       parseInt(lept.charAt(0)+lept.charAt(1))>=0 &&
				       parseInt(lept.charAt(0)+lept.charAt(1))<=59 &&
				       telia == "." 
				       )

				      {return true;}
				      else {alert(idField+":   ..23.54  00.14 "); chk =idField; return false;}
				  } 
			      else {alert(idField+":    ..23.54  00.14"); chk =idField; return false;}
			   }
			   else {return true;}
		}
		

///////////////////////////////////////////////////////
//   einai roloi   <body onload="startTime(); ">
///////////////////////////////////////////////////////
function startTime() {
    var today=new Date();
    var h=today.getHours();
    var m=today.getMinutes();
    var s=today.getSeconds();
    m = checkTime(m);
    s = checkTime(s);
    document.getElementById('txt').innerHTML = h+":"+m+":"+s;
    var t = setTimeout(function(){startTime()},500);
}

function checkTime(i) {
	
    if (i<10) {i = "0" + i};  // add zero in front of numbers < 10
    return i;
}
//////////////////////////////////////////////////////////////

//  dt(this,'DD/MM/YYYY HH:MI:SS')  hmeromonia 
function dt(tm,fmm) { 
  ordr   = new Array();  
  ordrtm = new Array();

var ddd ="";
var str = tm.value;
var nm  = tm.name;
if (str != "") { 
var strday = str.substring(fmm.indexOf("DD"),fmm.indexOf("DD")+2);
    ordr [0]   = fmm.indexOf("DD");

var strmonth = str.substring(fmm.indexOf("MM"), fmm.indexOf("MM")+2) ;
    ordr [1]   = fmm.indexOf("MM");
	
var stryear = str.substring(fmm.indexOf("YYYY"), fmm.indexOf("YYYY") +4);
    ordr [2]   = fmm.indexOf("YYYY");

var strhour = str.substring(fmm.indexOf("HH"), ((fmm.indexOf("HH")==-1)?0:fmm.indexOf("HH")+2)) ;
if(fmm.indexOf("HH")!=-1){ ordr [3] = fmm.indexOf("HH")};

var strmin = str.substring(fmm.indexOf("MI"), ((fmm.indexOf("MI")==-1)?0:fmm.indexOf("MI")+2));
if(fmm.indexOf("MI")!=-1){ ordr [4] = fmm.indexOf("MI")};

var strss = str.substring(fmm.indexOf("SS"), ((fmm.indexOf("SS")==-1)?0:fmm.indexOf("SS")+2));
if(fmm.indexOf("SS")!=-1){ ordr [5] = fmm.indexOf("SS")};
	
//alert("y= "+stryear+" mm="+strmonth-1+" dd="+strday+" hh"+strhour+" mi"+strmin+" ss"+strss);
var d3 = new Date(stryear,strmonth-1,strday,strhour,strmin,strss);
 
ordr.sort(function(a, b){return a-b});
  
    if ( isNaN(d3) ) {alert('wrong Date'); return false;}
	else{
    		var dy=d3.getDate() ;
	   		if (dy.toString().length == 1) {dys = "0"+dy.toString();} else{dys = dy.toString();}
    
			var mh=d3.getMonth() +1; 
	   		if (mh.toString().length == 1) {mhs = "0"+mh.toString();} else{mhs = mh.toString();}
    
    		var y=d3.getFullYear(); 
			var h=d3.getHours();
    		var m=d3.getMinutes();
    		var s=d3.getSeconds();
	        h = checkTime(h);
    		m = checkTime(m);
    		s = checkTime(s);
	
			ordrtm[fmm.indexOf("DD")]  = dys;   
			ordrtm[fmm.indexOf("MM")]  = mhs;   
			ordrtm[fmm.indexOf("YYYY")]  = y;
			ordrtm[fmm.indexOf("HH")]  = h; 
			ordrtm[fmm.indexOf("MI")]  = m;
			ordrtm[fmm.indexOf("SS")] = s;
	
			for (var i=0;i<ordr.length;i++) {
         		ddd = ddd+ordrtm[ordr[i]];
    		}
  
			if (  ddd == str.replace(/ /g,"").replace(/\//g,"").replace(/:/g,"").replace(/-/g,"").replace(/\./g,"") )  {
				  document.getElementById(nm).value = fmm.replace("DD",dys).replace("MM",mhs).replace("YYYY",y).replace("HH",h).replace("MI",m).replace("SS",s	) ;
				  return true;}  
			else{
			      return false;}
	
	}
}
else {return true;	}
}

//  Val_dt(this,'periggrafi', 'DD/MM/YYYY HH:MI:SS')  hmeromonia 
function Val_Dt(tm,perig,fmm) { 
  ordr   = new Array();  
  ordrtm = new Array();

var ddd ="";
var str = tm.value;
var nm  = tm.name;
if (str != "") { 
var strday = str.substring(fmm.indexOf("DD"),fmm.indexOf("DD")+2);
    ordr [0]   = fmm.indexOf("DD");

var strmonth = str.substring(fmm.indexOf("MM"), fmm.indexOf("MM")+2) ;
    ordr [1]   = fmm.indexOf("MM");
	
var stryear = str.substring(fmm.indexOf("YYYY"), fmm.indexOf("YYYY") +4);
    ordr [2]   = fmm.indexOf("YYYY");

var strhour = str.substring(fmm.indexOf("HH"), ((fmm.indexOf("HH")==-1)?0:fmm.indexOf("HH")+2)) ;
if(fmm.indexOf("HH")!=-1){ ordr [3] = fmm.indexOf("HH")};

var strmin = str.substring(fmm.indexOf("MI"), ((fmm.indexOf("MI")==-1)?0:fmm.indexOf("MI")+2));
if(fmm.indexOf("MI")!=-1){ ordr [4] = fmm.indexOf("MI")};

var strss = str.substring(fmm.indexOf("SS"), ((fmm.indexOf("SS")==-1)?0:fmm.indexOf("SS")+2));
if(fmm.indexOf("SS")!=-1){ ordr [5] = fmm.indexOf("SS")};
	
//alert("y= "+stryear+" mm="+strmonth-1+" dd="+strday+" hh"+strhour+" mi"+strmin+" ss"+strss);
var d3 = new Date(stryear,strmonth-1,strday,strhour,strmin,strss);
 
ordr.sort(function(a, b){return a-b});
  
    if ( isNaN(d3) ) {alert('wrong Date :'+perig); return false;}
	else{
    		var dy=d3.getDate() ;
	   		if (dy.toString().length == 1) {dys = "0"+dy.toString();} else{dys = dy.toString();}
    
			var mh=d3.getMonth() +1; 
	   		if (mh.toString().length == 1) {mhs = "0"+mh.toString();} else{mhs = mh.toString();}
    
    		var y=d3.getFullYear(); 
			var h=d3.getHours();
    		var m=d3.getMinutes();
    		var s=d3.getSeconds();
	
    		m = checkTime(m);
    		s = checkTime(s);
			h = checkTime(h);
	
			ordrtm[fmm.indexOf("DD")]  = dys;   
			ordrtm[fmm.indexOf("MM")]  = mhs;   
			ordrtm[fmm.indexOf("YYYY")]  = y;
			ordrtm[fmm.indexOf("HH")]  = h; 
			ordrtm[fmm.indexOf("MI")]  = m;
			ordrtm[fmm.indexOf("SS")] = s;
	
			for (var i=0;i<ordr.length;i++) {
         		ddd = ddd+ordrtm[ordr[i]];
    		}
  
			if (  ddd == str.replace(/ /g,"").replace(/\//g,"").replace(/:/g,"").replace(/-/g,"").replace(/\./g,"") )  {
				  document.getElementById(nm).value = fmm.replace("DD",dys).replace("MM",mhs).replace("YYYY",y).replace("HH",h).replace("MI",m).replace("SS",s	) ;
				  return true;}  
			else{
			      alert('wrong Date :'+perig);return false;}
	
	}
}
else {return true;	}
}



// make focus on a field run and firefox
function focus(fld)
{ nm = fld.name;
  window.setTimeout(function () { document.getElementById(nm).focus(); }, 0);
}

		
		