<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=iso-8859-7" language="java" import="javax.sql.*, java.sql.*,javax.naming.*,oracle.jdbc.pool.*" errorPage="" %>
<%@ page import="java.util.*" %>
<html>
<head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-7" />
<%@ include file="LessonsAnswers_m_ins.jsp" %>
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


	<title></title>
	<link rel="stylesheet" href="css/main.css" type="text/css">
<SCRIPT LANGUAGE="JavaScript" SRC="callajax.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript" SRC="Valflds.js"></SCRIPT>
</head>
<body 
 bgcolor="#F4F4DD"  leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<%@ include file="lock.jsp"%>
<div id="D_Top"> </div>
<form name="f835" method="post" action="">
<table class="t1"  align="center"> 
<tr>

<td colspan="4" >
<div class="btn1"  align="right">
<a title="Καθαρισμός"><input   id="ftb1"   type="image" src="images/clear.png"   onClick="f835.reset(); return false;"></a>
<a title="Κριτήρια Αναζήτησης"><input type="image"   id="find" src="images/find.png"  onClick="frm835.action='LessonsAnswers_m_k.jsp';frm835.submit();" ></a>
<a title="Καταχώρηση"><input   id="ftb2"    type="image" src="images/save.png"  onClick="loop=0;
 if ((Val_num(document.f835.Id_Les_Ans,'Α/Α') == false)) 
 {document.f835.Id_Les_Ans.focus();loop=1; return false;} else {chk='';
 if ((Val_null(document.f835.Lesson_Id,'Μάθημα') == false)||(Val_num(document.f835.Lesson_Id,'Μάθημα') == false)) 
{document.f835.Lesson_Id.focus();loop=1; return false;} else {chk='';
 if ((Val_null(document.f835.User_Id,'Στοιχεία Μαθητή') == false)||(Val_num(document.f835.User_Id,'Στοιχεία Μαθητή') == false)) 
{document.f835.User_Id.focus();loop=1; return false;} else {chk='';
 if ((Val_num(document.f835.Answer_Id,'Απάντηση') == false)) 
 {document.f835.Answer_Id.focus();loop=1; return false;} else {chk='';
 if ((Val_null(document.f835.Answer_Date,'Ημ/νια Απάντησης') == false)||(Val_Dt(document.f835.Answer_Date,'Ημ/νια Απάντησης','DD/MM/YYYY') == false)) 
 {document.f835.Answer_Date.focus();loop=1; return false;} else {chk='';

}}}}}
if(loop==0){  f835.submit();}
" ></a>
</div>
</tr>
 <tr bgcolor="#82A7E3">
           <td    colspan="1"><div id="hdr" onClick="getElementById('txtHint').style.display = 'none'; " >Καταχώρηση Απάντησης Μαθητή </div></td>
        </tr><TR><TD>
<table align="center"  style="width:auto"><TR>
<TD><fieldset>
<legend><b></b></legend>
<table>
<tr>
<th>Α/Α:</th>
<td ><input name="Id_Les_Ans" id="Id_Les_Ans" type="text" size="22" maxlength="22"  readonly="readonly" 
                 onKeyPress="return (event.keyCode == 13?false:true);"
                 TITLE="ΔΩΣΕ Id_Les_Ans:"
 class="nm" 
                 onBlur="  if ((Val_num(this,'Α/Α') == false))  {this.focus();} else {chk='';}"
>
</td>
</tr>
<tr>
<th style="color:#0033FF">Μάθημα: *</th>
<td >        <% stm_RstLst="select  lesson_id, lesson_descr ||' '||chapter_idd     dsp_perig from vw_lessons  where 1=1 "+" and lesson_id = "+session.getAttribute("Curr_Lesson_id") +" order by DSP_PERIG ";
         StatementRstLst = ConnRstLst.prepareStatement(stm_RstLst);
         RstLst = StatementRstLst.executeQuery();
         RstLst_isEmpty = !RstLst.next();
         RstLst_hasData = !RstLst_isEmpty;
         Repeat__index = 0;
         Repeat__numRows = -1;
        %>
        <select name="Lesson_Id" size="1" 
 onblur=" if ((Val_null(this,'Μάθημα') == false)||(Val_num(this,'Μάθημα') == false))  {this.focus();} else {chk='';}"
                 TITLE="ΔΩΣΕ Lesson_Id:"
>
           
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
<th style="color:#0033FF">Στοιχεία Μαθητή: *</th>
<td >        <% stm_RstLst="select user_id, '('||user_name||') '|| first_name||' '|| last_name   dsp_perig from vw_users where 1 = 1 and user_id = "+session.getAttribute("UserId")+" order by DSP_PERIG ";
         StatementRstLst = ConnRstLst.prepareStatement(stm_RstLst);
         RstLst = StatementRstLst.executeQuery();
         RstLst_isEmpty = !RstLst.next();
         RstLst_hasData = !RstLst_isEmpty;
         Repeat__index = 0;
         Repeat__numRows = -1;
        %>
        <select name="User_Id" size="1" 
 onblur=" if ((Val_null(this,'Στοιχεία Μαθητή') == false)||(Val_num(this,'Στοιχεία Μαθητή') == false))  {this.focus();} else {chk='';}"
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
<th>Απάντηση:</th>
<td >        <% stm_RstLst="select id, descr_answer  dsp_perig from answers where 1 = 1  order by DSP_PERIG ";
         StatementRstLst = ConnRstLst.prepareStatement(stm_RstLst);
         RstLst = StatementRstLst.executeQuery();
         RstLst_isEmpty = !RstLst.next();
         RstLst_hasData = !RstLst_isEmpty;
         Repeat__index = 0;
         Repeat__numRows = -1;
        %>
        <select name="Answer_Id" size="1" 
 onblur=" if ((Val_num(this,'Απάντηση') == false))  {this.focus();} else {chk='';}"
                 TITLE="ΔΩΣΕ Answer_Id:"
>
          <option   selected="selected" value="">
		         </option>
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
</TR></table><tr>

<td colspan="4" >
<div class="btn1"  align="right">
<a title="Καθαρισμός"><input   id="ftb1"   type="image" src="images/clear.png"   onClick="f835.reset(); return false;"></a>
<a title="Κριτήρια Αναζήτησης"><input type="image"   id="find" src="images/find.png"  onClick="frm835.action='LessonsAnswers_m_k.jsp';frm835.submit();" ></a>
<a title="Καταχώρηση"><input   id="ftb2"    type="image" src="images/save.png"  onClick="loop=0;
 if ((Val_num(document.f835.Id_Les_Ans,'Α/Α') == false)) 
 {document.f835.Id_Les_Ans.focus();loop=1; return false;} else {chk='';
 if ((Val_null(document.f835.Lesson_Id,'Μάθημα') == false)||(Val_num(document.f835.Lesson_Id,'Μάθημα') == false)) 
{document.f835.Lesson_Id.focus();loop=1; return false;} else {chk='';
 if ((Val_null(document.f835.User_Id,'Στοιχεία Μαθητή') == false)||(Val_num(document.f835.User_Id,'Στοιχεία Μαθητή') == false)) 
{document.f835.User_Id.focus();loop=1; return false;} else {chk='';
 if ((Val_num(document.f835.Answer_Id,'Απάντηση') == false)) 
 {document.f835.Answer_Id.focus();loop=1; return false;} else {chk='';
 

}}}}
if(loop==0){  f835.submit();}
" ></a>
</div>
<div align="left" style="color:#0033FF">(*) Υποχρεωτική η συμπλήρωση των πεδίων
     <input type="hidden" name="flag_i" value="1">
</div>
</tr>
</table >
<%
 }
catch(SQLException eLst) { 
System.out.println("(APPL_NO_4="+")"+ ")"+ stm_RstLst);
						            System.out.println("(APPL_NO_eLst="+")"+
		 				                  "- ORA_ERROR_MESSAGE= "+eLst.getMessage());
												out.write("<div align='center' style='color:#FF0000'>ΠΡΟΒΛΗΜΑ ΕΦΑΡΜΟΓΗΣ :"+
		 												  "(APPL_NO_eLst ="+") "+ eLst.getMessage()+
		          						  				  "</div>"); %>
					   <%//@ include file="footer_catch.jsp"%>
					   <%
				
					   }
finally {ConnRstLst.close();
}
%>

</form>
</div>
</div>
<div >
</div>
</body>
 <link rel="stylesheet" type="text/css" href="js/jquery/Dates_js/jquery.datetimepicker.css"/> 
 <script src="js/jquery/Dates_js/jquery.js"></script>
      <script src="js/jquery/Dates_js/jquery.datetimepicker.js"></script>
      <script src="js/jquery/Dates_js/Dates.js"></script>


</html>
