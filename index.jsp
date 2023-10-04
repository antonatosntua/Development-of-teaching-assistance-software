<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=iso-8859-7" language="java" import="javax.sql.*, java.sql.*" errorPage="" %>
<%@ include file="Connections/edtpr.jsp" %>
 
<%@ page import="java.util.*" %>
<html>
<head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-7" />
<%
String stm_RstLst = "";
Connection ConnRstLst = null;
PreparedStatement StatementRstLst = null;
ResultSet RstLst = null;
try{
Driver DriverRstLst = (Driver)Class.forName(MM_DRIVER).newInstance();
ConnRstLst = DriverManager.getConnection(MM_STRING,MM_USERNAME,MM_PASSWORD);
ConnRstLst.setAutoCommit(false);
boolean RstLst_isEmpty ;
boolean RstLst_hasData ;
Object RstLst_data;
int Repeat__index = 0;
int Repeat__numRows = -1;
%>

<%@ include file="chk_users.jsp" %>

	<title></title>
	<link rel="stylesheet" href="css/main.css" type="text/css">
<SCRIPT LANGUAGE="JavaScript" SRC="callajax.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript" SRC="Valflds.js"></SCRIPT>
</head>
<body 
 bgcolor="#F4F4DD"  leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<%@ include file="lock.jsp"%>
<div id="mnu_y" style="color:blue;position:relative;cursor:hand;"> <%//@ include file="mnu_y.jsp"%></div>
<div id="D_Top"> </div>
<p align="center"><font color="#CC3333">
</font></p>
<% session.setAttribute("query_result","");%>
<div id="txtHint" style="color:blue;position:relative;cursor:hand;"> </div>
<form name="frm687" method="post" action="">
<table class="t1"  align="center"> 
<tr>

<td colspan="4" >
<div class="btn1" >
<a  title="Καθαρισμός"><input type="image" name="reset" src="images/clear.png"  onClick="frm687.reset(); return false;" > </a>

<a title="Αναζήτηση"> <input type="image" name="Submit" src="images/view.png"   onClick="loop=0;
 if ((Val_null(document.frm687.Id_Xrhsths,'Υποχρεωτική συμπλήρωση Κωδικού χρήστη') == false)) 
 {document.frm687.Id_Xrhsths.focus();loop=1; return false;} else {chk='';
 if ((Val_null(document.frm687.Password,'Υποχρεωτική συμπλήρωση Συνθηματικού') == false)) 
 {document.frm687.Password.focus();loop=1; return false;} else {chk='';
 
}
}
if(loop==0){  frm687.submit();}
" ></a>
</div>
</tr>
 <tr bgcolor="#82A7E3">
           <td ><div id="hdr" >Εισαγωγή Χρήστη </div></td>
        </tr><TR><TD>
<table align="center"  style="width:auto"><TR>
<TD><fieldset>
<legend><b></b></legend>
<table>
<tr>
<th>Κωδικός Χρήστη :</th>
<td ><input name="Id_Xrhsths" id="Id_Xrhsths" type="text" autocomplete="off" size="20" maxlength="20"
                 onKeyPress="return (event.keyCode == 13?false:true);"
                 TITLE="ΔΩΣΕ Id_Xrhsths:"

                  >
</td>
</tr>
<tr>
<th>Password:</th>
<td ><input name="Password" id="Password" type="password" autocomplete="off" size="10" maxlength="10"   
                 onKeyPress="return (event.keyCode == 13?false:true);"
                 TITLE="ΔΩΣΕ Password:"

                  >
</td>
</tr>

</table></fieldset></TD>
</TR>

	</table><tr>

<td colspan="4" >
<div class="btn1" >
<a title="Καθαρισμός"><input type="image" name="reset" src="images/clear.png"   onClick="frm687.reset(); return false;" > </a>

<a title="Αναζήτηση"> <input type="image" name="Submit" src="images/view.png"   onClick="loop=0;
 if ((Val_null(document.frm687.Id_Xrhsths,'Υποχρεωτική συμπλήρωση Κωδικού χρήστη') == false)) 
 {document.frm687.Id_Xrhsths.focus();loop=1; return false;} else {chk='';
 if ((Val_null(document.frm687.Password,'Υποχρεωτική συμπλήρωση Συνθηματικού') == false)) 
 {document.frm687.Password.focus();loop=1; return false;} else {chk='';
 
}
}
if(loop==0){  frm687.submit();}
" ></a>
</div>
<div align="left">
     <input type="hidden" name="flag_k" value="1">
</div>
</tr>
</table >
</form>
 <%
 }
catch(SQLException eLst) { 
System.out.println("(APPL_NO_4="+")"+ ")"+ stm_RstLst);
						            System.out.println("(APPL_NO_eLst="+")"+
		 				                  "- ORA_ERROR_MESSAGE= "+eLst.getMessage());
												out.write("<div align='center' style='color:#FF0000'>ΠΡΟΒΛΗΜΑ ΕΦΑΡΜΟΓΗΣ :"+
		 												  "(APPL_NO_eLst ="+") "+ eLst.getMessage()+
		          						  				  "<div align='center' style='color:#0033FF'> ΕΠΙΚΟΙΝΩΝΕΙΣΤΕ ΜΕ ΤΗΝ "+
				                            			  " Δ/ΣΗ ΠΛΗΡΟΦΟΡΙΚΗΣ τηλ. 1099400-1043204 </div></div>"); %>
					   <%//@ include file="footer_catch.jsp"%>
					   <%
				
					   }
finally {ConnRstLst.close();
}
%>

 </body>
 <link rel="stylesheet" type="text/css" href="js/jquery/Dates_js/jquery.datetimepicker.css"/> 
 <script src="js/jquery/Dates_js/jquery.js"></script>
      <script src="js/jquery/Dates_js/jquery.datetimepicker.js"></script>
      <script src="js/jquery/Dates_js/Dates.js"></script>


</html>
