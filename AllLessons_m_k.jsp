<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=iso-8859-7" language="java" import="javax.sql.*, java.sql.*,javax.naming.*,oracle.jdbc.pool.*" errorPage="" %>
 
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
Context initCtxLst = new InitialContext();
Context envCtxLst = (Context) initCtxLst.lookup("java:comp/env"); 
DataSource dsLst = (DataSource )envCtxLst.lookup("jdbc/edtpr"); 
ConnRstLst = dsLst.getConnection();
ConnRstLst.setAutoCommit(false);
boolean RstLst_isEmpty ;
boolean RstLst_hasData ;
Object RstLst_data;
int Repeat__index = 0;
int Repeat__numRows = -1;
%>

<%@ include file="AllLessons_m_krit.jsp" %>

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
<%=(session.getAttribute("mess_tr_result")!=null?session.getAttribute("mess_tr_result"):"")%>
<%=(session.getAttribute("query_result")!=null?session.getAttribute("query_result"):"")%>
</font></p>
<% session.setAttribute("query_result","");%>
<div id="txtHint" style="color:blue;position:relative;cursor:hand;"> </div>
<form name="frm870" method="post" action="">
<table class="t1"  align="center"> 
<tr>

<td colspan="4" >
<div class="btn1" >
<a  title="Καθαρισμός"><input type="image" name="reset" src="images/clear.png"  onClick="frm870.reset(); return false;" > </a>
<a title="Αναζήτηση"><input type="image" name="Submit" src="images/view.png"  onClick="loop=0;
 if ((Val_num(document.frm870.Rn,'Α/Α') == false)) 
 {document.frm870.Rn.focus();loop=1; return false;} else {chk='';
 if ((Val_num(document.frm870.User_Id,'Στοιχεία Χρήστη') == false)) 
 {document.frm870.User_Id.focus();loop=1; return false;} else {chk='';
 if ((Val_num(document.frm870.Lesson_Id,'Α/Α Μαθήματος') == false)) 
 {document.frm870.Lesson_Id.focus();loop=1; return false;} else {chk='';
if (document.form870.Fr_Lesson_Date_h.value == ''){
if ((Val_Dt(document.frm870.Fr_Lesson_Date,'¨Εναρξη Μαθήματος','DD/MM/YYYY') == false)) 
 {document.frm870.Fr_Lesson_Date.focus();loop=1; return false;} else {chk='';
if (document.form870.To_Lesson_Date_h.value == ''){
if ((Val_Dt(document.frm870.To_Lesson_Date,'Λήξη Μαθήματος','DD/MM/YYYY') == false)) 
 {document.frm870.To_Lesson_Date.focus();loop=1; return false;} else {chk='';
 if ((Val_num(document.frm870.Answer_Id,'Απάντηση Μαθητή') == false)) 
 {document.frm870.Answer_Id.focus();loop=1; return false;} else {chk='';

}}}}}}}}
if(loop==0){  frm870.submit();}
" ></a>
</div>
</tr>
 <tr bgcolor="#82A7E3">
           <td ><div id="hdr" >Κριτήρια Αναζήτησης (Μαθήματα(Μαθητή))</div></td>
        </tr><TR><TD>
<table align="center"  style="width:auto"><TR>
<TD><fieldset>
<legend><b></b></legend>
<table>
<tr>
<!--th>Α/Α:</th -->
<td ><input name="Rn" id="Rn" type="hidden" autocomplete="off" size="22" maxlength="22"
                 onKeyPress="return (event.keyCode == 13?false:true);"
                 TITLE="ΔΩΣΕ Rn:"
 class="nm" 
                 onBlur="  if ((Val_num(this,'Α/Α') == false))  {this.focus();} else {chk='';}"
 >
</td>
</tr>
<tr>
<th>Στοιχεία Χρήστη:</th>
<td >        <% stm_RstLst="select user_id, '('||user_name||') '|| first_name||' '|| last_name   dsp_perig from edtool.vw_users where 1 = 1 and user_id ="+session.getAttribute("UserId")+" order by DSP_PERIG ";
         StatementRstLst = ConnRstLst.prepareStatement(stm_RstLst);
         RstLst = StatementRstLst.executeQuery();
         RstLst_isEmpty = !RstLst.next();
         RstLst_hasData = !RstLst_isEmpty;
         Repeat__index = 0;
         Repeat__numRows = -1;
        %>
        <select name="User_Id" size="1" 
                 TITLE="ΔΩΣΕ User_Id:"
>
            
          <% while ((RstLst_hasData)&&(Repeat__numRows-- != 0)) { %>
            <option value="<%=(((RstLst_data = RstLst.getObject("USER_ID"))==null || RstLst.wasNull())?"":RstLst_data)%>"> 
		                 <%=(((    RstLst_data = RstLst.getObject("DSP_PERIG"))==null || RstLst.wasNull())?"":RstLst_data)%>
		        </option>
            <%  Repeat__index++; RstLst_hasData = RstLst.next();}%>
        </select> 
</td>
</tr>
<tr>
<th>Α/Α Μαθήματος:</th>
<td >        <% stm_RstLst="select lesson_id, lesson_descr ||' - '||chapter_idd  ||' '||   '(εναρξη :' ||fr_lesson_dated ||' ληξη:'|| to_lesson_dated||')'  dsp_perig from vw_all_lessons where 1=1  and user_id ="+session.getAttribute("UserId")+" order by DSP_PERIG ";
         StatementRstLst = ConnRstLst.prepareStatement(stm_RstLst);
         RstLst = StatementRstLst.executeQuery();
         RstLst_isEmpty = !RstLst.next();
         RstLst_hasData = !RstLst_isEmpty;
         Repeat__index = 0;
         Repeat__numRows = -1;
        %>
        <select name="Lesson_Id" size="1" 
                 TITLE="ΔΩΣΕ Lesson_Id:"
>
            <option   selected="selected" value="">
		         </option>
          <% while ((RstLst_hasData)&&(Repeat__numRows-- != 0)) { %>
            <option value="<%=(((RstLst_data = RstLst.getObject("LESSON_ID"))==null || RstLst.wasNull())?"":RstLst_data)%>"> 
		                 <%=(((    RstLst_data = RstLst.getObject("DSP_PERIG"))==null || RstLst.wasNull())?"":RstLst_data)%>
		        </option>
            <%  Repeat__index++; RstLst_hasData = RstLst.next();}%>
        </select> 
</td>
</tr>
<tr>
<th>¨Εναρξη Μαθήματος:</th>
<td >                   <INPUT TYPE="text" class="Dt" NAME="Fr_Lesson_Date" VALUE="" SIZE=16
                    onKeyPress="return (event.keyCode == 13?false:true);"
                 TITLE="ΔΩΣΕ Fr_Lesson_Date:"
                    onBlur=" if ((Val_Dt(this,'¨Εναρξη Μαθήματος','DD/MM/YYYY') == false))  {this.focus();} "> 
   <input  type="hidden" name="Fr_Lesson_Date_h" value=""  size="50" >
</td>
</tr>
<tr>
<th>Λήξη Μαθήματος:</th>
<td >                   <INPUT TYPE="text" class="Dt" NAME="To_Lesson_Date" VALUE="" SIZE=16
                    onKeyPress="return (event.keyCode == 13?false:true);"
                 TITLE="ΔΩΣΕ To_Lesson_Date:"
                    onBlur=" if ((Val_Dt(this,'Λήξη Μαθήματος','DD/MM/YYYY') == false))  {this.focus();} "> 
   <input  type="hidden" name="To_Lesson_Date_h" value=""  size="50" >
</td>
</tr>
<tr>
<th>Απάντηση Μαθητή:</th>
<td >        <% stm_RstLst="select ID, DESCR_ANSWER  dsp_perig from ANSWERS where 1=1 order by DSP_PERIG ";
         StatementRstLst = ConnRstLst.prepareStatement(stm_RstLst);
         RstLst = StatementRstLst.executeQuery();
         RstLst_isEmpty = !RstLst.next();
         RstLst_hasData = !RstLst_isEmpty;
         Repeat__index = 0;
         Repeat__numRows = -1;
        %>
        <select name="Answer_Id" size="1" 
                 TITLE="ΔΩΣΕ Answer_Id:"
>
            <option   selected="selected" value="">
		         </option>
          <% while ((RstLst_hasData)&&(Repeat__numRows-- != 0)) { %>
            <option value="<%=(((RstLst_data = RstLst.getObject("ID"))==null || RstLst.wasNull())?"":RstLst_data)%>"> 
		                 <%=(((    RstLst_data = RstLst.getObject("DSP_PERIG"))==null || RstLst.wasNull())?"":RstLst_data)%>
		        </option>
            <%  Repeat__index++; RstLst_hasData = RstLst.next();}%>
        </select> 
</td>
</tr>
</table></fieldset></TD>
</TR>

	</table><tr>

<td colspan="4" >
<div class="btn1" >
<a title="Καθαρισμός"><input type="image" name="reset" src="images/clear.png"   onClick="frm870.reset(); return false;" > </a>
<a title="Αναζήτηση"> <input type="image" name="Submit" src="images/view.png"   onClick="loop=0;
 if ((Val_num(document.frm870.Rn,'Α/Α') == false)) 
 {document.frm870.Rn.focus();loop=1; return false;} else {chk='';
 if ((Val_num(document.frm870.User_Id,'Στοιχεία Χρήστη') == false)) 
 {document.frm870.User_Id.focus();loop=1; return false;} else {chk='';
 if ((Val_num(document.frm870.Lesson_Id,'Α/Α Μαθήματος') == false)) 
 {document.frm870.Lesson_Id.focus();loop=1; return false;} else {chk='';
if (document.form870.Fr_Lesson_Date_h.value == ''){
if ((Val_Dt(document.frm870.Fr_Lesson_Date,'¨Εναρξη Μαθήματος','DD/MM/YYYY') == false)) 
 {document.frm870.Fr_Lesson_Date.focus();loop=1; return false;} else {chk='';
if (document.form870.To_Lesson_Date_h.value == ''){
if ((Val_Dt(document.frm870.To_Lesson_Date,'Λήξη Μαθήματος','DD/MM/YYYY') == false)) 
 {document.frm870.To_Lesson_Date.focus();loop=1; return false;} else {chk='';
 if ((Val_num(document.frm870.Answer_Id,'Απάντηση Μαθητή') == false)) 
 {document.frm870.Answer_Id.focus();loop=1; return false;} else {chk='';

}}}}}}}}
if(loop==0){  frm870.submit();}
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
